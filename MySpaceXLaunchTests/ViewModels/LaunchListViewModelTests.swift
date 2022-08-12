//
//  LaunchListViewModelTests.swift
//  MySpaceXLaunchTests
//
//  Created by Shabi Naqvi on 12/08/22.
//

import XCTest
import Combine
@testable import MySpaceXLaunch

enum APICalled {
    case allLaunchs
    case companyInfo
}

class LaunchListViewModelTests: XCTestCase {
    
    var testSut: LaunchListViewModel!
    var networking: RestAPIService!
    var mockViewController: MockLaunchListViewController!
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        givenMockViewController()
    }
    
    private func configureForLaunchList() {
        networking = MockRestAPIServiceProvider<[LaunchInfo]>()
        testSut = LaunchListViewModel(apiService: networking)
        mockViewController.viewModel = testSut
    }
    
    private func configureForCompanyInfo() {
        networking = MockRestAPIServiceProvider<CompanyInfo>()
        testSut = LaunchListViewModel(apiService: networking)
        mockViewController.viewModel = testSut
    }
    

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mockViewController = nil
        testSut = nil
        networking = nil
        try super.tearDownWithError()
    }

    func testLaunchViewModelsCallback_whenUpdated() throws {
        // given
        let exp = expectation(for: NSPredicate(block: { (mockViewController, _) -> Bool in
            return (mockViewController as! MockLaunchListViewController).launchViewModelsCallback
        }), evaluatedWith: mockViewController, handler: nil)
        
        // when
        try whenLaunchViewModels(apiCalled: .allLaunchs)
        
        // then
        wait(for: [exp], timeout: 2.0)
    }
    
    private func givenMockViewController() {
        mockViewController = MockLaunchListViewController()
        mockViewController.loadViewIfNeeded()
    }
    
    private func whenLaunchViewModels(apiCalled: APICalled, count: Int = 3) throws {
        
        if apiCalled == .allLaunchs {
            configureForLaunchList()
            let launchResponse = try givenLaunchSUTFromJSON()
            let expectedLaunchTVCViewModels = testSut.convertLaunchesToLaunchListTableViewCellViewModels(launches: launchResponse)
            testSut.fetchLaunches()
            testSut.launchViewModelsSubject.send(expectedLaunchTVCViewModels)
        } else {
            configureForCompanyInfo()
            let companyInfoResponse = try givenCompanyInfoSUTFromJSON()
            testSut.fetchCompanyInfo()
            testSut.processFetchedCompanyInfo(companyInfoResponse: companyInfoResponse)
        }
    }
    
//    func testFetchLaunchesSuccess() throws {
//        self.configureForLaunchList()
//        let exp = expectation(description: "response")
//        let launchResponse = try givenLaunchSUTFromJSON()
//
//        testSut.fetchLaunches()
//
//        testSut.launchViewModels
//            .sink { value in
//                XCTAssertNotNil(value)
//                XCTAssertNotNil(value)
//                XCTAssertNotNil(value)
//                XCTAssertEqual(value.first?.mission, launchResponse.first?.mission_name)
//                exp.fulfill()
//            }
//            .store(in: &cancellables)
//
//        (networking as! MockRestAPIServiceProvider<[LaunchInfo]>).decodableResponse.send(launchResponse)
//        waitForExpectations(timeout: 2)
//    }
    
    func testFetchCompanyInfoSuccess() throws {
        self.configureForCompanyInfo()
        
        let exp = expectation(description: "response")
        let companyInfoResponse = try givenCompanyInfoSUTFromJSON()
        let headerString = "\(companyInfoResponse.name!) was founded by \(companyInfoResponse.founder!) in \(companyInfoResponse.founded!). It has now \(companyInfoResponse.employees!) employees, \(companyInfoResponse.launch_sites!) launch sites, and is valued at USD \(companyInfoResponse.valuation!)."
                
        testSut.fetchCompanyInfo()
        
        testSut.companyHeaderInfo
            .sink { value in
                XCTAssertEqual(value, headerString)
                exp.fulfill()
            }
            .store(in: &cancellables)
        
        (networking as! MockRestAPIServiceProvider<CompanyInfo>).decodableResponse.send(companyInfoResponse)
        waitForExpectations(timeout: 5)
    }
    
    private func givenLaunchSUTFromJSON() throws -> [LaunchInfo] {
        let decoder = JSONDecoder()
        let data = try Data.fromJSON(fileName: "LaunchResponse")
        let launchResponse = try decoder.decode([LaunchInfo].self, from: data)
        return launchResponse
    }
    
    private func givenCompanyInfoSUTFromJSON() throws -> CompanyInfo {
        let decoder = JSONDecoder()
        let data = try Data.fromJSON(fileName: "CompanyInfo")
        let launchResponse = try decoder.decode(CompanyInfo.self, from: data)
        return launchResponse
    }

}

class MockLaunchListViewController: UIViewController {
    var viewModel: LaunchListViewModelType = LaunchListViewModel()
    var cancellables = Set<AnyCancellable>()
    
    var launchViewModelsCallback = false
    var companyInfoCallback = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupListeners()
    }
    
    func setupListeners() {

        viewModel
            .launchViewModels
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                self?.launchViewModelsCallback = true
            }
            .store(in: &cancellables)
        
        viewModel
            .companyHeaderInfo
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                self?.companyInfoCallback = true
            }
            .store(in: &cancellables)
    }
    
}

