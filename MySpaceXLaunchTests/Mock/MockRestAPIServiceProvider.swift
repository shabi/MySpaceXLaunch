//
//  MockRestAPIServiceProvider.swift
//  MySpaceXLaunchTests
//
//  Created by Shabi Naqvi on 12/08/22.
//

import Foundation
import Combine
@testable import MySpaceXLaunch


class MockRestAPIServiceProvider<D: Decodable>: RestAPIService {
    
    init() {}
    
    var rawRequestResponse = PassthroughSubject<URLSession.DataTaskPublisher.Output, URLSession.DataTaskPublisher.Failure>()
    var decodableResponse = PassthroughSubject<D, NetworkError>()
    
    func rawRequest(type: Request) -> AnyPublisher<URLSession.DataTaskPublisher.Output, URLSession.DataTaskPublisher.Failure> {
        return rawRequestResponse.eraseToAnyPublisher()
    }
    func decodableRequest<D: Decodable>(type: Request, decodableType: D.Type) -> AnyPublisher<D, NetworkError> {
        return decodableResponse.eraseToAnyPublisher() as! AnyPublisher<D, NetworkError>
    }
}
