//
//  RestAPIServiceTests.swift
//  MySpaceXLaunchTests
//
//  Created by Shabi Naqvi on 12/08/22.
//

import XCTest
import Combine
@testable import MySpaceXLaunch

class RestAPIServiceTests: XCTestCase {

   var cancelable = Set<AnyCancellable>()
    let  networking = MockRestAPIServiceProvider<TestModel>()
    
    func testSucessfulResponse() {
        networking
            .decodableRequest(type: MockRequest(), decodableType: TestModel.self)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    XCTFail("Expected Sucess")
                }
            } receiveValue: { value in
                XCTAssertEqual(value.name, "Testing Model")
            }
            .store(in: &cancelable)

        networking.decodableResponse.send(TestModel(name: "Testing Model"))
    }
    
    func testErrorResponse() {
        let exp = expectation(description: "response")
        
        networking
            .decodableRequest(type: MockRequest(), decodableType: TestModel.self)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTAssertEqual((error.failureResponse as! HTTPURLResponse).statusCode, 400)
                    exp.fulfill()

                }
            } receiveValue: { value in
                XCTAssertEqual(value.name, "Testing Model")
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

struct TestModel: Decodable {
    var name: String
}

class MockRequest: Request {
    var baseURL: String {
        "https://example.com/api/v1/"
    }
    
    var path: String {
        "/v3/launches"
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    
}
