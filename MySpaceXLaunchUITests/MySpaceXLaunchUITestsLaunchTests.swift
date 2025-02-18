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
{
  "transactions": [
    {
      "Transaction Description": "CHARGESEPHCOP35805C34BG 253536363636 DTB BANK CHARGE SREDIFTSANITY2312 25-53533638-1-151 – AE0033958",
      "Amount": "-2.00 AED",
      "Date": "30 Jan 2025",
      "Running Balance": "7,200.00 AED",
      "Transaction Reference": "1100023452"
    },
    {
      "Transaction Description": "IFT-DTB TT REF EPHCOP35805C34BG 326362383882 CA2 ADD21 ADD2 ADD3 @2.6186 REDIFTSANITY2312 25-2363627-1-151 – AE0042200",
      "Amount": "-200,000.45 AED",
      "Date": "30 Jan 2025",
      "Running Balance": "120,000.45 AED",
      "Transaction Reference": "1100023440"
    },
    {
      "Transaction Description": "DFT-DTB TT REF EPHCOP35805C34BG 326362383882 TEST TEST @2.6186 REDIFTSANITY2312 25-2363627-1-151 – AE0012345",
      "Amount": "61,000.00 AED",
      "Date": "07 Jan 2025",
      "Running Balance": "251,000.00 AED",
      "Transaction Reference": "1100011000"
    },
    {
      "Transaction Description": "CHARGESEPHCOP35805C34BG 253536363636 DTB BANK CHARGE SREDIFTSANITY2312 25-53533638-1-151 – AE0067452",
      "Amount": "-0.05 AED",
      "Date": "25 Dec 2024",
      "Running Balance": "10,540.05 AED",
      "Transaction Reference": "1100000912"
    },
    {
      "Transaction Description": "DFT-DTB TT REF EPHCOP35805C34BG 326362383882 TEST TEST @2.6186 REDIFTSANITY2312 25-2363627-1-151 – AE0021345",
      "Amount": "-14,809.245 AED",
      "Date": "22 Aug 2024",
      "Running Balance": "214,809.245 AED",
      "Transaction Reference": "0198700356"
    }
  ]
}



import SwiftUI

struct TransactionsListView: View {
    @State private var transactions: [Transaction] = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(transactions) { transaction in
                        TransactionView(transaction: transaction)
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Transactions")
            .onAppear {
                if let loadedTransactions: TransactionsResponse = Bundle.main.decode("transactions", as: TransactionsResponse.self) {
                    self.transactions = loadedTransactions.transactions
                }
            }
        }
    }
}


import SwiftUI

// Codable Model
struct Transaction: Codable, Identifiable {
    let id = UUID() // Unique identifier for SwiftUI List
    let description: String
    let amount: String
    let date: String
    let runningBalance: String
    let transactionReference: String
    
    enum CodingKeys: String, CodingKey {
        case description = "Transaction Description"
        case amount = "Amount"
        case date = "Date"
        case runningBalance = "Running Balance"
        case transactionReference = "Transaction Reference"
    }
}

// Wrapper for an array of transactions
struct TransactionsResponse: Codable {
    let transactions: [Transaction]
}

