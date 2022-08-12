//
//  Telemetry.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 08/08/22.
//

import Foundation
struct Telemetry : Codable {
	let flight_club : String?

	enum CodingKeys: String, CodingKey {

		case flight_club = "flight_club"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		flight_club = try values.decodeIfPresent(String.self, forKey: .flight_club)
	}

}
