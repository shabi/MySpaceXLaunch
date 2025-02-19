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

public enum AccountConstants {
    
     enum Spacings {
         static let defaultHorizontalVerticalPadding = 20.0
         static let sectionHeaderToPadding = 16.0
         static let sectionHeaderBottomPadding = 8.0
         static let scrollViewEdgeInsectPadding: CGFloat = 40.0
         static let defaultSpacingZero: CGFloat = 0.0
    }
}
import SwiftUI
import Combine

// MARK: - Protocols
protocol AccountLandingViewModelProtocol: ObservableObject {
    var selectedTab: Int { get set }
    var cardInfoModel: CardInfoModel { get }
    var tabItems: [TabItem] { get }
    var tabItemsAccessibility: [String] { get }
    var isMasked: Bool { get set }
    var cardAccountViewModel: CardAccountViewModel { get }
    var transactionsListViewModel: TransactionsListViewModel { get }
    func toggleMask()
}

// MARK: - ViewModel
class AccountLandingViewModel: AccountLandingViewModelProtocol {
    @Published var selectedTab: Int = 2
    @Published var isMasked: Bool = false
    private var cancellables = Set<AnyCancellable>()
    
    let cardInfoModel: CardInfoModel
    let tabItems: [TabItem]
    let tabItemsAccessibility: [String]
    
    let cardAccountViewModel: CardAccountViewModel
    let transactionsListViewModel: TransactionsListViewModel
    
    init() {
        self.cardInfoModel = AccountLandingViewModel.loadCardInfo()
        self.tabItems = AccountLandingViewModel.loadTabItems()
        self.tabItemsAccessibility = ["tab_Home", "tab_Payments", "tab_Accounts", "tab_Services", "tab_More"]
        
        self.cardAccountViewModel = CardAccountViewModel(cardInfoModel: cardInfoModel)
        self.transactionsListViewModel = TransactionsListViewModel()
        
        setupBindings()
    }
    
    func toggleMask() {
        isMasked.toggle()
    }
    
    private func setupBindings() {
        $isMasked
            .sink { [weak self] newValue in
                self?.cardAccountViewModel.isMasked = newValue
                self?.transactionsListViewModel.isMasked = newValue
                self?.cardAccountViewModel.maskTitle(newValue)
                self?.transactionsListViewModel.maskTitles(newValue)
            }
            .store(in: &cancellables)
    }
    
    private static func loadCardInfo() -> CardInfoModel {
        guard let url = Bundle.main.url(forResource: "CardInfo", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let model = try? JSONDecoder().decode(CardInfoModel.self, from: data) else {
            return CardInfoModel(accountNameText: "PPS Main account",
                                 accountAmountText: "160,000.00 AED",
                                 accountNumberText: "89373772394",
                                 accountTypeText: "Call account",
                                 accessibilityIDs: [:])
        }
        return model
    }
    
    private static func loadTabItems() -> [TabItem] {
        guard let url = Bundle.main.url(forResource: "TabItems", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let items = try? JSONDecoder().decode([TabItem].self, from: data) else {
            return [
                TabItem(icon: "brand-logo", title: "Home"),
                TabItem(icon: "convert", title: "Payments"),
                TabItem(icon: "accounts", title: "Accounts"),
                TabItem(icon: "request", title: "Services"),
                TabItem(icon: "hamburger-menu", title: "More")
            ]
        }
        return items
    }
}

// MARK: - View
struct AccountLandingView: View {
    @StateObject private var viewModel = AccountLandingViewModel()
    
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        ZStack {
            VStack(spacing: AccountConstants.Spacings.defaultSpacingZero) {
                if viewModel.selectedTab == 2 {
                    ScreenHeader(screenTitleDataSource: ScreenHeaderDataModel(
                        title: "Accounts",
                        titleActionIcons: ["show"],
                        isShowScreenHeaderActions: false,
                        isBackButtonShow: false,
                        onTitleHeaderAction: { actionType in
                            print("Action: \(actionType)")
                            viewModel.toggleMask()
                        }
                    ))
                    .padding([.top, .horizontal], AccountConstants.Spacings.defaultHorizontalVerticalPadding)
                } else {
                    Text("Selected Tab \(viewModel.tabItems[viewModel.selectedTab].title)")
                }
                
                ScrollView(.vertical) {
                    VStack {
                        if viewModel.selectedTab == 2 {
                            VStack(spacing: AccountConstants.Spacings.defaultHorizontalVerticalPadding) {
                                CardAccount(
                                    cardType: .active,
                                    cardAccountViewModel: viewModel.cardAccountViewModel
                                )
                                
                                SegmentedControl(
                                    seletedSegment: 0,
                                    segmentedOptions: ["Transactions", "Details"],
                                    segmentedControlColorData: SegmentedControlColorData()
                                )
                                
                                VStack(spacing: 0) {
                                    SectionHeader(
                                        sectionHeaderDataSource: SectionHeaderDataSource(
                                            title: "Last 5 transactions",
                                            linkButtonTitle: "View all"
                                        ),
                                        action: {
                                            debugPrint("Section Header pressed")
                                        }
                                    )
                                    .padding(.top, AccountConstants.Spacings.sectionHeaderToPadding)
                                    .padding(.bottom, AccountConstants.Spacings.sectionHeaderBottomPadding)
                                    TransactionsListView(viewModel: viewModel.transactionsListViewModel)
                                }
                            }
                            .padding(.horizontal, AccountConstants.Spacings.defaultHorizontalVerticalPadding)
                        }
                    }
                }
                .safeAreaInset(edge: .bottom, spacing: AccountConstants.Spacings.defaultSpacingZero) {
                    Spacer().frame(height: AccountConstants.Spacings.scrollViewEdgeInsectPadding)
                }
                
                TabBar(
                    tabs: viewModel.tabItems,
                    accessibilityIDs: viewModel.tabItemsAccessibility,
                    selectedTab: $viewModel.selectedTab
                )
                .background(.white)
            }
        }
        .background(Color.defaultAppBackgroundColor.ignoresSafeArea())
    }
}

