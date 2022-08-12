//
//  Second_stage.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 08/08/22.
//

import Foundation
struct Second_stage : Codable {
	let block : Int?
	let payloads : [Payloads]?

	enum CodingKeys: String, CodingKey {

		case block = "block"
		case payloads = "payloads"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		block = try values.decodeIfPresent(Int.self, forKey: .block)
		payloads = try values.decodeIfPresent([Payloads].self, forKey: .payloads)
	}

}
