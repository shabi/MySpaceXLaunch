//
//  LaunchesRequest.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 08/08/22.
//

import Foundation

class LaunchesRequest: Request {
    var baseURL: String {
        "https://api.spacexdata.com"
    }

    var path: String {
        "/v3/launches"
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
}
