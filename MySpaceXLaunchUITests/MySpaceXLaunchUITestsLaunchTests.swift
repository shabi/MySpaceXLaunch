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

Feature: Validate Transactions List Screen

  Scenario: Validate transaction list with mock data
    Given user "User1" is logged into the Mobile App
    When the user navigates to the Transactions screen
    Then the user should see the following transactions:
      | Name                             | Amount       | Balance       |
      | DTB Bank Charge                  | -2.00 AED   | 7,200.00 AED  |
      | IFT-DTB TT REF                    | -200,000.45 AED | 120,000.45 AED |
      | DFT-DTB TT REF                    | 61,000.00 AED | 251,000.00 AED |
      | CHARGESEPHCOP                     | -0.05 AED   | 10,540.05 AED |
      | TEST TRANSACTION                   | -14,809.245 AED | 214,809.245 AED |



transactionSteps.ts

import { Given, When, Then } from '@wdio/cucumber-framework';
import TransactionPage from '../pageObjects/TransactionPage';

Given(/^user "([^"]*)" is logged into the Mobile App$/, async (userType) => {
    await TransactionPage.login(userType);  // Logs in the user
});

When(/^the user navigates to the Transactions screen$/, async () => {
    await TransactionPage.navigateToTransactions();  // Opens transactions screen
});

Then(/^the user should see the following transactions:$/, async (table) => {
    const expectedTransactions = table.hashes();
    await TransactionPage.validateTransactions(expectedTransactions);  // Compares data
});


ransactionPage.ts

import { expect } from '@wdio/globals';

class TransactionPage {
    
    // Locators (change based on actual accessibility identifiers)
    private transactionRows = $$('//*[@accessibilityIdentifier="transactionRow"]');
    
    async login(userType: string) {
        // Mock login step if needed
        console.log(`Logging in as ${userType}`);
    }

    async navigateToTransactions() {
        const transactionsTab = await $('//*[@accessibilityIdentifier="transactionsTab"]');
        await transactionsTab.click();
    }

    async validateTransactions(expectedTransactions: any[]) {
        const rows = await this.transactionRows;
        expect(rows.length).toBe(expectedTransactions.length);

        for (let i = 0; i < expectedTransactions.length; i++) {
            const name = await rows[i].$('//*[@accessibilityIdentifier="transactionName"]').getText();
            const amount = await rows[i].$('//*[@accessibilityIdentifier="transactionAmount"]').getText();
            const balance = await rows[i].$('//*[@accessibilityIdentifier="transactionBalance"]').getText();

            expect(name).toBe(expectedTransactions[i].Name);
            expect(amount).toBe(expectedTransactions[i].Amount);
            expect(balance).toBe(expectedTransactions[i].Balance);
        }
    }
}

export default new TransactionPage();
