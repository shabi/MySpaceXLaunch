//
//  RocketDetailViewModel.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 12/08/22.
//

import Foundation

protocol RocketDetailViewModelType {
    var imageLink: String?  { get }
    var wikiLink: String? { get }
}

class RocketDetailViewModel: RocketDetailViewModelType {
    private var imageLinkInfo: String?
    private var wikiLinkInfo: String?
    var imageLink: String? {
        return imageLinkInfo
    }
    
    var wikiLink: String? {
        return wikiLinkInfo
    }
    
    init(launchInfo: LaunchInfo?) {
        guard let launchInfo = launchInfo else {return}
        if let imageurl = launchInfo.links?.mission_patch { imageLinkInfo = imageurl}
        if let wikipedia = launchInfo.links?.wikipedia { wikiLinkInfo = wikipedia}
    }

}

