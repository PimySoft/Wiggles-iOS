import XCTest

class WigglesUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    func testNavigationToPDPAndBack() {
        let plp = PuppyListingPage(app: app)
        let pdp = PuppyDetailsPage(app: app)

        XCTAssertTrue(plp.hasPuppyCards, "Expected at least one puppy card on listing page.")
        plp.tapLastPuppy()
        XCTAssertTrue(pdp.cardDetails, "Expected PDP to load successfully.")
        pdp.tapFavorite()
        pdp.goBack()
        XCTAssertTrue(plp.hasPuppyCards, "Expected to return to the listing page.")
    }
}

