import XCTest

class PuppyListingPage {
    let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    var puppyCards: XCUIElementQuery {
        return app.buttons.matching(identifier: "Dog Card")
    }

    func tapFirstPuppy() {
        puppyCards.element(boundBy: 0).tap()
    }

    func isLoaded() -> Bool {
        return puppyCards.count > 0
    }
}
