//
//  Cores.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 08/08/22.
//

import Foundation
struct Cores : Codable {
	let core_serial : String?
	let flight : Int?
	let block : Int?
	let gridfins : Bool?
	let legs : Bool?
	let reused : Bool?
	let land_success : Bool?
	let landing_intent : Bool?
	let landing_type : String?
	let landing_vehicle : String?

	enum CodingKeys: String, CodingKey {

		case core_serial = "core_serial"
		case flight = "flight"
		case block = "block"
		case gridfins = "gridfins"
		case legs = "legs"
		case reused = "reused"
		case land_success = "land_success"
		case landing_intent = "landing_intent"
		case landing_type = "landing_type"
		case landing_vehicle = "landing_vehicle"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		core_serial = try values.decodeIfPresent(String.self, forKey: .core_serial)
		flight = try values.decodeIfPresent(Int.self, forKey: .flight)
		block = try values.decodeIfPresent(Int.self, forKey: .block)
		gridfins = try values.decodeIfPresent(Bool.self, forKey: .gridfins)
		legs = try values.decodeIfPresent(Bool.self, forKey: .legs)
		reused = try values.decodeIfPresent(Bool.self, forKey: .reused)
		land_success = try values.decodeIfPresent(Bool.self, forKey: .land_success)
		landing_intent = try values.decodeIfPresent(Bool.self, forKey: .landing_intent)
		landing_type = try values.decodeIfPresent(String.self, forKey: .landing_type)
		landing_vehicle = try values.decodeIfPresent(String.self, forKey: .landing_vehicle)
	}

}
