//
//  Launch_site.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 08/08/22.
//

import Foundation
struct Launch_site : Codable {
	let site_id : String?
	let site_name : String?
	let site_name_long : String?

	enum CodingKeys: String, CodingKey {

		case site_id = "site_id"
		case site_name = "site_name"
		case site_name_long = "site_name_long"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		site_id = try values.decodeIfPresent(String.self, forKey: .site_id)
		site_name = try values.decodeIfPresent(String.self, forKey: .site_name)
		site_name_long = try values.decodeIfPresent(String.self, forKey: .site_name_long)
	}

}
