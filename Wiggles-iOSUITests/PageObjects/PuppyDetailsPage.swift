import XCTest

class PuppyDetailsPage {
    let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    var backButton: XCUIElement {
        return app.buttons["Back"]
    }

    var favoriteButton: XCUIElement {
        return app.buttons["Fav Button"]
    }
    var dogPicture: XCUIElement {
        return app.images["Dog Picture"]
    }
    
    var gender: XCUIElement {
        return app.staticTexts["Gender"]
    }

    var distance: XCUIElement {
        return app.staticTexts["Distance"]
    }
    
    var time: XCUIElement {
        return app.staticTexts["Time"]
    }
    
    var dogStory: XCUIElement {
        return app.staticTexts["Dog Story"]
    }
    
    var ownerPicture: XCUIElement {
        return app.images["Owner Picture"]
    }
    
    var ownerName: XCUIElement {
        return app.staticTexts["Owner Name"]
    }
    var ownerBio: XCUIElement {
        return app.staticTexts["Owner Bio"]
    }
    
    var contactButton: XCUIElement {
        return app.buttons["Contact Owner"]
    }
    
    var adoptMeButton: XCUIElement {
        return app.buttons["Adopt Me"]
    }

    var puppyName: XCUIElement {
        return app.staticTexts["Parkinson"]
    }

    
    func puppyNameExists() -> Bool {
        return puppyName.exists
    }
  
    func dogPictureExists() -> Bool {
        return dogPicture.exists
    }
    
    func genderExists() -> Bool {
        return gender.exists
    }
    
    func distanceExists() -> Bool {
        return distance.exists
    }
    
    func timeExists() -> Bool {
        return time.exists
    }
    
    func ownerPictureExists() -> Bool {
        return ownerPicture.exists
    }
    
    func ownerNameExists() -> Bool {
        return ownerName.exists
    }
    
    func ownerBioExists() -> Bool {
        return ownerBio.exists
    }
    
    func contactButtonExists() -> Bool {
        return contactButton.exists
    }
    
    func adoptMeButtonExists() -> Bool {
        return adoptMeButton.exists
    }

    
    func tapFavorite() {
        favoriteButton.tap()
    }

    func tapAdoptMe() {
        adoptMeButton.tap()
    }

    func goBack() {
        backButton.tap()
    }
}
