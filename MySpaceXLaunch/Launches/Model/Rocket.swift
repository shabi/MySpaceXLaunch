//
//  Rocket.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 08/08/22.
//

import Foundation
struct Rocket : Codable {
	let rocket_id : String?
	let rocket_name : String?
	let rocket_type : String?
	let first_stage : First_stage?
	let second_stage : Second_stage?
	let fairings : Fairings?

	enum CodingKeys: String, CodingKey {

		case rocket_id = "rocket_id"
		case rocket_name = "rocket_name"
		case rocket_type = "rocket_type"
		case first_stage = "first_stage"
		case second_stage = "second_stage"
		case fairings = "fairings"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		rocket_id = try values.decodeIfPresent(String.self, forKey: .rocket_id)
		rocket_name = try values.decodeIfPresent(String.self, forKey: .rocket_name)
		rocket_type = try values.decodeIfPresent(String.self, forKey: .rocket_type)
		first_stage = try values.decodeIfPresent(First_stage.self, forKey: .first_stage)
		second_stage = try values.decodeIfPresent(Second_stage.self, forKey: .second_stage)
		fairings = try values.decodeIfPresent(Fairings.self, forKey: .fairings)
	}

}
