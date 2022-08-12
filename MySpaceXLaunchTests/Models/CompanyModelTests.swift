//
//  CompanyModelTests.swift
//  MySpaceXLaunchTests
//
//  Created by Shabi Naqvi on 12/08/22.
//

import XCTest
@testable import MySpaceXLaunch

class CompanyModelTests: XCTestCase {
    var sut: CompanyInfo!
    
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
    
    
    func testDecodableFounder() {
        XCTAssertEqual(sut.founder, "Elon Musk")
    }
        
    func testDecodableSetsName() {
        XCTAssertEqual(sut.name, "SpaceX")
    }
    
    func testDecodableSetsSummary() {
        XCTAssertEqual(sut.summary, "SpaceX designs, manufactures and launches advanced rockets and spacecraft. The company was founded in 2002 to revolutionize space technology, with the ultimate goal of enabling people to live on other planets.")
    }
    

    
    private func givenSUTFromJSON() throws {
        let decoder = JSONDecoder()
        let data = try Data.fromJSON(fileName: "CompanyInfo")
        let companyInfo = try decoder.decode(CompanyInfo.self, from: data)
        sut = companyInfo
    }
}


