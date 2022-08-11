//
//  RestAPIService.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 08/08/22.
//

import Foundation
import Combine
import UIKit

struct NetworkError: Error {
    var failureResponse: URLResponse?
}

struct RequestBuilder {
    
    static func request(requestType: Request) -> URLRequest {
        let url = URL(string: requestType.baseURL + requestType.path)!
        var request = URLRequest(url: url)
        
        request.httpMethod = requestType.httpMethod.rawValue
        
        return request
    }
}

enum HTTPMethod: String {
    case get
    case post
    case put
    case delete
}

protocol Request {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
}

protocol RestAPIService: AnyObject {
    var urlSession: URLSession { get }
    
    func rawRequest(type: Request) -> AnyPublisher<URLSession.DataTaskPublisher.Output, URLSession.DataTaskPublisher.Failure>
    func decodableRequest<D: Decodable>(type: Request, decodableType: D.Type) -> AnyPublisher<D, NetworkError>
}

extension RestAPIService {
    var urlSession: URLSession {
        URLSession.shared
    }
    
    func rawRequest(type: Request) -> AnyPublisher<URLSession.DataTaskPublisher.Output, URLSession.DataTaskPublisher.Failure> {
        let request = RequestBuilder.request(requestType: type)
        return self
            .urlSession.dataTaskPublisher(for: request)
            .eraseToAnyPublisher()
        
    }
    
    func decodableRequest<D: Decodable>(type: Request, decodableType: D.Type) -> AnyPublisher<D, NetworkError> {
        
        self.rawRequest(type: type)
            .tryMap { data, response in
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<300 ~= statusCode else {
                    throw NetworkError(failureResponse: response)
                }
                return data
            }
            .decode(type: decodableType, decoder: JSONDecoder())
            .mapError({ error in
                if let error = error as? NetworkError {
                    return error
                } else {
                    return NetworkError()
                }
            })
            .eraseToAnyPublisher()
    }
}


final class RestAPIServiceProvider: RestAPIService {
    init(){}
}
