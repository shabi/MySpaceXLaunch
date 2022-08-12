//
//  First_stage.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 08/08/22.
//

import Foundation
struct First_stage : Codable {
	let cores : [Cores]?

	enum CodingKeys: String, CodingKey {

		case cores = "cores"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		cores = try values.decodeIfPresent([Cores].self, forKey: .cores)
	}

}
