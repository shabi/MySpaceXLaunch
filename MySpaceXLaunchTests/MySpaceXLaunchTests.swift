//
//  MySpaceXLaunchTests.swift
//  MySpaceXLaunchTests
//
//  Created by Shabi Naqvi on 07/08/22.
//
protocol DateFilterable {
    var selectedTimeframe: Timeframe? { get set }
    var startDate: Date? { get set }
    var endDate: Date? { get set }

    var isCustomDateVisible: Bool { get }
}

protocol FilterActionControllable {
    var isApplyEnabled: Bool { get }
    var isResetEnabled: Bool { get }

    func resetFilters()
}

enum Timeframe: String, CaseIterable {
    case today = "Today"
    case last7Days = "Last 7 days"
    case last15Days = "Last 15 days"
    case last30Days = "Last 30 days"
    case last6Months = "Last 6 months"
    case custom = "Custom timeframe"
}

enum TransactionType: String {
    case debit = "Debit"
    case credit = "Credit"
}

final class FilterViewModel: ObservableObject, DateFilterable, FilterActionControllable {
    
    // MARK: - DateFilterable
    @Published var selectedTimeframe: Timeframe? = nil
    @Published var startDate: Date? = nil
    @Published var endDate: Date? = nil

    var isCustomDateVisible: Bool {
        selectedTimeframe == .custom
    }

    // MARK: - FilterActionControllable
    @Published var selectedTransactionType: TransactionType? = nil
    @Published var transactionAmount: Double? = nil

    var isApplyEnabled: Bool {
        selectedTimeframe != nil || selectedTransactionType != nil || transactionAmount != nil
    }

    var isResetEnabled: Bool {
        isApplyEnabled
    }

    func resetFilters() {
        selectedTimeframe = nil
        startDate = nil
        endDate = nil
        selectedTransactionType = nil
        transactionAmount = nil
    }
}


struct FilterView<ViewModel>: View where ViewModel: DateFilterable & FilterActionControllable {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Timeframe").font(.headline)

            ForEach(Timeframe.allCases, id: \.self) { timeframe in
                HStack {
                    Image(systemName: viewModel.selectedTimeframe == timeframe ? "largecircle.fill.circle" : "circle")
                        .onTapGesture {
                            viewModel.selectedTimeframe = timeframe
                        }
                    Text(timeframe.rawValue)
                        .onTapGesture {
                            viewModel.selectedTimeframe = timeframe
                        }
                }
            }

            if viewModel.isCustomDateVisible {
                DatePicker("Start Date", selection: Binding($viewModel.startDate, replacingNilWith: Date()), displayedComponents: .date)
                DatePicker("End Date", selection: Binding($viewModel.endDate, replacingNilWith: Date()), displayedComponents: .date)
            }

            HStack {
                Button("Reset") {
                    viewModel.resetFilters()
                }
                .disabled(!viewModel.isResetEnabled)

                Spacer()

                Button("Apply") {
                    // Trigger Apply
                }
                .disabled(!viewModel.isApplyEnabled)
            }
        }
        .padding()
    }
}

extension Binding where Value == Date? {
    init(_ source: Binding<Date?>, replacingNilWith defaultValue: Date) {
        self.init(
            get: { source.wrappedValue ?? defaultValue },
            set: { source.wrappedValue = $0 }
        )
    }
}


import XCTest
@testable import MySpaceXLaunch

class MySpaceXLaunchTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
