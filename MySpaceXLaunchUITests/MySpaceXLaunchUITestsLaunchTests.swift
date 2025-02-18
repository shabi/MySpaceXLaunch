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

Transaction Description – On hover Complete Narrations should be
shown
1. CHARGESEPHCOP35805C34BG 253536363636 DTB BANK
CHARGE SREDIFTSANITY2312 25-53533638-1-151 – AE0033958
2. IFT-DTB TT REF EPHCOP35805C34BG 326362383882 CA2 ADD21
ADD2 ADD3 @2.6186 REDIFTSANITY2312 25-2363627-1-151 –
AE0042200
3. DFT-DTB TT REF EPHCOP35805C34BG 326362383882 TEST TEST
@2.6186 REDIFTSANITY2312 25-2363627-1-151 – AE0012345
4. CHARGESEPHCOP35805C34BG 253536363636 DTB BANK
CHARGE SREDIFTSANITY2312 25-53533638-1-151 – AE0067452
5. DFT-DTB TT REF EPHCOP35805C34BG 326362383882 TEST TEST
@2.6186 REDIFTSANITY2312 25-2363627-1-151 – AE0021345
o Amount – Debit amount to be displayed in Black and <Currency> after
the amount and credit to be displayed in Green and <Currency> after
the amount
1. -2.00 AED
2. -200,000.45 AED
3. 61,000.00 AED
4. -0.05 AED
5. -14,809.245 AED
o Date - Value date should be populated
1. 30 Jan 2025
2. 30 Jan 2025
3. 07 Jan 2025
4. 25 Dec 2024
5. 22 Aug 2024
o Running Balance
1. 7,200.00 AED
2. 120,000.45 AED
3. 251,000.00 AED
4. 10,540.05 AED
5. 214,809.245 AED
o Transaction Reference
1. 1100023452
2. 1100023440
3. 1100011000
4. 1100000912
5. 0198700356
