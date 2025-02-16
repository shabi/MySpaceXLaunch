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
    @State var selectedTab = 2
    
    //Mock card data to show how to use
    @StateObject var cardAccountViewModel = CardAccountViewModel()
    var cardMockInfoModel = CardInfoModel(accountNameText: "PPS Main account", accountAmountText: "160,000.00 AED", accountNumberText: "89373772394", accountTypeText: "Call account")

    
    let tabitems: [TabItem] = [
        TabItem(icon: "brand-logo", title: "Home"),
        TabItem(icon: "convert", title: "Payments"),
        TabItem(icon: "accounts", title: "Accounts"),
        TabItem(icon: "request", title: "Services"),
        TabItem(icon: "hamburger-menu", title: "More")
    ]
    
    public init(selectedTab: Int = 2, tabitems: [TabItem] = [TabItem]()) {
        self.selectedTab = selectedTab
    }
    @EnvironmentObject private var coordinator: AppCoordinator
    public var body: some View {
        
        ZStack {
            VStack(spacing: AccountConstants.Spacings.defaultSpacingZero) {
                
                ScrollView(.vertical) {
                    
                    VStack {
                        
                        CardAccount(cardType: .active,
                                    cardAccountViewModel: CardAccountViewModel(cardInfoModel: cardMockInfoModel))
                    }
                }

            }
        }
    }
}

public class CardAccountViewModel: ObservableObject {
    @Published var cardInfoModel: CardInfoModel = CardInfoModel()
    public init(cardInfoModel: CardInfoModel = CardInfoModel()) {
        self.cardInfoModel = cardInfoModel
    }
    
    public func updateFromJson() {
        if let jsonString = UserDefaults.standard.string(forKey: "accountData") {
            if let data = jsonString.data(using: .utf8) {
                let decodedData = try? JSONDecoder().decode(CardInfoModel.self, from: data)
                if let newData = decodedData {
                    DispatchQueue.main.async {
                        self.cardInfoModel = newData
                    }
                }
            }
        }
    }
}

public struct CardInfoModel: Codable  {
//    public let id = UUID()
    var accountNameText: String
    var accountAmountText: String
    var accountNumberText: String
    var accountTypeText: String
    
    public init(accountNameText: String = "",
         accountAmountText: String = "",
         accountNumberText: String = "",
         accountTypeText: String = "") {

        self.accountNameText = accountNameText
        self.accountAmountText = accountAmountText
        self.accountNumberText = accountNumberText
        self.accountTypeText = accountTypeText
    }
}

public struct CardAccount: View {

    var cardType : CardType
    @ObservedObject var cardAccountViewModel: CardAccountViewModel
    
    public init(cardType: CardType, cardAccountViewModel: CardAccountViewModel) {
        self.cardType = cardType
        self.cardAccountViewModel = cardAccountViewModel
    }

    public var body: some View {
        
        VStack {

            AccountCardView(cardType: cardType, config: self.cardType.cardAccountGradientConfig,
                            cardInfoModel: cardAccountViewModel.cardInfoModel) {
                VStack(alignment: .leading,
                       spacing: self.cardType.cardAccountGradientConfig.accountVirticalSpacing) {
                    Text(self.cardAccountViewModel.cardInfoModel.accountNameText)
                        .fontToken(self.cardType.cardAccountGradientConfig.accountDetail.titleFont)
                        .foregroundColor(self.cardType.cardAccountGradientConfig.accountDetail.titleColor)
                        .accessibilityIdentifier("accountNameText")
                        
                    HStack(alignment: .center, spacing: DesignConstants.CardConstant.infoIconSpacing) {
                        Text(self.cardAccountViewModel.cardInfoModel.accountAmountText)
                            .fontToken(self.cardType.cardAccountGradientConfig.accountDetail.subTitleFont)
                            .foregroundColor(self.cardType.cardAccountGradientConfig.accountDetail.subTitleColor)
                            .accessibilityIdentifier("accountAmountText")
                    }
                }
            } descriptionContent: {
                VStack(alignment: .leading) {
                    Text(self.cardAccountViewModel.cardInfoModel.accountNumberText)
                        .fontToken(self.cardType.cardAccountGradientConfig.callAccountDetail.titleFont)
                        .foregroundColor(self.cardType.cardAccountGradientConfig.callAccountDetail.titleColor)
                        .accessibilityIdentifier("accountNumberText")
                    HStack {
                        Text(self.cardAccountViewModel.cardInfoModel.accountTypeText)
                            .fontToken(self.cardType.cardAccountGradientConfig.callAccountDetail.subTitleFont)
                            .foregroundColor(self.cardType.cardAccountGradientConfig.callAccountDetail.subTitleColor)
                            .accessibilityIdentifier("accountTypeText")
                    }
                }
            }
            .frame(height: 160)
        }
    }
       
}
