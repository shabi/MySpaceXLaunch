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
