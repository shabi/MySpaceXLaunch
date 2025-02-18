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

public extension Bundle {
    func decode<T: Decodable>(_ file: String, as type: T.Type) -> T? {
        guard let url = self.url(forResource: file, withExtension: "json") else {
            print("❌ Error: Could not find \(file).json in bundle.")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            print("❌ JSON Decoding Error: \(error.localizedDescription)")
            return nil
        }
    }
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

