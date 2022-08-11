//
//  Links.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 08/08/22.
//

import Foundation
struct Links : Codable {
    let website : String?
    let flickr : String?
    let twitter : String?
    let elon_twitter : String?

    enum CodingKeys: String, CodingKey {

        case website = "website"
        case flickr = "flickr"
        case twitter = "twitter"
        case elon_twitter = "elon_twitter"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        website = try values.decodeIfPresent(String.self, forKey: .website)
        flickr = try values.decodeIfPresent(String.self, forKey: .flickr)
        twitter = try values.decodeIfPresent(String.self, forKey: .twitter)
        elon_twitter = try values.decodeIfPresent(String.self, forKey: .elon_twitter)
    }

}
