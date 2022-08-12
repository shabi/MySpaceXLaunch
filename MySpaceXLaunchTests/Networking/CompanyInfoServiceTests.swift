//
//  CompanyInfoServiceTests.swift
//  MySpaceXLaunchTests
//
//  Created by Shabi Naqvi on 12/08/22.
//

import XCTest
import Combine
@testable import MySpaceXLaunch

class CompanyInfoServiceTests: XCTestCase {
    
    var cancelable = Set<AnyCancellable>()
     
     func testSucessfullyRetriveCompanyResponse() {
         let exp = expectation(description: "response")
         let json = """
{
  "name": "SpaceX",
  "founder": "Elon Musk",
  "founded": 2002,
  "employees": 7000,
  "vehicles": 3,
  "launch_sites": 3,
  "test_sites": 1,
  "ceo": "Elon Musk",
  "cto": "Elon Musk",
  "coo": "Gwynne Shotwell",
  "cto_propulsion": "Tom Mueller",
  "valuation": 15000000000,
  "headquarters": {
    "address": "Rocket Road",
    "city": "Hawthorne",
    "state": "California"
  },
  "summary": "SpaceX designs, manufactures and launches advanced rockets and spacecraft. The company was founded in 2002 to revolutionize space technology, with the ultimate goal of enabling people to live on other planets."
}
"""
         guard let jsonData = json.data(using: .utf8) else {
             XCTFail("Failed to encode")
             return
         }
         
         guard let companyInfo = try? JSONDecoder().decode(CompanyInfo.self, from: jsonData) else {
             XCTFail("Failed to decode")
             return
         }
         
         let networking = MockRestAPIServiceProvider<CompanyInfo>()
         let companyInfoServiceProvider = CompanyInfoServiceProvider(networking: networking)
         
         companyInfoServiceProvider
             .getCompanyInfoService()
             .sink { completion in
                 switch completion {
                 case .finished:
                     break
                 case .failure:
                     XCTFail("Expected Sucess")
                 }
             } receiveValue: { value in
                 XCTAssertEqual(value.name, "SpaceX")
                 XCTAssertEqual(value.founder, "Elon Musk")
                 XCTAssertEqual(value.founded, 2002)
                 XCTAssertEqual(value.employees, 7000)
                 XCTAssertEqual(value.valuation, 15000000000)
                 
                 exp.fulfill()
             }
             .store(in: &cancelable)

         networking.decodableResponse.send(companyInfo)
         
         waitForExpectations(timeout: 5)
     }
     
     func testRetriveCompanyFailed() {
         let exp = expectation(description: "response")
         
         let networking = MockRestAPIServiceProvider<CompanyInfo>()
         let companyInfoServiceProvider = CompanyInfoServiceProvider(networking: networking)
         
         companyInfoServiceProvider
             .getCompanyInfoService()
             .sink { completion in
                 switch completion {
                 case .finished:
                     XCTFail("Reached finished, error expected")
                     break
                 case .failure(let error):
                     XCTAssertEqual((error.failureResponse as! HTTPURLResponse).statusCode, 400)
                     exp.fulfill()
                 }
             } receiveValue: { _ in
                 XCTFail("Expected Error")
             }
             .store(in: &cancelable)
         
         guard let url = URL(string: "https://example.com"), let response = HTTPURLResponse(url: url, statusCode: 400, httpVersion: "HTTP/1.1", headerFields: nil) else {
             XCTFail("Could not create mock response")
             return
         }
         
         
         let error = NetworkError(failureResponse: response)
         networking.decodableResponse.send(completion: .failure(error))
         
         waitForExpectations(timeout: 5)
     }
 }
