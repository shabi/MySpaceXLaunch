//
//  LaunchInfo.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 08/08/22.
//

import Foundation
struct LaunchInfo : Codable {
	let flight_number : Int?
	let mission_name : String?
	let mission_id : [String]?
	let launch_year : String?
	let launch_date_unix : Int?
	let launch_date_utc : String?
	let launch_date_local : String?
	let is_tentative : Bool?
	let tentative_max_precision : String?
	let tbd : Bool?
	let launch_window : Int?
	let rocket : Rocket?
	let ships : [String]?
	let telemetry : Telemetry?
	let launch_site : Launch_site?
	let launch_success : Bool?
	let links : LinksInfo?
	let details : String?
	let upcoming : Bool?
	let static_fire_date_utc : String?
	let static_fire_date_unix : Int?
	let timeline : Timeline?

	enum CodingKeys: String, CodingKey {

		case flight_number = "flight_number"
		case mission_name = "mission_name"
		case mission_id = "mission_id"
		case launch_year = "launch_year"
		case launch_date_unix = "launch_date_unix"
		case launch_date_utc = "launch_date_utc"
		case launch_date_local = "launch_date_local"
		case is_tentative = "is_tentative"
		case tentative_max_precision = "tentative_max_precision"
		case tbd = "tbd"
		case launch_window = "launch_window"
		case rocket = "rocket"
		case ships = "ships"
		case telemetry = "telemetry"
		case launch_site = "launch_site"
		case launch_success = "launch_success"
		case links = "links"
		case details = "details"
		case upcoming = "upcoming"
		case static_fire_date_utc = "static_fire_date_utc"
		case static_fire_date_unix = "static_fire_date_unix"
		case timeline = "timeline"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		flight_number = try values.decodeIfPresent(Int.self, forKey: .flight_number)
		mission_name = try values.decodeIfPresent(String.self, forKey: .mission_name)
		mission_id = try values.decodeIfPresent([String].self, forKey: .mission_id)
		launch_year = try values.decodeIfPresent(String.self, forKey: .launch_year)
		launch_date_unix = try values.decodeIfPresent(Int.self, forKey: .launch_date_unix)
		launch_date_utc = try values.decodeIfPresent(String.self, forKey: .launch_date_utc)
		launch_date_local = try values.decodeIfPresent(String.self, forKey: .launch_date_local)
		is_tentative = try values.decodeIfPresent(Bool.self, forKey: .is_tentative)
		tentative_max_precision = try values.decodeIfPresent(String.self, forKey: .tentative_max_precision)
		tbd = try values.decodeIfPresent(Bool.self, forKey: .tbd)
		launch_window = try values.decodeIfPresent(Int.self, forKey: .launch_window)
		rocket = try values.decodeIfPresent(Rocket.self, forKey: .rocket)
		ships = try values.decodeIfPresent([String].self, forKey: .ships)
		telemetry = try values.decodeIfPresent(Telemetry.self, forKey: .telemetry)
		launch_site = try values.decodeIfPresent(Launch_site.self, forKey: .launch_site)
		launch_success = try values.decodeIfPresent(Bool.self, forKey: .launch_success)
		links = try values.decodeIfPresent(LinksInfo.self, forKey: .links)
		details = try values.decodeIfPresent(String.self, forKey: .details)
		upcoming = try values.decodeIfPresent(Bool.self, forKey: .upcoming)
		static_fire_date_utc = try values.decodeIfPresent(String.self, forKey: .static_fire_date_utc)
		static_fire_date_unix = try values.decodeIfPresent(Int.self, forKey: .static_fire_date_unix)
		timeline = try values.decodeIfPresent(Timeline.self, forKey: .timeline)
	}

}
