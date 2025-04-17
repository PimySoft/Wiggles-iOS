import XCTest

class PuppyListingPage {
    let app: XCUIApplication

    // MARK: - Init

    init(app: XCUIApplication) {
        self.app = app
    }

    // MARK: - UI Elements

    var userName: XCUIElement { app.staticTexts["User Name"] }
    var puppyCards: XCUIElementQuery { app.buttons.matching(identifier: "Dog Card") }

    // MARK: - State

    var hasUserName: Bool { userName.exists }
    var hasPuppyCards: Bool {
        let firstCard = puppyCards.element(boundBy: 0)
        return firstCard.waitForExistence(timeout: 5)
    }

    // MARK: - Actions

    func tapLastPuppy() {
        let lastIndex = puppyCards.count - 1
        guard lastIndex >= 0 else { return }

        puppyCards.element(boundBy: lastIndex).tap()
    }
}
