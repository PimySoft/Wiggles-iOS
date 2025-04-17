//
//  DetailsView.swift
//  Wiggles-iOS
//
//  Created by Sameer Nawaz on 02/03/21.
//

import SwiftUI

struct DetailsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var viewModel: DetailsViewModel
    
    init(model: DogModel) {
        viewModel = DetailsViewModel(model: model)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.primary_color.edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ZStack(alignment: .top) {
                            Image(viewModel.model.image).resizable()
                                .frame(height: 400).frame(maxWidth: .infinity)
                                .accessibilityIdentifier("Dog Picture")
                                .accessibilityLabel("Dog Picture")
                            HStack {
                                Button(action: { self.presentationMode.wrappedValue.dismiss() },
                                       label: { Image(IMAGE_BACK_ICON).resizable().frame(width: 34, height: 34) })
                                            .accessibilityIdentifier("Back")
                                            .accessibilityLabel("List Page")
                                Spacer()
                                Button(action: { viewModel.favouriteMethod() },
                                       label: { Image(IMAGE_FAV_ICON).resizable().frame(width: 26, height: 26) })
                                            .accessibilityIdentifier("Fav Button")
                                            .accessibilityLabel("Add To Favourites")
                            }.padding(.horizontal, 24).padding(.top, 46)


                        }
                        Group {
                            HStack {
                                Text(viewModel.model.name).modifier(SailecFont(.bold, size: 24)).lineLimit(1)
                                    .foregroundColor(Color.text_primary_color)
                                    .accessibilityIdentifier("Name")
                                    .accessibilityValue(viewModel.model.name)
                                Spacer()
                                GenderView(isMale: viewModel.model.gender == "male")
                                    .accessibilityIdentifier("Gender")
                                    .accessibilityLabel("Gender")
                                    .accessibilityValue(viewModel.model.gender)
                            }.padding(.vertical, 8)


                            
                            HStack(alignment: .center) {
                                HStack(alignment: .center, spacing: 2) {
                                    Image(IMAGE_LOC_ICON).resizable().frame(width: 24, height: 24)
                                    Text("\(viewModel.model.location) away").modifier(SailecFont(.regular, size: 14))
                                        .foregroundColor(Color.text_primary_color).padding(.top, 2)
                                        .accessibilityIdentifier("Distance")
                                        .accessibilityLabel("Distance")
                                        .accessibilityValue(viewModel.model.location)
                                }
                                Spacer()
                                Text("\(viewModel.model.age) yrs | \(viewModel.model.about)").modifier(SailecFont(.regular, size: 14))
                                    .lineLimit(1).foregroundColor(Color.text_primary_color)
                            }
                            
                            HStack {
                                Text("12 min ago").modifier(SailecFont(.regular, size: 14))
                                    .foregroundColor(Color.text_primary_color)
                                Spacer()
                            }.padding(.leading, 6).padding(.top, 2)
                                .accessibilityIdentifier("Time")
                                .accessibilityLabel("Post date")
                                .accessibilityValue("12 min ago")
                            
                            VStack(spacing: 16) {
                                HStack {
                                    Text("My Story").modifier(SailecFont(.bold, size: 18))
                                        .foregroundColor(Color.text_primary_color)
                                    Spacer()
                                }
                                Text(viewModel.story).modifier(SailecFont(.regular, size: 16))
                                    .foregroundColor(Color.text_primary_color)
                            }.padding(.vertical, 16)
                                .accessibilityIdentifier("Dog Story")
                            
                            VStack(spacing: 16) {
                                HStack {
                                    Text("Quick Info").modifier(SailecFont(.bold, size: 18))
                                        .foregroundColor(Color.text_primary_color)
                                    Spacer()
                                }
                                HStack(spacing: 8) {
                                    DetailsInfoView(primary: "\(viewModel.model.age) yrs", secondary: "Age")
                                    DetailsInfoView(primary: "\(viewModel.model.color)", secondary: "Color")
                                    DetailsInfoView(primary: "\(viewModel.model.weight)", secondary: "Weight")
                                }
                            }.padding(.vertical, 16)
                            
                            VStack(spacing: 16) {
                                HStack {
                                    Text("Owner Info").modifier(SailecFont(.bold, size: 18))
                                    Spacer()
                                }
                                DetailsOwnerView(image: viewModel.model.owner.image, name: viewModel.model.owner.name, bio: viewModel.model.owner.bio, messageMethod: viewModel.messageMethod)
                            }.padding(.vertical, 16)
                            
                            Button(action: { viewModel.adoptMethod() },
                                   label: { Text("Adopt me").modifier(SailecFont(.medium, size: 16)).foregroundColor(.white) })
                                .frame(height: 50).frame(maxWidth: .infinity)
                                .background(Color.main_color).cornerRadius(8)
                                .padding(.vertical, 24)
                                .accessibilityIdentifier("Adopt Me")
                                .accessibilityLabel("Adopt Me")
                            
                        }.padding(.horizontal, 16).padding(.top, 8)
                    }.background(Color.primary_color)
                    
                    Spacer()
                    Spacer().frame(height: 150)
                }
                .edgesIgnoringSafeArea(.all)
                .navigationBarHidden(true)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct DetailsOwnerView: View {
    var image: String, name: String, bio: String
    var messageMethod: () -> ()
    var body: some View {
        HStack {
            Image(image).resizable().scaledToFill().frame(width: 60, height: 60).cornerRadius(30)
                .foregroundColor(Color.text_primary_color)
                .accessibilityIdentifier("Owner Picture")
                .accessibilityLabel("Owner Picture")
            VStack(alignment: .leading, spacing: 8) {
                Text(name).modifier(SailecFont(.medium, size: 16))
                    .foregroundColor(Color.text_primary_color)
                    .accessibilityIdentifier("Owner Name")
                Text(bio).modifier(SailecFont(.regular, size: 14))
                    .foregroundColor(Color(hex: "828282"))
                    .accessibilityIdentifier("Owner Bio")
            }.padding(.leading, 8)
            Spacer()
            Button(action: { self.messageMethod() },
                   label: { Image(IMAGE_MSG_ICON).resizable().frame(width: 20, height: 20) })
                .frame(width: 45, height: 45).background(Color.main_color).cornerRadius(25)
                .accessibilityIdentifier("Contact Owner")
                .accessibilityLabel("Contact Owner")
        }
    }
}

struct DetailsInfoView: View {
    var primary: String, secondary: String
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 8) {
                Text(primary).modifier(SailecFont(.medium, size: 16))
                    .foregroundColor(Color.text_primary_color)
                Text(secondary).modifier(SailecFont(.regular, size: 12))
                    .foregroundColor(Color(hex: "828282"))
            }
            Spacer()
        }
        .padding(.vertical, 12)
        .background(Color.secondary_color)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "DDDDDD"), lineWidth: 0.25)
        )
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailsView(model: DogData.dogs[0])
        }
    }
}
