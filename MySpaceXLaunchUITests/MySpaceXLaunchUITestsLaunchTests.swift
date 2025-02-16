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
        if let jsonString = ProcessInfo.processInfo.environment["accountData"],
           let data = jsonString.data(using: .utf8),
           let decodedData = try? JSONDecoder().decode(CardInfoModel.self, from: data) {
            DispatchQueue.main.async {
                self.cardInfoModel = decodedData
            }
        }
    }
}

accountTest
import { remote } from "webdriverio";
import { expect } from "chai";

const testCases = [
    {
        accountNameText: "TBS Smart Business Demo AC",
        accountAmountText: "850,987.20 AED",
        accountNumberText: "89373772394",
        accountTypeText: "Call account"
    },
    {
        accountNameText: "Transaction Banking Business On(...)",
        accountAmountText: "72,000.60 AED",
        accountNumberText: "1011000915221",
        accountTypeText: "CURRENT ACCOUNT"
    },
    {
        accountNameText: "Transaction Banking Business",
        accountAmountText: "1.12M AED",
        accountNumberText: "4011000915200002",
        accountTypeText: "LC SIGHT"
    }
];

describe("Account Card Validation Test", () => {
    let driver;

    before(async () => {
        driver = await remote({
            capabilities: {
                platformName: "iOS",
                "appium:deviceName": "iPhone 14",
                "appium:automationName": "XCUITest",
                "appium:app": "/path/to/your.app",
                "appium:noReset": false
            }
        });
    });

    after(async () => {
        await driver.quit();
    });

    for (const testData of testCases) {
        it(`Validating Account Card for ${testData.accountNameText}`, async () => {
            const jsonString = JSON.stringify(testData);

            // Inject data into environment variables
            await driver.terminateApp("com.yourapp.bundleid");
            await driver.execute("mobile: launchApp", {
                bundleId: "com.yourapp.bundleid",
                arguments: [],
                environment: {
                    accountData: jsonString
                }
            });

            // Wait for the app to launch and load data
            await driver.pause(3000);

            // Navigate to the Accounts tab
            await $("~AccountsTab").click();

            // Validate UI Elements
            const actualAccountName = await $("~accountNameText").getText();
            const actualBalance = await $("~accountAmountText").getText();
            const actualAccountNumber = await $("~accountNumberText").getText();
            const actualAccountType = await $("~accountTypeText").getText();

            expect(actualAccountName).to.equal(testData.accountNameText);
            expect(actualBalance).to.equal(testData.accountAmountText);
            expect(actualAccountNumber).to.equal(testData.accountNumberText);
            expect(actualAccountType).to.equal(testData.accountTypeText);
        });
    }
});








private func loadMockData() {
        let jsonString = """
        [
            {
                "username": "JohnDoe",
                "account": {
                    "id": "550e8400-e29b-41d4-a716-446655440000",
                    "accountNumber": "1234 5678 9012 3456",
                    "balance": 1250.75,
                    "currency": "USD"
                }
            },
            {
                "username": "JaneSmith",
                "account": {
                    "id": "660e8400-e29b-41d4-a716-446655440001",
                    "accountNumber": "9876 5432 1098 7654",
                    "balance": 2500.50,
                    "currency": "EUR"
                }
            }
        ]
        """
        
        if let jsonData = jsonString.data(using: .utf8) {
            do {
                allUserAccounts = try JSONDecoder().decode([UserAccount].self, from: jsonData)
            } catch {
                print("Failed to decode JSON: \(error.localizedDescription)")
            }
        }
    }
    
    func selectUser(username: String) {
        selectedUserAccount = allUserAccounts.first { $0.username == username }
    }
