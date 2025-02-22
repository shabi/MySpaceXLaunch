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

public struct AccountLandingView: View {
    @StateObject private var viewModel = AccountLandingViewModel()
    
    public init() {
        
    }
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: AccountConstants.Spacings.defaultSpacingZero) {
                if viewModel.selectedTab == 2 {
                    ScreenHeader(screenTitleDataSource: ScreenHeaderDataModel(
                        title: "Accounts",
                        sectionHeaderIconSizeType: .medium,
                        titleActionIcons: ["show"],
                        isShowScreenHeaderActions: false,
                        isBackButtonShow: false,
                        onTitleHeaderAction: { actionType in
                            print("Action: \(actionType)")
                        }
                    ))
                    .padding([.top, .bottom, .horizontal], AccountConstants.Spacings.defaultHorizontalVerticalPadding)
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
                                VStack(spacing: AccountConstants.Spacings.defaultSpacingZero) {
                                    SectionHeader(sectionHeaderDataSource: SectionHeaderDataSource(title: "Last 5 transactions", linkButtonTitle: "View all")) {
                                        debugPrint("Section Header pressed")
                                    }
                                    .padding(.top, AccountConstants.Spacings.sectionHeaderTopPadding)
                                    .padding(.bottom, AccountConstants.Spacings.sectionHeaderBottomPadding)
                                    TransactionsListView(transactionsListViewModel: viewModel.transactionsListViewModel)
                                }
                               
                            }
                            .padding(.horizontal, AccountConstants.Spacings.defaultHorizontalVerticalPadding)
                        }
                    }
                }.safeAreaInset(edge: .bottom, spacing: AccountConstants.Spacings.defaultSpacingZero) {
                    Spacer()
                        .frame(height: AccountConstants.Spacings.scrollViewEdgeInsectPadding)
                }
                
                TabBar(
                    tabs: viewModel.tabItems,
                    accessibilityIDs: viewModel.tabItemsAccessibility,
                    selectedTab: $viewModel.selectedTab
                )
                .background(.white)
            }
        }.background(Color.defaultAppBackgroundColor
            .ignoresSafeArea())
    }
    
}

