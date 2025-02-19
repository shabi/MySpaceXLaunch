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

public struct AccountLandingView: View {
    @State var selectedTab = 2
    
    //Mock card data to show how to use
    
    let cardMockInfoModel = CardInfoModel(accountNameText: "PPS Main account",
                                          accountAmountText: "160,000.00 AED",
                                          accountNumberText: "89373772394",
                                          accountTypeText: "Call account",
                                          accessibilityIDs: [.topRightTrailingLastIcon: "shareIcon",
                                                             .topRightTrailingPreviousIcon: "favoriteIcon",
                                                             .tagView: "active",
                                                             .topLeftTitle: "accountNameText",
                                                             .topLeftSubtitle: "accountAmountText",
                                                             .bottomLeftTitle: "accountNumberText",
                                                             .bottomLeftSubtitle: "accountTypeText",
                                                             .defaultValue: ""])

    
    let tabitems: [TabItem] = [
        TabItem(icon: "brand-logo", title: "Home"),
        TabItem(icon: "convert", title: "Payments"),
        TabItem(icon: "accounts", title: "Accounts"),
        TabItem(icon: "request", title: "Services"),
        TabItem(icon: "hamburger-menu", title: "More")
    ]
    
    let tabitemsAccessibility: [String] = [
        "tab_Home",
        "tab_Payments",
        "tab_Accounts",
        "tab_Services",
        "tab_More"
    ]
    
    
    public init(selectedTab: Int = 2, tabitems: [TabItem] = [TabItem]()) {
        self.selectedTab = selectedTab
    }
    @EnvironmentObject private var coordinator: AppCoordinator
    public var body: some View {
        
        ZStack {
            VStack(spacing: AccountConstants.Spacings.defaultSpacingZero) {
                if selectedTab == 2 {
                    ScreenHeader(screenTitleDataSource: ScreenHeaderDataModel(title: "Accounts",
                                                                              titleActionIcons: ["show"],
                                                                              isShowScreenHeaderActions: false,
                                                                              isBackButtonShow: false, onHeaderAction: { actionType in
//                        print("Shabi Action\(actionType)")
                    }, onTitleHeaderAction: { actionType in
                        print("Shabi Action\(actionType)")
                        // publish
                    }))
                    .padding([.top, .horizontal], AccountConstants.Spacings.defaultHorizontalVerticalPadding)
                }
                else {
                    Text("Selected Tab \(tabitems[selectedTab].title)")
                }
                
                ScrollView(.vertical) {
                    
                    VStack {
                        
                        if selectedTab == 2 {
                            VStack {
                                VStack (spacing: AccountConstants.Spacings.defaultHorizontalVerticalPadding) {
                                    CardAccount(cardType: .active,
                                                cardAccountViewModel: CardAccountViewModel(cardInfoModel: cardMockInfoModel))
                                    
                                    SegmentedControl(seletedSegment: 0, segmentedOptions:  ["Transactions", "Details"], segmentedControlColorData: SegmentedControlColorData())
                                }
                                    

                                VStack(spacing: 0) {
                                    SectionHeader(sectionHeaderDataSource: SectionHeaderDataSource(title: "Last 5 transactions", linkButtonTitle: "View all")) {
                                        debugPrint("Section Header pressed")
                                    }
                                    .padding(.top, AccountConstants.Spacings.sectionHeaderToPadding)
                                    .padding(.bottom, AccountConstants.Spacings.sectionHeaderBottomPadding)
                                    TransactionsListView()
                                }
                            }
                            .padding(.horizontal, AccountConstants.Spacings.defaultHorizontalVerticalPadding)
                        }
                    }
                }
                .safeAreaInset(edge: .bottom, spacing: AccountConstants.Spacings.defaultSpacingZero) {
                    Spacer()
                        .frame(height: AccountConstants.Spacings.scrollViewEdgeInsectPadding)
                }

                TabBar(tabs: tabitems, accessibilityIDs: self.tabitemsAccessibility, selectedTab: $selectedTab)
                    .background(.white)
            }
        }
        .background(Color.defaultAppBackgroundColor
            .ignoresSafeArea())
    }
}
