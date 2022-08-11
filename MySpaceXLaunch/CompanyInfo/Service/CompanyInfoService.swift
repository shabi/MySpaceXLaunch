//
//  CompanyInfoService.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 08/08/22.
//

import Foundation
import Combine

protocol CompanyInfoService {
    func getCompanyInfoService() -> AnyPublisher<CompanyInfo, NetworkError>
}

final class CompanyInfoServiceProvider: CompanyInfoService {
    private var networking: RestAPIService
        
    init(networking: RestAPIService) {
        self.networking = networking
    }
    
    func getCompanyInfoService() -> AnyPublisher<CompanyInfo, NetworkError> {
        self.networking
            .decodableRequest(type: CompanyInfoRequest(), decodableType: CompanyInfo.self)
            .eraseToAnyPublisher()
    }
}


