//
//  Payloads.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 08/08/22.
//

import Foundation
struct Payloads : Codable {
	let payload_id : String?
	let norad_id : [Int]?
	let reused : Bool?
	let customers : [String]?
	let nationality : String?
	let manufacturer : String?
	let payload_type : String?
	let payload_mass_kg : Double?
	let payload_mass_lbs : Double?
	let orbit : String?
	let orbit_params : Orbit_params?

	enum CodingKeys: String, CodingKey {

		case payload_id = "payload_id"
		case norad_id = "norad_id"
		case reused = "reused"
		case customers = "customers"
		case nationality = "nationality"
		case manufacturer = "manufacturer"
		case payload_type = "payload_type"
		case payload_mass_kg = "payload_mass_kg"
		case payload_mass_lbs = "payload_mass_lbs"
		case orbit = "orbit"
		case orbit_params = "orbit_params"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		payload_id = try values.decodeIfPresent(String.self, forKey: .payload_id)
		norad_id = try values.decodeIfPresent([Int].self, forKey: .norad_id)
		reused = try values.decodeIfPresent(Bool.self, forKey: .reused)
		customers = try values.decodeIfPresent([String].self, forKey: .customers)
		nationality = try values.decodeIfPresent(String.self, forKey: .nationality)
		manufacturer = try values.decodeIfPresent(String.self, forKey: .manufacturer)
		payload_type = try values.decodeIfPresent(String.self, forKey: .payload_type)
		payload_mass_kg = try values.decodeIfPresent(Double.self, forKey: .payload_mass_kg)
		payload_mass_lbs = try values.decodeIfPresent(Double.self, forKey: .payload_mass_lbs)
		orbit = try values.decodeIfPresent(String.self, forKey: .orbit)
		orbit_params = try values.decodeIfPresent(Orbit_params.self, forKey: .orbit_params)
	}

}
