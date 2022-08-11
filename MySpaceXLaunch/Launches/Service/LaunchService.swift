//
//  LaunchService.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 08/08/22.
//

import Foundation
import Combine

protocol LaunchService {
    func getLaunchService() -> AnyPublisher<[LaunchInfo], NetworkError>
}

final class LaunchServiceProvider: LaunchService {
    private var networking: RestAPIService
        
    init(networking: RestAPIService) {
        self.networking = networking
    }
    
    func getLaunchService() -> AnyPublisher<[LaunchInfo], NetworkError> {
        self.networking
            .decodableRequest(type: LaunchesRequest(), decodableType: [LaunchInfo].self)
            .eraseToAnyPublisher()
    }
}

