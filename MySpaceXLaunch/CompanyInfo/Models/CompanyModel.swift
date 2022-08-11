//
//  CompanyModel.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 08/08/22.
//

import Foundation
struct CompanyInfo : Codable {
    let name : String?
    let founder : String?
    let founded : Int?
    let employees : Int?
    let vehicles : Int?
    let launch_sites : Int?
    let test_sites : Int?
    let ceo : String?
    let cto : String?
    let coo : String?
    let cto_propulsion : String?
    let valuation : Int?
    let headquarters : Headquarters?
    let links : Links?
    let summary : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case founder = "founder"
        case founded = "founded"
        case employees = "employees"
        case vehicles = "vehicles"
        case launch_sites = "launch_sites"
        case test_sites = "test_sites"
        case ceo = "ceo"
        case cto = "cto"
        case coo = "coo"
        case cto_propulsion = "cto_propulsion"
        case valuation = "valuation"
        case headquarters = "headquarters"
        case links = "links"
        case summary = "summary"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        founder = try values.decodeIfPresent(String.self, forKey: .founder)
        founded = try values.decodeIfPresent(Int.self, forKey: .founded)
        employees = try values.decodeIfPresent(Int.self, forKey: .employees)
        vehicles = try values.decodeIfPresent(Int.self, forKey: .vehicles)
        launch_sites = try values.decodeIfPresent(Int.self, forKey: .launch_sites)
        test_sites = try values.decodeIfPresent(Int.self, forKey: .test_sites)
        ceo = try values.decodeIfPresent(String.self, forKey: .ceo)
        cto = try values.decodeIfPresent(String.self, forKey: .cto)
        coo = try values.decodeIfPresent(String.self, forKey: .coo)
        cto_propulsion = try values.decodeIfPresent(String.self, forKey: .cto_propulsion)
        valuation = try values.decodeIfPresent(Int.self, forKey: .valuation)
        headquarters = try values.decodeIfPresent(Headquarters.self, forKey: .headquarters)
        links = try values.decodeIfPresent(Links.self, forKey: .links)
        summary = try values.decodeIfPresent(String.self, forKey: .summary)
    }

}

