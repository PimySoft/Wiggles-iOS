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
        XCTAssertTrue(plp.isLoaded())
        plp.tapFirstPuppy()
        let pdp = PuppyDetailsPage(app: app)
        XCTAssertTrue(pdp.puppyNameExists())
        XCTAssertTrue(pdp.dogPictureExists())
        XCTAssertTrue(pdp.genderExists())
        XCTAssertTrue(pdp.distanceExists())
        XCTAssertTrue(pdp.timeExists())
        XCTAssertTrue(pdp.ownerPictureExists())
        XCTAssertTrue(pdp.ownerNameExists())
        XCTAssertTrue(pdp.ownerBioExists())
        XCTAssertTrue(pdp.contactButtonExists())
        XCTAssertTrue(pdp.adoptMeButtonExists())
        pdp.tapFavorite()
        pdp.goBack()
        XCTAssertTrue(plp.isLoaded())
    }
}
