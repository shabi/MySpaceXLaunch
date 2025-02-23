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

public enum AppRoute: Hashable {
    case home
    case uiComponentList
    case deviceActivation
    case otpValidation
    case accountsScreen
    
    // Mark: - Payment
    case beneficiaryList
    case addBeneficiary
    
}

public class AppCoordinator: ObservableObject {
    @Published public var path: [AppRoute]
    
    public init(path: [AppRoute] = []) {
        self.path = path
    }

    public func push(_ route: AppRoute) {
        path.append(route)
    }

    public func pop() {
        guard path.isNonEmpty else { return }
        path.removeLast()
    }

    public func popToRoute(_ route: AppRoute) {
        guard path.isNonEmpty else { return }
        while let lastRoute = path.last, lastRoute != route {
            path.removeLast()
        }
    }

    public func moveToRoot() {
        path = []
    }
}
