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



{
  "transactions": [
    {
      "type": "CHARGESEPHCOP35805C34BG 253536363636 DTB BANK CHARGE SREDIFTSANITY2312 25-53533638-1-151 – AE0033958",
      "amount": "-2.00 AED",
      "date": "30 Jan 2025",
      "balance": "Balance: 7,200.00 AED",
      "referenceNumber": "1100023452"
    },
    {
      "type": "IFT-DTB TT REF EPHCOP35805C34BG 326362383882 CA2 ADD21 ADD2 ADD3 @2.6186 REDIFTSANITY2312 25-2363627-1-151 – AE0042200",
      "amount": "-200,000.45 AED",
      "date": "30 Jan 2025",
      "balance": "Balance: 120,000.45 AED",
      "referenceNumber": "1100023440"
    },
    {
      "type": "DFT-DTB TT REF EPHCOP35805C34BG 326362383882 TEST TEST @2.6186 REDIFTSANITY2312 25-2363627-1-151 – AE0012345",
      "amount": "61,000.00 AED",
      "date": "07 Jan 2025",
      "balance": "Balance: 251,000.00 AED",
      "referenceNumber": "1100011000"
    },
    {
      "type": "CHARGESEPHCOP35805C34BG 253536363636 DTB BANK CHARGE SREDIFTSANITY2312 25-53533638-1-151 – AE0067452",
      "amount": "-0.05 AED",
      "date": "25 Dec 2024",
      "balance": "Balance: 10,540.05 AED",
      "referenceNumber": "1100000912"
    },
    {
      "type": "DFT-DTB TT REF EPHCOP35805C34BG 326362383882 TEST TEST @2.6186 REDIFTSANITY2312 25-2363627-1-151 – AE0021345",
      "amount": "-14,809.245 AED",
      "date": "22 Aug 2024",
      "balance": "Balance: 214,809.245 AED",
      "referenceNumber": "0198700356"
    }
  ]
}


import { Given, When, Then } from '@wdio/cucumber-framework';
import fs from 'fs';  // Import fs module to read JSON data
import TransactionPage from '../pageObjects/TransactionPage';

Given(/^user "([^"]*)" is logged into the Mobile App$/, async (userType) => {
    await TransactionPage.login(userType);  // Logs in the user
});

When(/^the user navigates to the Transactions screen$/, async () => {
    await TransactionPage.navigateToTransactions();  // Opens transactions screen
});

Then(/^the user should see the transactions from the mock data$/, async () => {
    // Read the mock transaction data from the JSON file
    const mockData = JSON.parse(fs.readFileSync('path_to_your_mock_data.json', 'utf8')).transactions;
    
    // Compare each transaction from the UI with the expected mock data based on the identifier
    await TransactionPage.validateTransactionsFromMockData(mockData);
});


class TransactionPage {
    // Method to log in the user, assuming it's implemented elsewhere
    async login(userType: string) {
        // Perform login logic
    }

    // Navigate to the transactions screen
    async navigateToTransactions() {
        // Navigate to the screen containing the transactions
    }

    // Validate all transactions based on mock data
    async validateTransactionsFromMockData(mockData: Array<any>) {
        const uiTransactions = await this.getAllTransactionsFromUI();

        // Compare each transaction from the UI with the mock data
        for (let i = 0; i < mockData.length; i++) {
            const mock = mockData[i];
            const uiTransaction = uiTransactions[i];

            // Compare the mock data with the UI data
            if (mock.type !== uiTransaction.type || mock.amount !== uiTransaction.amount || mock.balance !== uiTransaction.balance || mock.referenceNumber !== uiTransaction.referenceNumber) {
                throw new Error(`Transaction mismatch at index ${i}. Expected: ${JSON.stringify(mock)}, Found: ${JSON.stringify(uiTransaction)}`);
            }
        }
    }

    // Fetch all transactions displayed in the UI
    async getAllTransactionsFromUI() {
        const transactions = [];
        const numberOfTransactions = 5;  // Adjust this if the number of rows is dynamic

        for (let i = 0; i < numberOfTransactions; i++) {
            // Generate the selector dynamically based on the index (e.g., 'type_0', 'amount_0', 'balance_0')
            const typeSelector = `type_${i}`;
            const amountSelector = `amount_${i}`;
            const balanceSelector = `balance_${i}`;
            const referenceNumberSelector = `referenceNumber_${i}`;
            
            // Fetch the transaction element based on the dynamic selectors
            const typeElement = await this.driver.$(`*=${typeSelector}`);
            const amountElement = await this.driver.$(`*=${amountSelector}`);
            const balanceElement = await this.driver.$(`*=${balanceSelector}`);
            const referenceNumberElement = await this.driver.$(`*=${referenceNumberSelector}`);
            
            // Get the text for each field
            const type = await typeElement.getText();
            const amount = await amountElement.getText();
            const balance = await balanceElement.getText();
            const referenceNumber = await referenceNumberElement.getText();
            
            // Push the transaction details into the transactions array
            transactions.push({ type, amount, balance, referenceNumber });
        }

        return transactions;
    }
}

export default new TransactionPage();


