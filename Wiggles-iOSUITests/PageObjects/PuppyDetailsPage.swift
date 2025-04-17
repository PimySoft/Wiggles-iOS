import XCTest

class PuppyDetailsPage {
    let app: XCUIApplication

    // MARK: - Init

    init(app: XCUIApplication) {
        self.app = app
    }

    // MARK: - UI Elements

    var backButton: XCUIElement { app.buttons["Back"] }
    var favoriteButton: XCUIElement { app.buttons["Fav Button"] }
    var dogPicture: XCUIElement { app.images["Dog Picture"] }
    var gender: XCUIElement { app.staticTexts["Gender"] }
    var distance: XCUIElement { app.staticTexts["Distance"] }
    var time: XCUIElement { app.staticTexts["Time"] }
    var dogStory: XCUIElement { app.staticTexts["Dog Story"] }
    var ownerPicture: XCUIElement { app.images["Owner Picture"] }
    var ownerName: XCUIElement { app.staticTexts["Owner Name"] }
    var ownerBio: XCUIElement { app.staticTexts["Owner Bio"] }
    var contactButton: XCUIElement { app.buttons["Contact Owner"] }
    var adoptMeButton: XCUIElement { app.buttons["Adopt Me"] }
    var puppyName: XCUIElement { app.staticTexts["Name"] }

    // MARK: - State

    var cardDetails: Bool {
        puppyName.exists &&
        dogPicture.exists &&
        gender.exists &&
        distance.exists &&
        time.exists &&
        ownerPicture.exists &&
        ownerName.exists &&
        ownerBio.exists &&
        contactButton.exists &&
        adoptMeButton.exists
    }

    // MARK: - Actions

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
