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

/**
 * Base class for common reusable actions and properties.
 */
abstract class BaseAccount {
    /**
     * Abstract method to get text by identifier.
     */
    public abstract getTextById(identifier: string): Promise<string>;

    /**
     * Abstract method to get an element by accessibility ID.
     */
    public abstract getElementById(identifier: string): ChainablePromiseElement<WebdriverIO.Element>;

    /**
     * Verifies multiple static values dynamically.
     */
    public async verifyValues(expectedDetails: { [key: string]: string }) {
        for (const [identifier, expectedValue] of Object.entries(expectedDetails)) {
            const actualText = await this.getTextById(identifier);

            console.log(`🔍 Checking: '${identifier}' → Expected: '${expectedValue}', Found: '${actualText}'`);

            if (actualText !== expectedValue) {
                throw new Error(`❌ Mismatch for '${identifier}': Expected '${expectedValue}', but found '${actualText}'`);
            }
        }
    }
}

export default BaseAccount;



import { $ } from '@wdio/globals';
import BaseAccount from '../base/BaseAccount.js';
import { ChainablePromiseElement } from 'webdriverio';

/**
 * iOS-specific implementation for the account page.
 */
class IosAccountPage extends BaseAccount {
    /**
     * Retrieves an element by its accessibility ID.
     */
    public getElementById(identifier: string): ChainablePromiseElement<WebdriverIO.Element> {
        return $(`~${identifier}`);
    }

    /**
     * Retrieves text from an element by its accessibility ID.
     */
    public async getTextById(identifier: string): Promise<string> {
        const element = await this.getElementById(identifier);
        return await element.getText();
    }
}

export default IosAccountPage;




import dotenv from 'dotenv';
dotenv.config();
import { Given, When, Then, DataTable } from '@wdio/cucumber-framework';
import { getPage } from '../../pageobjects/base/Baseutil.js';
import IosAccountPage from '../../pageobjects/ios/IosAccountPage.js';

// Get the appropriate page object (iOS or Android)
const AccountPage = getPage({ ios: IosAccountPage, android: IosAccountPage });

Given('user is logged into the app', async function () {
    await AccountPage.launch();
});

When('the user navigates to the account card', async function () {
    await AccountPage.navigateToAccountCard();
});

Then('user should see the following values:', async function (dataTable: DataTable) {
    const expectedDetails: { [key: string]: string } = {};

    // Convert Cucumber DataTable to an object
    dataTable.raw().forEach(([identifier, value]) => {
        expectedDetails[identifier] = value;
    });

    await AccountPage.verifyValues(expectedDetails);
});


export function getPage({ ios, android }: { ios: any; android: any }) {
    return process.env.PLATFORM === 'ios' ? new ios() : new android();
}

