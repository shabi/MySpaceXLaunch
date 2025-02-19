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

public enum AccessibilityID: Hashable {
    
    public enum TransactionRow: String {
        case title
        case amount
        case date
    }
    
    public enum CardView: String {
        case title
        case button
    }
    
    public enum TabBar: String {
        case home
        case profile
        case settings
    }

    case custom(String) // Allows dynamic keys

    public var value: String {
        switch self {
        case .custom(let key): return key
        }
    }
}


class TransactionRowViewModel: ObservableObject {
    let transaction: Transaction
    let accessibilityIDs: [AccessibilityID.TransactionRow: String]

    init(transaction: Transaction, index: Int) {
        self.transaction = transaction
        self.accessibilityIDs = [
            .title: "title_\(index)",
            .amount: "amount_\(index)",
            .date: "date_\(index)"
        ]
    }
}

struct TransactionsListView: View {
    let transactions: [Transaction]

    var body: some View {
        List {
            ForEach(transactions.indices, id: \.self) { index in
                let viewModel = TransactionRowViewModel(transaction: transactions[index], index: index)
                TransactionRow(viewModel: viewModel)
            }
        }
    }
}
