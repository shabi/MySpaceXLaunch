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
IosAccountPage 
import { $ } from '@wdio/globals';
import { ChainablePromiseElement } from 'webdriverio';

class IosAccountPage {
    public get accountNameField(): ChainablePromiseElement<WebdriverIO.Element> {
        return $('~accountName');
    }

    public get accountBalanceField(): ChainablePromiseElement<WebdriverIO.Element> {
        return $('~accountBalance');
    }

    public get accountNumberField(): ChainablePromiseElement<WebdriverIO.Element> {
        return $('~accountNumber');
    }

    public get accountTypeField(): ChainablePromiseElement<WebdriverIO.Element> {
        return $('~accountType');
    }

    public async setTextById(identifier: string, value: string) {
        const element = await $(`~${identifier}`);
        await element.setValue(value);
    }

    public async getAccountName(): Promise<string> {
        return this.accountNameField.getText();
    }

    public async getAccountBalance(): Promise<string> {
        return this.accountBalanceField.getText();
    }

    public async getAccountNumber(): Promise<string> {
        return this.accountNumberField.getText();
    }

    public async getAccountType(): Promise<string> {
        return this.accountTypeField.getText();
    }
}

struct AccountData: Identifiable, Codable {
    let id = UUID()
    var accountName: String
    var accountBalance: String
    var accountNumber: String
    var accountType: String
}
@State private var testAccountData: AccountData = AccountData(
        accountName: "Default Name",
        accountBalance: "0.00 AED",
        accountNumber: "00000000",
        accountType: "Default Type"
    )

export default new IosAccountPage();


import { Given, When, Then } from '@wdio/cucumber-framework';
import IosAccountPage from '../../pageobjects/ios/ios.account.page.js';
import { expect } from 'chai';

Given("user {string} is logged into the Mobile App", async function (userId) {
    console.log(`User ${userId} is logged in`);
});

When("the user navigates to the Accounts tab", async function () {
    console.log("Navigated to Accounts tab");
});

When("I set the account details", async function () {
    await IosAccountPage.setTextById("accountName", "Transaction Banking Business On(...)");
    await IosAccountPage.setTextById("accountBalance", "72,000.60 AED");
    await IosAccountPage.setTextById("accountNumber", "1011000915221");
    await IosAccountPage.setTextById("accountType", "CURRENT ACCOUNT");
});

Then("the user should see the following values in the blue card:", async function (dataTable) {
    const expectedData = dataTable.rowsHash();

    const actualData = {
        accountName: await IosAccountPage.getAccountName(),
        accountBalance: await IosAccountPage.getAccountBalance(),
        accountNumber: await IosAccountPage.getAccountNumber(),
        accountType: await IosAccountPage.getAccountType(),
    };

    for (const key in expectedData) {
        expect(actualData[key]).to.equal(expectedData[key], `Mismatch in ${key}`);
    }
});


Feature: Account Services-Mobile: View Balance and Share Account details
  As a user
  I want to view the account balance in Accounts tab, use share icon in BOX Mobile App,
  so that I can share my account details.

  @DisplayAccountDetails
  Scenario: Display Account Details
    Given user "TEST1234" is logged into the Mobile App
    When the user navigates to the Accounts tab
    When I set the account details
    Then the user should see the following values in the blue card:
      | Identifier      | Expected Value                        |
      | accountName     | TBS Smart Business Demo AC           |
      | accountBalance  | 850,987.20 AED                       |
      | accountNumber   | 89373772394                          |
      | accountType     | Call account                         |

  @TruncateAccountName
  Scenario: Truncate Account Name display when long
    Given user "TRUNC67" is logged into the Mobile App
    When the user navigates to the Accounts tab
    When I set the account details
    Then the user should see the following values in the blue card:
      | Identifier      | Expected Value                        |
      | accountName     | Transaction Banking Business On(...) |
      | accountBalance  | 72,000.60 AED                        |
      | accountNumber   | 1011000915221                        |
      | accountType     | CURRENT ACCOUNT                      |

  @BalanceinMillion
  Scenario: Convert Balance in Million
    Given user "MillionBalance" is logged into the Mobile App
    When the user navigates to the Accounts tab
    When I set the account details
    Then the user should see the following values in the blue card:
      | Identifier      | Expected Value |
      | accountName     | Transaction Banking Business |
      | accountBalance  | 1.12M AED |
      | accountNumber   | 4011000915200002 |
      | accountType     | LC SIGHT |

  @LongAccounttype
  Scenario: Account type string is long
    Given user "1TestAccounttype" is logged into the Mobile App
    When the user navigates to the Accounts tab
    When I set the account details
    Then the user should see the following values in the blue card:
      | Identifier      | Expected Value |
      | accountName     | AAA YMNAA XXC |
      | accountBalance  | 120,430.6723 AED |
      | accountNumber   | 1021000915202 |
      | accountType     | CURRENT ACCOUNT FOREIGN CCY |

