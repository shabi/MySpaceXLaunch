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

import SwiftUI

struct ParentView: View {
    @StateObject private var viewModel = AccountViewModel()

    var body: some View {
        VStack {
            CardAccountView(viewModel: viewModel)
        }
        .onAppear {
            viewModel.updateFromJson() // Parse JSON from UserDefaults
        }
    }
}
import SwiftUI

class AccountViewModel: ObservableObject {
    @Published var accountData: AccountData = AccountData(
        accountName: "Default Name",
        accountBalance: "0.00 AED",
        accountNumber: "0000000000",
        accountType: "Unknown",
        currency: "AED"
    )

    func updateFromJson() {
        if let jsonString = UserDefaults.standard.string(forKey: "accountData") {
            if let data = jsonString.data(using: .utf8) {
                let decodedData = try? JSONDecoder().decode(AccountData.self, from: data)
                if let newData = decodedData {
                    DispatchQueue.main.async {
                        self.accountData = newData
                    }
                }
            }
        }
    }
}


import SwiftUI

struct CardAccountView: View {
    @ObservedObject var viewModel: AccountViewModel

    var body: some View {
        VStack {
            Text(viewModel.accountData.accountName)
                .lineLimit(1)
                .truncationMode(.tail)
            
            Text(viewModel.accountData.accountBalance)
            Text(viewModel.accountData.accountNumber)
            Text(viewModel.accountData.accountType)
            Text(viewModel.accountData.currency)
        }
        .padding()
        .background(Color.blue)
        .cornerRadius(10)
    }
}


import { ChainablePromiseElement } from 'webdriverio';

export default abstract class BaseAccount {
    protected async setUserDefaults(key: string, jsonValue: Record<string, string>) {
        const jsonString = JSON.stringify(jsonValue);
        await driver.execute(`UserDefaults.standard.set("\${jsonString}", forKey: "\${key}")`);
    }

    protected async getTextById(identifier: string): Promise<string> {
        const element = await $(`~${identifier}`);
        return await element.getText();
    }
}



import BaseAccount from '../base/BaseAccount.js';

class IosAccountPage extends BaseAccount {
    public async setAccountData(jsonData: Record<string, string>) {
        await this.setUserDefaults("accountData", jsonData);
    }

    public async validateAccountData(expectedData: Record<string, string>) {
        for (const [key, expectedValue] of Object.entries(expectedData)) {
            const actualValue = await this.getTextById(key);
            if (actualValue !== expectedValue) {
                throw new Error(`Validation failed for ${key}: Expected "${expectedValue}", but got "${actualValue}"`);
            }
        }
    }
}

export default new IosAccountPage();



import { Given, When, Then } from '@wdio/cucumber-framework';
import IosAccountPage from '../../pageobjects/ios/IosAccountPage.js';

const testData = {
    "TEST1234": {
        accountName: "TBS Smart Business Demo AC",
        accountBalance: "850,987.20 AED",
        accountNumber: "89373772394",
        accountType: "Call account",
        currency: "AED"
    },
    "TRUNC67": {
        accountName: "Transaction Banking Business On(...)",
        accountBalance: "72,000.60 AED",
        accountNumber: "1011000915221",
        accountType: "CURRENT ACCOUNT",
        currency: "AED"
    }
};

Given(/^user "(.*)" is logged into the Mobile App$/, async function (userId) {
    if (!testData[userId]) {
        throw new Error(`No test data found for user: ${userId}`);
    }
    await IosAccountPage.setAccountData(testData[userId]);
});

When("the user navigates to the Accounts tab", async function () {
    console.log("Navigating to Accounts tab...");
});

Then("the user should see the following values in the blue card:", async function () {
    const userId = this.scenarioContext.currentUser;
    if (!testData[userId]) {
        throw new Error(`No test data found for user: ${userId}`);
    }
    await IosAccountPage.validateAccountData(testData[userId]);
});



Feature: Account Services-Mobile: View Balance and Share Account details
  As a user
  I want to view the account balance in the Accounts tab and share details

  @DisplayAccountDetails
  Scenario: Display Account Details
    Given user "TEST1234" is logged into the Mobile App
    When the user navigates to the Accounts tab
    Then the user should see the following values in the blue card:

  @TruncateAccountName
  Scenario: Truncate Account Name display when long
    Given user "TRUNC67" is logged into the Mobile App
    When the user navigates to the Accounts tab
    Then the user should see the following values in the blue card:
