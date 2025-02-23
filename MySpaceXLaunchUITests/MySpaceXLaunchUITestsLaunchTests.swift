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

import SwiftUI

protocol Coordinator: ObservableObject {
    func start() -> AnyView
}
//
import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var isAuthenticated = false
    @Published var selectedTab = 0

    private var featureCoordinators: [any Coordinator]

    init() {
        featureCoordinators = [
            HomeCoordinator(),
            PaymentsCoordinator(),
            AccountsCoordinator(),
            MoreCoordinator()
        ]
    }

    func start() -> AnyView {
        isAuthenticated ? AnyView(MainTabView(coordinator: self)) : AnyView(LoginView(coordinator: self))
    }

    func authenticateUser() {
        isAuthenticated = true
    }

    func viewForTab(index: Int) -> AnyView {
        return featureCoordinators[index].start()
    }
}
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
        VStack {
            Text("Login Screen")
            Button("Login") {
                coordinator.authenticateUser()
            }
        }
    }
}
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            ForEach(0..<coordinator.featureCoordinators.count, id: \.self) { index in
                coordinator.viewForTab(index: index)
                    .tabItem {
                        tabIcon(for: index)
                        Text(tabTitle(for: index))
                    }
                    .tag(index)
            }
        }
    }

    private func tabTitle(for index: Int) -> String {
        switch index {
        case 0: return "Home"
        case 1: return "Payments"
        case 2: return "Accounts"
        case 3: return "More"
        default: return ""
        }
    }

    private func tabIcon(for index: Int) -> Image {
        switch index {
        case 0: return Image(systemName: "house.fill")
        case 1: return Image(systemName: "creditcard.fill")
        case 2: return Image(systemName: "banknote.fill")
        case 3: return Image(systemName: "ellipsis.circle.fill")
        default: return Image(systemName: "questionmark")
        }
    }
}
//

import SwiftUI

class AccountsCoordinator: ObservableObject {
    @Published var navigationPath = NavigationPath()

    func start() -> AnyView {
        AnyView(AccountsView(coordinator: self))
    }

    func navigateTo(_ route: AccountsRoute) {
        navigationPath.append(route)
    }

    func goBack() {
        navigationPath.removeLast()
    }
}

enum AccountsRoute: Hashable {
    case accountsList
    case transactionsList(accountId: String)
    case transactionDetail(transactionId: String)
}

//
import SwiftUI

struct AccountsView: View {
    @ObservedObject var coordinator: AccountsCoordinator

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            VStack {
                Text("Accounts Screen")
                Button("View Transactions") {
                    coordinator.navigateTo(.transactionsList(accountId: "12345"))
                }
            }
            .navigationDestination(for: AccountsRoute.self) { route in
                switch route {
                case .accountsList:
                    AccountsView(coordinator: coordinator)

                case .transactionsList(let accountId):
                    TransactionsView(coordinator: coordinator, accountId: accountId)

                case .transactionDetail(let transactionId):
                    TransactionDetailView(coordinator: coordinator, transactionId: transactionId)
                }
            }
        }
    }
}
//
import SwiftUI

struct TransactionDetailView: View {
    @ObservedObject var coordinator: AccountsCoordinator
    let transactionId: String

    var body: some View {
        VStack {
            Text("Transaction Details for ID: \(transactionId)")
            Button("Back") {
                coordinator.goBack()
            }
        }
    }
}

//


import SwiftUI

class PaymentsCoordinator: ObservableObject {
    @Published var navigationPath = NavigationPath()

    func start() -> AnyView {
        AnyView(PaymentsView(coordinator: self))
    }
}
//
import SwiftUI

class MoreCoordinator: ObservableObject {
    @Published var navigationPath = NavigationPath()

    func start() -> AnyView {
        AnyView(MoreView(coordinator: self))
    }
}

