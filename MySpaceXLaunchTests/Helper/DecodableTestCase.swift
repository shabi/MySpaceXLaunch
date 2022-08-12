//
//  DecodableTestCase.swift
//  MySpaceXLaunchTests
//
//  Created by Shabi Naqvi on 12/08/22.
//

import Foundation
import XCTest

protocol DecodableTestCase: AnyObject {
    associatedtype T: Decodable
    var sut: T! { get set }
}
extension DecodableTestCase {
    func givenSUTFromJSON(fileName: String = "\(T.self)") throws {
        let decoder = JSONDecoder()
        let data = try Data.fromJSON(fileName: fileName)
        sut = try decoder.decode(T.self, from: data)
    }
}
