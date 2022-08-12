//
//  Timeline.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 08/08/22.
//

import Foundation
struct Timeline : Codable {
	let webcast_liftoff : Int?
	let go_for_prop_loading : Int?
	let rp1_loading : Int?
	let stage1_lox_loading : Int?
	let stage2_lox_loading : Int?
	let engine_chill : Int?
	let prelaunch_checks : Int?
	let propellant_pressurization : Int?
	let go_for_launch : Int?
	let ignition : Int?
	let liftoff : Int?
	let maxq : Int?
	let meco : Int?
	let stage_sep : Int?
	let second_stage_ignition : Int?
	let fairing_deploy : Int?
	let first_stage_entry_burn : Int?
	let seco_1 : Int?
	let first_stage_landing : Int?
	let second_stage_restart : Int?
	let seco_2 : Int?
	let payload_deploy : Int?

	enum CodingKeys: String, CodingKey {

		case webcast_liftoff = "webcast_liftoff"
		case go_for_prop_loading = "go_for_prop_loading"
		case rp1_loading = "rp1_loading"
		case stage1_lox_loading = "stage1_lox_loading"
		case stage2_lox_loading = "stage2_lox_loading"
		case engine_chill = "engine_chill"
		case prelaunch_checks = "prelaunch_checks"
		case propellant_pressurization = "propellant_pressurization"
		case go_for_launch = "go_for_launch"
		case ignition = "ignition"
		case liftoff = "liftoff"
		case maxq = "maxq"
		case meco = "meco"
		case stage_sep = "stage_sep"
		case second_stage_ignition = "second_stage_ignition"
		case fairing_deploy = "fairing_deploy"
		case first_stage_entry_burn = "first_stage_entry_burn"
		case seco_1 = "seco-1"
		case first_stage_landing = "first_stage_landing"
		case second_stage_restart = "second_stage_restart"
		case seco_2 = "seco-2"
		case payload_deploy = "payload_deploy"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		webcast_liftoff = try values.decodeIfPresent(Int.self, forKey: .webcast_liftoff)
		go_for_prop_loading = try values.decodeIfPresent(Int.self, forKey: .go_for_prop_loading)
		rp1_loading = try values.decodeIfPresent(Int.self, forKey: .rp1_loading)
		stage1_lox_loading = try values.decodeIfPresent(Int.self, forKey: .stage1_lox_loading)
		stage2_lox_loading = try values.decodeIfPresent(Int.self, forKey: .stage2_lox_loading)
		engine_chill = try values.decodeIfPresent(Int.self, forKey: .engine_chill)
		prelaunch_checks = try values.decodeIfPresent(Int.self, forKey: .prelaunch_checks)
		propellant_pressurization = try values.decodeIfPresent(Int.self, forKey: .propellant_pressurization)
		go_for_launch = try values.decodeIfPresent(Int.self, forKey: .go_for_launch)
		ignition = try values.decodeIfPresent(Int.self, forKey: .ignition)
		liftoff = try values.decodeIfPresent(Int.self, forKey: .liftoff)
		maxq = try values.decodeIfPresent(Int.self, forKey: .maxq)
		meco = try values.decodeIfPresent(Int.self, forKey: .meco)
		stage_sep = try values.decodeIfPresent(Int.self, forKey: .stage_sep)
		second_stage_ignition = try values.decodeIfPresent(Int.self, forKey: .second_stage_ignition)
		fairing_deploy = try values.decodeIfPresent(Int.self, forKey: .fairing_deploy)
		first_stage_entry_burn = try values.decodeIfPresent(Int.self, forKey: .first_stage_entry_burn)
        seco_1 = try values.decodeIfPresent(Int.self, forKey: .seco_1)
		first_stage_landing = try values.decodeIfPresent(Int.self, forKey: .first_stage_landing)
		second_stage_restart = try values.decodeIfPresent(Int.self, forKey: .second_stage_restart)
        seco_2 = try values.decodeIfPresent(Int.self, forKey: .seco_2)
		payload_deploy = try values.decodeIfPresent(Int.self, forKey: .payload_deploy)
	}

}
