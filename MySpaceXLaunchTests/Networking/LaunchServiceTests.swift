//
//  LaunchServiceTests.swift
//  MySpaceXLaunchTests
//
//  Created by Shabi Naqvi on 12/08/22.
//

import XCTest
import Combine
@testable import MySpaceXLaunch

class LaunchServiceTests: XCTestCase {
    
    var cancelable = Set<AnyCancellable>()
     
     func testSucessfullyRetriveCompanyResponse() {
         let exp = expectation(description: "response")
         let json = """
[
{
  "flight_number": 65,
  "mission_name": "Telstar 19V",
  "mission_id": [
    "F4F83DE"
  ],
  "launch_year": "2018",
  "launch_date_unix": 1532238600,
  "launch_date_utc": "2018-07-22T05:50:00.000Z",
  "launch_date_local": "2018-07-22T01:50:00-04:00",
  "is_tentative": false,
  "tentative_max_precision": "hour",
  "tbd": false,
  "launch_window": 7200,
  "rocket": {
    "rocket_id": "falcon9",
    "rocket_name": "Falcon 9",
    "rocket_type": "FT",
    "first_stage": {
      "cores": [
        {
          "core_serial": "B1047",
          "flight": 1,
          "block": 5,
          "gridfins": true,
          "legs": true,
          "reused": false,
          "land_success": true,
          "landing_intent": true,
          "landing_type": "ASDS",
          "landing_vehicle": "OCISLY"
        }
      ]
    },
    "second_stage": {
      "block": 5,
      "payloads": [
        {
          "payload_id": "Telstar 19V",
          "norad_id": [
            43562
          ],
          "reused": false,
          "customers": [
            "Telesat"
          ],
          "nationality": "Canada",
          "manufacturer": "SSL",
          "payload_type": "Satellite",
          "payload_mass_kg": 7076,
          "payload_mass_lbs": 15600,
          "orbit": "GTO",
          "orbit_params": {
            "reference_system": "geocentric",
            "regime": "geostationary",
            "longitude": -65,
            "semi_major_axis_km": 42163.837,
            "eccentricity": 0.0001327,
            "periapsis_km": 35780.107,
            "apoapsis_km": 35791.297,
            "inclination_deg": 0.0126,
            "period_min": 1436.051,
            "lifespan_years": 15,
            "epoch": "2019-02-03T19:17:09.000Z",
            "mean_motion": 1.00274977,
            "raan": 130.2989,
            "arg_of_pericenter": 165.1069,
            "mean_anomaly": 64.5495
          }
        }
      ]
    },
    "fairings": {
      "reused": false,
      "recovery_attempt": false,
      "recovered": false,
      "ship": null
    }
  },
  "ships": [
    "GOPURSUIT",
    "GOQUEST",
    "HAWK",
    "OCISLY"
  ],
  "telemetry": {
    "flight_club": "https://www.flightclub.io/results/?code=TS19V"
  },
  "launch_site": {
    "site_id": "ccafs_slc_40",
    "site_name": "CCAFS SLC 40",
    "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
  },
  "launch_success": true,
  "links": {
    "mission_patch": "https://images2.imgbox.com/c5/53/5jklZkPz_o.png",
    "mission_patch_small": "https://images2.imgbox.com/12/7c/NiniYxoh_o.png",
    "reddit_campaign": "https://www.reddit.com/r/spacex/comments/8w19yg/telstar_19v_launch_campaign_thread/",
    "reddit_launch": "https://www.reddit.com/r/spacex/comments/90p1a6/rspacex_telstar_19v_official_launch_discussion/",
    "reddit_recovery": null,
    "reddit_media": "https://www.reddit.com/r/spacex/comments/90oxrr/rspacex_telstar_19v_media_thread_videos_images/",
    "presskit": "http://www.spacex.com/sites/spacex/files/telstar19vantagepresskit.pdf",
    "article_link": "https://spaceflightnow.com/2018/07/22/spacex-delivers-for-telesat-with-successful-early-morning-launch/",
    "wikipedia": "https://en.wikipedia.org/wiki/Telstar_19V",
    "video_link": "https://www.youtube.com/watch?v=xybp6zLaGx4",
    "youtube_id": "xybp6zLaGx4",
    "flickr_images": [
      "https://farm1.staticflickr.com/856/28684550147_49802752b3_o.jpg",
      "https://farm1.staticflickr.com/927/28684552447_956a9744f1_o.jpg",
      "https://farm2.staticflickr.com/1828/29700007298_8ac5891d2c_o.jpg",
      "https://farm1.staticflickr.com/914/29700004918_31ed7b73ef_o.jpg",
      "https://farm1.staticflickr.com/844/29700002748_3047e50a0a_o.jpg",
      "https://farm2.staticflickr.com/1786/29700000688_2514cd3cbb_o.jpg"
    ]
  },
  "details": "SSL-manufactured communications satellite intended to be placed at 63° West over the Americas. At 7,075 kg, it became the heaviest commercial communications satellite ever launched.",
  "upcoming": false,
  "static_fire_date_utc": "2018-07-18T21:00:00.000Z",
  "static_fire_date_unix": 1531947600,
  "timeline": {
    "webcast_liftoff": 899,
    "go_for_prop_loading": -2280,
    "rp1_loading": -2100,
    "stage1_lox_loading": -2100,
    "stage2_lox_loading": -960,
    "engine_chill": -420,
    "prelaunch_checks": -60,
    "propellant_pressurization": -60,
    "go_for_launch": -45,
    "ignition": -3,
    "liftoff": 0,
    "maxq": 72,
    "meco": 150,
    "stage_sep": 153,
    "second_stage_ignition": 154,
    "fairing_deploy": 220,
    "first_stage_entry_burn": 372,
    "seco-1": 492,
    "first_stage_landing": 509,
    "second_stage_restart": 1609,
    "seco-2": 1659,
    "payload_deploy": 1960
  }
}
]
"""
         guard let jsonData = json.data(using: .utf8) else {
             XCTFail("Failed to encode")
             return
         }
         
         guard let launchInfoArray = try? JSONDecoder().decode([LaunchInfo].self, from: jsonData) else {
             XCTFail("Failed to decode")
             return
         }
         
         let networking = MockRestAPIServiceProvider<[LaunchInfo]>()
         let launchServiceProvider = LaunchServiceProvider(networking: networking)
         
         launchServiceProvider
             .getLaunchService()
             .sink { completion in
                 switch completion {
                 case .finished:
                     break
                 case .failure:
                     XCTFail("Expected Sucess")
                 }
             } receiveValue: { value in
                 XCTAssertEqual(value.first?.mission_name, "Telstar 19V")
                 XCTAssertEqual(value.first?.flight_number, 65)
                 exp.fulfill()
             }
             .store(in: &cancelable)

         networking.decodableResponse.send(launchInfoArray)
         
         waitForExpectations(timeout: 5)
     }
     
     func testRetriveCompanyFailed() {
         let exp = expectation(description: "response")
         
         let networking = MockRestAPIServiceProvider<[LaunchInfo]>()
         let launchServiceProvider = LaunchServiceProvider(networking: networking)
         
         launchServiceProvider
             .getLaunchService()
             .sink { completion in
                 switch completion {
                 case .finished:
                     XCTFail("Reached finished, error expected")
                     break
                 case .failure(let error):
                     XCTAssertEqual((error.failureResponse as! HTTPURLResponse).statusCode, 400)
                     exp.fulfill()
                     
                 }
             } receiveValue: { _ in
                 XCTFail("Expected Error")
             }
             .store(in: &cancelable)
         
         guard let url = URL(string: "https://example.com"), let response = HTTPURLResponse(url: url, statusCode: 400, httpVersion: "HTTP/1.1", headerFields: nil) else {
             XCTFail("Could not create mock response")
             return
         }
         
         
         let error = NetworkError(failureResponse: response)
         networking.decodableResponse.send(completion: .failure(error))
         
         waitForExpectations(timeout: 5)
     }
 }
