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

import Foundation

public class CardAccountViewModel: ObservableObject {
    @Published var cardInfoModel: CardInfoModel = CardInfoModel()

    public init() {
        loadTestDataIfAvailable()
    }

    private func loadTestDataIfAvailable() {
        if let jsonString = UserDefaults.standard.string(forKey: "accountData"),
           let data = jsonString.data(using: .utf8),
           let decodedData = try? JSONDecoder().decode(CardInfoModel.self, from: data) {
            DispatchQueue.main.async {
                self.cardInfoModel = decodedData
            }
        }
    }
}



import { driver } from "@wdio/globals";

export async function setAccountData(testData: object) {
    const jsonString = JSON.stringify(testData);

    await driver.executeScript(`
        const userDefaults = NSUserDefaults.standardUserDefaults();
        userDefaults.setObjectForKey('${jsonString}', 'accountData');
        userDefaults.synchronize();
    `);

    console.log("Test Data Set:", jsonString);
}

//

await driver.executeScript(`
    objc.import("Foundation");
    let userDefaults = $.NSUserDefaults.standardUserDefaults;
    userDefaults.setObjectForKey("${jsonString}", "accountData");
    userDefaults.synchronize();
`);

import { Given, When, Then } from "@wdio/cucumber-framework";
import { setAccountData } from "../pageObjects/IosAccountPage";
import { expect } from "chai";

Given(/^user "([^"]*)" is logged into the Mobile App$/, async function (userId) {
    let testData;

    switch (userId) {
        case "TRUNC67":
            testData = {
                accountNameText: "Transaction Banking Business On(...)",
                accountAmountText: "72,000.60 AED",
                accountNumberText: "1011000915221",
                accountTypeText: "CURRENT ACCOUNT"
            };
            break;
        case "MillionBalance":
            testData = {
                accountNameText: "Transaction Banking Business",
                accountAmountText: "1.12M AED",
                accountNumberText: "4011000915200002",
                accountTypeText: "LC SIGHT"
            };
            break;
        default:
            throw new Error(`No test data found for user: ${userId}`);
    }

    await setAccountData(testData);
});

When(/^the user navigates to the Accounts tab$/, async function () {
    await $("~AccountsTab").click();
});

Then(/^the user should see the following values in the blue card:$/, async function (dataTable) {
    const expectedData = dataTable.rowsHash();

    const actualAccountName = await $("~accountNameText").getText();
    const actualBalance = await $("~accountAmountText").getText();
    const actualAccountNumber = await $("~accountNumberText").getText();
    const actualAccountType = await $("~accountTypeText").getText();

    expect(actualAccountName).to.equal(expectedData.accountName);
    expect(actualBalance).to.equal(expectedData.accountBalance);
    expect(actualAccountNumber).to.equal(expectedData.accountNumber);
    expect(actualAccountType).to.equal(expectedData.accountType);
});



Feature: Account Card UI Validation
  As a user
  I want to verify that account details are displayed correctly

  @TruncateAccountName
  Scenario: Truncate Account Name display when long
    Given user "TRUNC67" is logged into the Mobile App
    When the user navigates to the Accounts tab
    Then the user should see the following values in the blue card:
      | accountName      | Transaction Banking Business On(...) |
      | accountBalance   | 72,000.60 AED                        |
      | accountNumber    | 1011000915221                        |
      | accountType      | CURRENT ACCOUNT                      |

  @BalanceinMillion
  Scenario: Convert Balance in Million
    Given user "MillionBalance" is logged into the Mobile App
    When the user navigates to the Accounts tab
    Then the user should see the following values in the blue card:
      | accountName      | Transaction Banking Business         |
      | accountBalance   | 1.12M AED                            |
      | accountNumber    | 4011000915200002                     |
      | accountType      | LC SIGHT                             |



import { Given, When, Then } from "@wdio/cucumber-framework";
import { setAccountData } from "../pageObjects/IosAccountPage";
import { expect } from "chai";

Given(/^user "([^"]*)" is logged into the Mobile App$/, async function (userId) {
    let testData;

    switch (userId) {
        case "TRUNC67":
            testData = {
                accountNameText: "Transaction Banking Business On(...)",
                accountAmountText: "72,000.60 AED",
                accountNumberText: "1011000915221",
                accountTypeText: "CURRENT ACCOUNT"
            };
            break;
        case "MillionBalance":
            testData = {
                accountNameText: "Transaction Banking Business",
                accountAmountText: "1.12M AED",
                accountNumberText: "4011000915200002",
                accountTypeText: "LC SIGHT"
            };
            break;
        default:
            throw new Error(`No test data found for user: ${userId}`);
    }

    await setAccountData(testData);
});

When(/^the user navigates to the Accounts tab$/, async function () {
    await $("~AccountsTab").click();
});

Then(/^the user should see the following values in the blue card:$/, async function (dataTable) {
    const expectedData = dataTable.rowsHash();

    const actualAccountName = await $("~accountNameText").getText();
    const actualBalance = await $("~accountAmountText").getText();
    const actualAccountNumber = await $("~accountNumberText").getText();
    const actualAccountType = await $("~accountTypeText").getText();

    expect(actualAccountName).to.equal(expectedData.accountName);
    expect(actualBalance).to.equal(expectedData.accountBalance);
    expect(actualAccountNumber).to.equal(expectedData.accountNumber);
    expect(actualAccountType).to.equal(expectedData.accountType);
});


