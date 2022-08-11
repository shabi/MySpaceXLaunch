//
//  LaunchListTableViewCellViewModel.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 11/08/22.
//

import Foundation
import Combine

protocol LaunchListTableViewCellViewModelType {
    var launch: LaunchInfo { get }
    var mission: String? { get }
    var dateTime: String? { get }
    var rocketName: String? { get }
    var launchDay: String? { get }
    var rocketImageLink: String? { get }
    var status: Bool { get }
}

class LaunchListTableViewCellViewModel: LaunchListTableViewCellViewModelType {
    
    private var launchInfo: LaunchInfo
    private var missionName: String?
    private var dateTimeInfo: String?
    private var rocketNameInfo: String?
    private var launchDayInfo: String?
    private var rocketImageUrl: String?
    private var launchStatus: Bool = false
    
    var rocketImageLink: String? {
        return rocketImageUrl
    }
    
    var status: Bool {
        return launchStatus
    }
    
    var launch: LaunchInfo {
        return launchInfo
    }
    
    var mission: String? {
        return missionName
    }
    
    var dateTime: String? {
        return dateTimeInfo
    }
    
    var launchDay: String? {
        return launchDayInfo
    }
    
    var rocketName: String? {
        return rocketNameInfo
    }
    
     init(launch: LaunchInfo) {
        self.launchInfo = launch
        self.missionName = launch.mission_name
        self.rocketNameInfo = launch.rocket?.rocket_name
        self.rocketImageUrl = launch.links?.mission_patch_small
        self.launchStatus = launch.launch_success ?? false
        if let date = launch.launch_date_utc {
            let dateValue = DateFormatter.iso8601Full.date(from: date)
            self.dateTimeInfo = "\(DateFormatter.dateTimeSeconds.string(from: dateValue!)) (UTC)"
            self.launchDayInfo = launch.launch_date_utc
            let diffInDays = Calendar.current.dateComponents([.day], from: dateValue!, to: Date()).day
            self.launchDayInfo = "\(diffInDays!)"
        } else {
            self.dateTimeInfo = "Launch time: TBD"
        }
    }
    
    public func configure(_ cell: LaunchListTableViewCell) {
        cell.viewModel = LaunchListTableViewCellViewModel(launch: self.launch)
        cell.setupListeners()
    }
}

//extension LaunchListTableViewCellViewModel: Equatable {
////    static func == (lhs: LaunchListTableViewCellViewModel, rhs: LaunchListTableViewCellViewModel) -> Bool {
////        return lhs.launch.value == rhs.launch.value
////    }
//}

