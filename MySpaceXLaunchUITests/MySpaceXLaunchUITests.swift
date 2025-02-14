//
//  MySpaceXLaunchUITests.swift
//  MySpaceXLaunchUITests
//
//  Created by Shabi Naqvi on 07/08/22.
//

import XCTest

class MySpaceXLaunchUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}



Feature: Account Services-Mobile: View Balance and Share Account details
As a user
I want to view the account balance in Accounts tab, use share icon in BOX Mobile App,
so that I can share my account details.
@Display Account Details
Scenario: Display Account Details
Given user ‘TEST1234’ is logged into the Mobile App
When The user navigates to Accounts tab from the bottom menu options
Then The user should be able to view below details in the blue card
Account Name: TBS Smart Business Demo AC
Account Balance: 850,987.20 AED
Account Number: 89373772394
Account type: Call account
@TruncateAccountName
Scenario: Truncate Account Name display when long
Given user ‘TRUNC67’ is logged into the Mobile App
When The user navigates to Accounts tab from the bottom menu options
Then The user should be able to view below details in the blue card
Account Name: Transaction Banking Business On(...)
Account Balance: 72,000.60 AED
Account Number: 1011000915221
Account type: CURRENT ACCOUNT
@BalanceinMillion
Scenario: Convert Balance in Million
Given user ‘MillionBalance’ is logged into the Mobile App
When The user navigates to Accounts tab from the bottom menu options
Then The user should be able to view below details in the blue card
Account Name: Transaction Banking Business
Account Balance: 1.12M AED
Account Number: 4011000915200002
Account type: LC SIGHT
@LongAccounttype
Scenario: Account type string is long
Given user ‘1TestAccounttype’ is logged into the Mobile App
When The user navigates to Accounts tab from the bottom menu options
Then The user should be able to view below details in the blue card
Account Name: AAA YMNAA XXC
Account Balance: 120,430.6723 AED
Account Number: 1021000915202
Account type: CURRENT ACCOUNT FOREIGN CCY
@Shareicon
Scenario: Share icon
Given user ‘Share@icon’ is logged into the Mobile App
When The user clicks on the share icon
Then The Social share options should be displayed as per the User's mobile device
And options to share the Account details will be displayed as below
Account Number: 89373772394
Account Name: TBS Smart Business Demo AC
Bank Name: Emirates NBD




Feature: Account Services - Mobile: View Balance and Share Account details
  As a user
  I want to view the account balance in the Accounts tab and use the share icon in the BOX Mobile App,
  so that I can share my account details.

  @DisplayAccountDetails
  Scenario: Display Account Details
    Given user "TEST1234" is logged into the Mobile App
    When The user navigates to Accounts tab from the bottom menu options
    Then The user should see the correct account details

  @TruncateAccountName
  Scenario: Truncate Account Name display when long
    Given user "TRUNC67" is logged into the Mobile App
    When The user navigates to Accounts tab from the bottom menu options
    Then The user should see the correct account details

  @BalanceInMillion
  Scenario: Convert Balance in Million
    Given user "MillionBalance" is logged into the Mobile App
    When The user navigates to Accounts tab from the bottom menu options
    Then The user should see the correct account details

  @LongAccountType
  Scenario: Account type string is long
    Given user "1TestAccountType" is logged into the Mobile App
    When The user navigates to Accounts tab from the bottom menu options
    Then The user should see the correct account details


