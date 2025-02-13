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


import { ChainablePromiseElement } from 'webdriverio';

export class BaseAccount {
    protected driver: WebdriverIO.Browser;

    constructor(driver: WebdriverIO.Browser) {
        this.driver = driver;
    }

    /**
     * Find an element using Accessibility ID.
     * @param id - The accessibility ID of the element
     * @returns The WebdriverIO element
     */
    protected async getElementById(id: string): Promise<ChainablePromiseElement<WebdriverIO.Element>> {
        return await this.driver.$(`~${id}`); // Accessibility ID (~)
    }

    /**
     * Get text from an element using Accessibility ID.
     * @param id - The accessibility ID
     * @returns Text content of the element
     */
    protected async getTextById(id: string): Promise<string> {
        const element = await this.getElementById(id);
        return await element.getText();
    }
}


import { BaseAccount } from './BaseAccount';

export class AccountPage extends BaseAccount {
    private accountNameId = 'Account name: ABC';
    private accountBalanceId = 'Account balance: 8988666';
    private accountNumberId = 'Account number: 8988666';

    constructor(driver: WebdriverIO.Browser) {
        super(driver);
    }

    /**
     * Navigates to the account card screen.
     */
    async navigateToAccountCard() {
        const navigateButton = await this.getElementById('GoToAccountCard');
        await navigateButton.click();
    }

    /**
     * Verifies account details displayed on the card.
     */
    async verifyAccountDetails(expectedDetails: { [key: string]: string }) {
        for (const [label, expectedValue] of Object.entries(expectedDetails)) {
            const elementId = `${label}: ${expectedValue}`;
            const actualText = await this.getTextById(elementId);

            if (actualText !== elementId) {
                throw new Error(`Expected '${elementId}', but found '${actualText}'`);
            }
        }
    }
}


import { Given, When, Then } from '@cucumber/cucumber';
import { remote } from 'webdriverio';
import { AccountPage } from '../pages/AccountPage';

let driver: WebdriverIO.Browser;
let accountPage: AccountPage;

Given('user is logged into the app', async function () {
    driver = await remote({
        capabilities: {
            platformName: 'iOS',
            deviceName: 'iPhone 14 Pro',
            automationName: 'XCUITest',
            app: '/path/to/your.app',
        }
    });

    accountPage = new AccountPage(driver);
    await driver.launchApp();
});

When('the user navigates to the account card', async function () {
    await accountPage.navigateToAccountCard();
});

Then('user should see the following details:', async function (dataTable) {
    const expectedDetails: { [key: string]: string } = {};
    dataTable.raw().forEach(([label, value]) => {
        expectedDetails[label] = value;
    });

    await accountPage.verifyAccountDetails(expectedDetails);
});

