//
//  MySpaceXLaunchUITestsLaunchTests.swift
//  MySpaceXLaunchUITests
//
//  Created by Shabi Naqvi on 07/08/22.
//

import XCTest

class MySpaceXLaunchUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}

Feature: Account Services: Accounts menu enablement on Header

As a Client User, I want to see the Accounts tab on the bottom menu options, so that I
can quickly access my account – related features and navigate easily.
@Successful login
Scenario: Successful login
Given user ‘TEST1234’ has successfully logged into Application,
When the system loads the screen
Then the user should have the Accounts tab on the bottom menu options which will be
static across the functions of Account Services.


@Disabled Accounts menu
Scenario: Accounts menu not seen
Given user ‘NEGATIVETEST1’ has successfully logged into Application,
When the system loads the screen
Then the user should NOT have the Accounts tab on the bottom menu options which will
be static across the functions of Account Services.
