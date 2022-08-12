//
//  Fairings.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 08/08/22.
//

import Foundation
struct Fairings : Codable {
	let reused : Bool?
	let recovery_attempt : Bool?
	let recovered : Bool?
	let ship : String?

	enum CodingKeys: String, CodingKey {

		case reused = "reused"
		case recovery_attempt = "recovery_attempt"
		case recovered = "recovered"
		case ship = "ship"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		reused = try values.decodeIfPresent(Bool.self, forKey: .reused)
		recovery_attempt = try values.decodeIfPresent(Bool.self, forKey: .recovery_attempt)
		recovered = try values.decodeIfPresent(Bool.self, forKey: .recovered)
		ship = try values.decodeIfPresent(String.self, forKey: .ship)
	}

}
