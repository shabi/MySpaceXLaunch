//
//  LaunchInfoModelTests.swift
//  MySpaceXLaunchTests
//
//  Created by Shabi Naqvi on 12/08/22.
//

import XCTest
@testable import MySpaceXLaunch

class LaunchTests: XCTestCase {
    var sut: LaunchInfo!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        try givenSUTFromJSON()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }
    
    // MARK: - Type Tests
    func testConformsToDecodable() {
        XCTAssertTrue((sut as Any) is Decodable) // cast silences a warning
    }
    
    
    func testDecodableSetsId() {
        XCTAssertEqual(sut.flight_number, 65)
    }
    
    func testDecodableSetsName() {
        XCTAssertEqual(sut.mission_name, "Telstar 19V")
    }
    
    func testDecodableSetsDetails() {
        XCTAssertEqual(sut.details, "SSL-manufactured communications satellite intended to be placed at 63° West over the Americas. At 7,075 kg, it became the heaviest commercial communications satellite ever launched.")
    }
    
    
    func testDecodableSetsSuccess() {
        XCTAssertEqual(sut.launch_success, true)
    }
    
    
    private func givenSUTFromJSON() throws {
        let decoder = JSONDecoder()
        let data = try Data.fromJSON(fileName: "LaunchResponse")
        let launchResponseArray = try decoder.decode([LaunchInfo].self, from: data)
        sut = launchResponseArray.first
    }
}

