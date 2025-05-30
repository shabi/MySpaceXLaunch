//
//  CompanyInfoModelsTest.swift
//  MySpaceXLaunchTests
//
//  Created by Shabi Naqvi on 08/08/22.
//

@testable import MySpaceXLaunch
import XCTest

final class CompanyInfoModelsTest: XCTestCase {
    
    func testCompanyInfoModel() {
        
        let json = """
{"name":"SpaceX","founder":"Elon Musk","founded":2002,"employees":7000,"vehicles":3,"launch_sites":3,"test_sites":1,"ceo":"Elon Musk","cto":"Elon Musk","coo":"Gwynne Shotwell","cto_propulsion":"Tom Mueller","valuation":27500000000,"headquarters":{"address":"Rocket Road","city":"Hawthorne","state":"California"},"links":{"website":"https://www.spacex.com/","flickr":"https://www.flickr.com/photos/spacex/","twitter":"https://twitter.com/SpaceX","elon_twitter":"https://twitter.com/elonmusk"},"summary":"SpaceX designs, manufactures and launches advanced rockets and spacecraft. The company was founded in 2002 to revolutionize space technology, with the ultimate goal of enabling people to live on other planets."}
"""
        
        guard let jsonData = json.data(using: .utf8) else {
            XCTFail("Failed to encode")
            return
        }
        
        guard let companyInfo = try? JSONDecoder().decode(CompanyInfo.self, from: jsonData) else {
            XCTFail("Failed to decode")
            return
        }
        
        XCTAssertEqual(companyInfo.founder, "Elon Musk")
    }
    
    func testLaunchModel() {
        
        let json = """
[
  {
    "flight_number": 1,
    "mission_name": "FalconSat",
    "mission_id": [],
    "upcoming": false,
    "launch_year": "2006",
    "launch_date_unix": 1143239400,
    "launch_date_utc": "2006-03-24T22:30:00.000Z",
    "launch_date_local": "2006-03-25T10:30:00+12:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon1",
      "rocket_name": "Falcon 1",
      "rocket_type": "Merlin A",
      "first_stage": {
        "cores": [
          {
            "core_serial": "Merlin1A",
            "flight": 1,
            "block": null,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "FalconSAT-2",
            "norad_id": [],
            "reused": false,
            "customers": [
              "DARPA"
            ],
            "nationality": "United States",
            "manufacturer": "SSTL",
            "payload_type": "Satellite",
            "payload_mass_kg": 20,
            "payload_mass_lbs": 43,
            "orbit": "LEO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": null,
              "eccentricity": null,
              "periapsis_km": 400,
              "apoapsis_km": 500,
              "inclination_deg": 39,
              "period_min": null,
              "lifespan_years": null,
              "epoch": null,
              "mean_motion": null,
              "raan": null,
              "arg_of_pericenter": null,
              "mean_anomaly": null
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
    "ships": [],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "kwajalein_atoll",
      "site_name": "Kwajalein Atoll",
      "site_name_long": "Kwajalein Atoll Omelek Island"
    },
    "launch_success": false,
    "launch_failure_details": {
      "time": 33,
      "altitude": null,
      "reason": "merlin engine failure"
    },
    "links": {
      "mission_patch": "https://images2.imgbox.com/40/e3/GypSkayF_o.png",
      "mission_patch_small": "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png",
      "reddit_campaign": null,
      "reddit_launch": null,
      "reddit_recovery": null,
      "reddit_media": null,
      "presskit": null,
      "article_link": "https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html",
      "wikipedia": "https://en.wikipedia.org/wiki/DemoSat",
      "video_link": "https://www.youtube.com/watch?v=0a_00nJ_Y88",
      "youtube_id": "0a_00nJ_Y88",
      "flickr_images": []
    },
    "details": "Engine failure at 33 seconds and loss of vehicle",
    "static_fire_date_utc": "2006-03-17T00:00:00.000Z",
    "static_fire_date_unix": 1142553600,
    "timeline": {
      "webcast_liftoff": 54
    }
  },
  {
    "flight_number": 2,
    "mission_name": "DemoSat",
    "mission_id": [],
    "launch_year": "2007",
    "launch_date_unix": 1174439400,
    "launch_date_utc": "2007-03-21T01:10:00.000Z",
    "launch_date_local": "2007-03-21T13:10:00+12:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon1",
      "rocket_name": "Falcon 1",
      "rocket_type": "Merlin A",
      "first_stage": {
        "cores": [
          {
            "core_serial": "Merlin2A",
            "flight": 1,
            "block": null,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "DemoSAT",
            "norad_id": [],
            "reused": false,
            "customers": [
              "DARPA"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Satellite",
            "payload_mass_kg": null,
            "payload_mass_lbs": null,
            "orbit": "LEO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": null,
              "eccentricity": null,
              "periapsis_km": null,
              "apoapsis_km": null,
              "inclination_deg": null,
              "period_min": null,
              "lifespan_years": null,
              "epoch": null,
              "mean_motion": null,
              "raan": null,
              "arg_of_pericenter": null,
              "mean_anomaly": null
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
    "ships": [],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "kwajalein_atoll",
      "site_name": "Kwajalein Atoll",
      "site_name_long": "Kwajalein Atoll Omelek Island"
    },
    "launch_success": false,
    "launch_failure_details": {
      "time": 301,
      "altitude": 289,
      "reason": "harmonic oscillation leading to premature engine shutdown"
    },
    "links": {
      "mission_patch": "https://images2.imgbox.com/be/e7/iNqsqVYM_o.png",
      "mission_patch_small": "https://images2.imgbox.com/4f/e3/I0lkuJ2e_o.png",
      "reddit_campaign": null,
      "reddit_launch": null,
      "reddit_recovery": null,
      "reddit_media": null,
      "presskit": null,
      "article_link": "https://www.space.com/3590-spacex-falcon-1-rocket-fails-reach-orbit.html",
      "wikipedia": "https://en.wikipedia.org/wiki/DemoSat",
      "video_link": "https://www.youtube.com/watch?v=Lk4zQ2wP-Nc",
      "youtube_id": "Lk4zQ2wP-Nc",
      "flickr_images": []
    },
    "details": "Successful first stage burn and transition to second stage, maximum altitude 289 km, Premature engine shutdown at T+7 min 30 s, Failed to reach orbit, Failed to recover first stage",
    "upcoming": false,
    "static_fire_date_utc": null,
    "static_fire_date_unix": null,
    "timeline": {
      "webcast_liftoff": 60
    }
  },
  {
    "flight_number": 3,
    "mission_name": "Trailblazer",
    "mission_id": [],
    "launch_year": "2008",
    "launch_date_unix": 1217648040,
    "launch_date_utc": "2008-08-02T03:34:00.000Z",
    "launch_date_local": "2008-08-02T15:34:00+12:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon1",
      "rocket_name": "Falcon 1",
      "rocket_type": "Merlin C",
      "first_stage": {
        "cores": [
          {
            "core_serial": "Merlin1C",
            "flight": 1,
            "block": null,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "Trailblazer",
            "norad_id": [],
            "reused": false,
            "customers": [
              "NASA"
            ],
            "nationality": "United States",
            "manufacturer": "Space Dev",
            "payload_type": "Satellite",
            "payload_mass_kg": null,
            "payload_mass_lbs": null,
            "orbit": "LEO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": null,
              "eccentricity": null,
              "periapsis_km": null,
              "apoapsis_km": null,
              "inclination_deg": null,
              "period_min": null,
              "lifespan_years": null,
              "epoch": null,
              "mean_motion": null,
              "raan": null,
              "arg_of_pericenter": null,
              "mean_anomaly": null
            }
          },
          {
            "payload_id": "PRESat",
            "norad_id": [],
            "reused": false,
            "customers": [
              "ORS"
            ],
            "nationality": "United States",
            "manufacturer": null,
            "payload_type": "Satellite",
            "payload_mass_kg": null,
            "payload_mass_lbs": null,
            "orbit": "LEO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": null,
              "eccentricity": null,
              "periapsis_km": null,
              "apoapsis_km": null,
              "inclination_deg": null,
              "period_min": null,
              "lifespan_years": null,
              "epoch": null,
              "mean_motion": null,
              "raan": null,
              "arg_of_pericenter": null,
              "mean_anomaly": null
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
    "ships": [],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "kwajalein_atoll",
      "site_name": "Kwajalein Atoll",
      "site_name_long": "Kwajalein Atoll Omelek Island"
    },
    "launch_success": false,
    "launch_failure_details": {
      "time": 140,
      "altitude": 35,
      "reason": "residual stage-1 thrust led to collision between stage 1 and stage 2"
    },
    "links": {
      "mission_patch": "https://images2.imgbox.com/4b/bd/d8UxLh4q_o.png",
      "mission_patch_small": "https://images2.imgbox.com/3d/86/cnu0pan8_o.png",
      "reddit_campaign": null,
      "reddit_launch": null,
      "reddit_recovery": null,
      "reddit_media": null,
      "presskit": null,
      "article_link": "http://www.spacex.com/news/2013/02/11/falcon-1-flight-3-mission-summary",
      "wikipedia": "https://en.wikipedia.org/wiki/Trailblazer_(satellite)",
      "video_link": "https://www.youtube.com/watch?v=v0w9p3U8860",
      "youtube_id": "v0w9p3U8860",
      "flickr_images": []
    },
    "details": "Residual stage 1 thrust led to collision between stage 1 and stage 2",
    "upcoming": false,
    "static_fire_date_utc": null,
    "static_fire_date_unix": null,
    "timeline": {
      "webcast_liftoff": 14
    }
  },
  {
    "flight_number": 4,
    "mission_name": "RatSat",
    "mission_id": [],
    "launch_year": "2008",
    "launch_date_unix": 1222643700,
    "launch_date_utc": "2008-09-28T23:15:00.000Z",
    "launch_date_local": "2008-09-28T11:15:00+12:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon1",
      "rocket_name": "Falcon 1",
      "rocket_type": "Merlin C",
      "first_stage": {
        "cores": [
          {
            "core_serial": "Merlin2C",
            "flight": 1,
            "block": null,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "RatSat",
            "norad_id": [
              33393
            ],
            "reused": false,
            "customers": [
              "SpaceX"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Satellite",
            "payload_mass_kg": 165,
            "payload_mass_lbs": 363,
            "orbit": "LEO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "lifespan_years": null,
              "epoch": "2019-02-05T06:47:34.000Z",
              "mean_motion": 14.84700219,
              "raan": 103.1158,
              "semi_major_axis_km": 6992.663,
              "eccentricity": 0.0013082,
              "periapsis_km": 605.381,
              "apoapsis_km": 623.676,
              "inclination_deg": 9.3464,
              "period_min": 96.989,
              "arg_of_pericenter": 188.3837,
              "mean_anomaly": 171.6144
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
    "ships": [],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "kwajalein_atoll",
      "site_name": "Kwajalein Atoll",
      "site_name_long": "Kwajalein Atoll Omelek Island"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/e0/a7/FNjvKlXW_o.png",
      "mission_patch_small": "https://images2.imgbox.com/e9/c9/T8CfiSYb_o.png",
      "reddit_campaign": null,
      "reddit_launch": null,
      "reddit_recovery": null,
      "reddit_media": null,
      "presskit": null,
      "article_link": "https://en.wikipedia.org/wiki/Ratsat",
      "wikipedia": "https://en.wikipedia.org/wiki/Ratsat",
      "video_link": "https://www.youtube.com/watch?v=dLQ2tZEH6G0",
      "youtube_id": "dLQ2tZEH6G0",
      "flickr_images": []
    },
    "details": "Ratsat was carried to orbit on the first successful orbital launch of any privately funded and developed, liquid-propelled carrier rocket, the SpaceX Falcon 1",
    "upcoming": false,
    "static_fire_date_utc": "2008-09-20T00:00:00.000Z",
    "static_fire_date_unix": 1221868800,
    "timeline": {
      "webcast_liftoff": 5
    }
  },
  {
    "flight_number": 5,
    "mission_name": "RazakSat",
    "mission_id": [],
    "launch_year": "2009",
    "launch_date_unix": 1247456100,
    "launch_date_utc": "2009-07-13T03:35:00.000Z",
    "launch_date_local": "2009-07-13T15:35:00+12:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon1",
      "rocket_name": "Falcon 1",
      "rocket_type": "Merlin C",
      "first_stage": {
        "cores": [
          {
            "core_serial": "Merlin3C",
            "flight": 1,
            "block": null,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "RazakSAT",
            "norad_id": [
              35578
            ],
            "reused": false,
            "customers": [
              "ATSB"
            ],
            "nationality": "Malaysia",
            "manufacturer": "Satrec",
            "payload_type": "Satellite",
            "payload_mass_kg": 200,
            "payload_mass_lbs": 440,
            "orbit": "LEO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 7049.165,
              "eccentricity": 0.0017567,
              "periapsis_km": 658.647,
              "apoapsis_km": 683.414,
              "inclination_deg": 8.9856,
              "period_min": 98.167,
              "lifespan_years": null,
              "epoch": "2019-02-04T20:31:02.000Z",
              "mean_motion": 14.66885367,
              "raan": 233.0108,
              "arg_of_pericenter": 289.1874,
              "mean_anomaly": 70.6425
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
    "ships": [],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "kwajalein_atoll",
      "site_name": "Kwajalein Atoll",
      "site_name_long": "Kwajalein Atoll Omelek Island"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/8d/fc/0qdZMWWx_o.png",
      "mission_patch_small": "https://images2.imgbox.com/a7/ba/NBZSw3Ho_o.png",
      "reddit_campaign": null,
      "reddit_launch": null,
      "reddit_recovery": null,
      "reddit_media": null,
      "presskit": "http://www.spacex.com/press/2012/12/19/spacexs-falcon-1-successfully-delivers-razaksat-satellite-orbit",
      "article_link": "http://www.spacex.com/news/2013/02/12/falcon-1-flight-5",
      "wikipedia": "https://en.wikipedia.org/wiki/RazakSAT",
      "video_link": "https://www.youtube.com/watch?v=yTaIDooc8Og",
      "youtube_id": "yTaIDooc8Og",
      "flickr_images": []
    },
    "details": null,
    "upcoming": false,
    "static_fire_date_utc": null,
    "static_fire_date_unix": null,
    "timeline": {
      "webcast_liftoff": 5
    }
  },
  {
    "flight_number": 6,
    "mission_name": "Falcon 9 Test Flight",
    "mission_id": [
      "EE86F74"
    ],
    "launch_year": "2010",
    "launch_date_unix": 1275677100,
    "launch_date_utc": "2010-06-04T18:45:00.000Z",
    "launch_date_local": "2010-06-04T14:45:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "v1.0",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B0003",
            "flight": 1,
            "block": 1,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "Dragon Qualification Unit",
            "norad_id": [
              36595
            ],
            "reused": false,
            "customers": [
              "SpaceX"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Dragon Boilerplate",
            "payload_mass_kg": null,
            "payload_mass_lbs": null,
            "orbit": "LEO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 6634.458,
              "eccentricity": 0.0030715,
              "periapsis_km": 235.945,
              "apoapsis_km": 276.701,
              "inclination_deg": 34.5005,
              "period_min": 89.632,
              "lifespan_years": null,
              "epoch": "2010-06-04T20:04:51.000Z",
              "mean_motion": 16.06552645,
              "raan": 41.2862,
              "arg_of_pericenter": 213.759,
              "mean_anomaly": 146.1185
            }
          }
        ]
      },
      "fairings": null
    },
    "ships": [],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/d6/12/yxne8mMD_o.png",
      "mission_patch_small": "https://images2.imgbox.com/5c/36/gbDKf6Y7_o.png",
      "reddit_campaign": null,
      "reddit_launch": null,
      "reddit_recovery": null,
      "reddit_media": null,
      "presskit": "http://forum.nasaspaceflight.com/index.php?action=dlattach;topic=21869.0;attach=230821",
      "article_link": "http://www.spacex.com/news/2013/02/12/falcon-9-flight-1",
      "wikipedia": "https://en.wikipedia.org/wiki/Dragon_Spacecraft_Qualification_Unit",
      "video_link": "https://www.youtube.com/watch?v=nxSxgBKlYws",
      "youtube_id": "nxSxgBKlYws",
      "flickr_images": []
    },
    "details": null,
    "upcoming": false,
    "static_fire_date_utc": "2010-03-13T00:00:00.000Z",
    "static_fire_date_unix": 1268438400,
    "timeline": {
      "webcast_liftoff": 123,
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
      "maxq": 76,
      "meco": 174,
      "stage_sep": 176,
      "second_stage_ignition": 179,
      "seco-1": 476
    }
  },
  {
    "flight_number": 7,
    "mission_name": "COTS 1",
    "mission_id": [
      "EE86F74"
    ],
    "launch_year": "2010",
    "launch_date_unix": 1291822980,
    "launch_date_utc": "2010-12-08T15:43:00.000Z",
    "launch_date_local": "2010-12-08T11:43:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "v1.0",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B0004",
            "flight": 1,
            "block": 1,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "COTS Demo Flight 1",
            "norad_id": [
              37244
            ],
            "cap_serial": "C101",
            "reused": false,
            "customers": [
              "NASA(COTS)"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Dragon 1.0",
            "payload_mass_kg": null,
            "payload_mass_lbs": null,
            "orbit": "LEO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 6672.063,
              "eccentricity": 0.0021812,
              "periapsis_km": 279.375,
              "apoapsis_km": 308.481,
              "inclination_deg": 34.5447,
              "period_min": 90.396,
              "lifespan_years": null,
              "epoch": "2010-12-08T15:34:03.000Z",
              "mean_motion": 15.9298967,
              "raan": 180.7668,
              "arg_of_pericenter": 225.2707,
              "mean_anomaly": 136.6556
            }
          },
          {
            "payload_id": "Cubesats",
            "norad_id": [],
            "reused": false,
            "customers": [
              "NRO"
            ],
            "payload_type": "Satellite",
            "payload_mass_kg": null,
            "payload_mass_lbs": null,
            "orbit": "LEO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": null,
              "eccentricity": null,
              "periapsis_km": null,
              "apoapsis_km": null,
              "inclination_deg": null,
              "period_min": null,
              "lifespan_years": 0,
              "epoch": null,
              "mean_motion": null,
              "raan": null,
              "arg_of_pericenter": null,
              "mean_anomaly": null
            }
          }
        ]
      },
      "fairings": null
    },
    "ships": [
      "AMERICANCHAMPION"
    ],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/00/2f/FhtEd0nB_o.png",
      "mission_patch_small": "https://images2.imgbox.com/d9/3e/FfrN88ry_o.png",
      "reddit_campaign": null,
      "reddit_launch": null,
      "reddit_recovery": null,
      "reddit_media": null,
      "presskit": "http://www.spacex.com/files/downloads/cots1-20101206.pdf",
      "article_link": "https://en.wikipedia.org/wiki/SpaceX_COTS_Demo_Flight_1",
      "wikipedia": "https://en.wikipedia.org/wiki/SpaceX_COTS_Demo_Flight_1",
      "video_link": "https://www.youtube.com/watch?v=cdLITgWKe_0",
      "youtube_id": "cdLITgWKe_0",
      "flickr_images": []
    },
    "details": null,
    "upcoming": false,
    "static_fire_date_utc": "2010-12-04T00:00:00.000Z",
    "static_fire_date_unix": 1291420800,
    "timeline": {
      "webcast_liftoff": 14,
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
      "meco": 178,
      "stage_sep": 182,
      "second_stage_ignition": 189,
      "seco-1": 540,
      "dragon_separation": 575
    }
  },
  {
    "flight_number": 8,
    "mission_name": "COTS 2",
    "mission_id": [
      "EE86F74"
    ],
    "launch_year": "2012",
    "launch_date_unix": 1335944640,
    "launch_date_utc": "2012-05-22T07:44:00.000Z",
    "launch_date_local": "2012-05-22T03:44:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "v1.0",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B0005",
            "flight": 1,
            "block": 1,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "COTS Demo Flight 2",
            "norad_id": [
              38348
            ],
            "cap_serial": "C102",
            "reused": false,
            "customers": [
              "NASA(COTS)"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Dragon 1.0",
            "payload_mass_kg": 525,
            "payload_mass_lbs": 1157,
            "orbit": "LEO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 6711.684,
              "eccentricity": 0.0057963,
              "periapsis_km": 294.646,
              "apoapsis_km": 372.452,
              "inclination_deg": 51.6726,
              "period_min": 91.202,
              "lifespan_years": null,
              "epoch": "2012-05-22T09:12:31.000Z",
              "mean_motion": 15.78904505,
              "raan": 251.5418,
              "arg_of_pericenter": 331.7079,
              "mean_anomaly": 31.2745
            },
            "mass_returned_kg": null,
            "mass_returned_lbs": null,
            "flight_time_sec": 806400,
            "cargo_manifest": null
          }
        ]
      },
      "fairings": null
    },
    "ships": [
      "AMERICANCHAMPION"
    ],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/2b/8e/MYyHbnd2_o.png",
      "mission_patch_small": "https://images2.imgbox.com/fc/7a/r9ITwL12_o.png",
      "reddit_campaign": null,
      "reddit_launch": null,
      "reddit_recovery": null,
      "reddit_media": null,
      "presskit": "https://www.nasa.gov/pdf/649910main_cots2_presskit_051412.pdf",
      "article_link": "https://en.wikipedia.org/wiki/Dragon_C2%2B",
      "wikipedia": "https://en.wikipedia.org/wiki/Dragon_C2%2B",
      "video_link": "https://www.youtube.com/watch?v=tpQzDbAY7yI",
      "youtube_id": "tpQzDbAY7yI",
      "flickr_images": []
    },
    "details": "Launch was scrubbed on first attempt, second launch attempt was successful",
    "upcoming": false,
    "static_fire_date_utc": "2012-04-30T00:00:00.000Z",
    "static_fire_date_unix": 1335744000,
    "timeline": {
      "webcast_liftoff": 42,
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
      "maxq": 84,
      "meco": 180,
      "stage_sep": 180,
      "second_stage_ignition": 185,
      "seco-1": 554,
      "dragon_separation": 598,
      "dragon_solar_deploy": 713,
      "dragon_bay_door_deploy": 8808
    }
  },
  {
    "flight_number": 9,
    "mission_name": "CRS-1",
    "mission_id": [
      "EE86F74"
    ],
    "launch_year": "2012",
    "launch_date_unix": 1349656500,
    "launch_date_utc": "2012-10-08T00:35:00.000Z",
    "launch_date_local": "2012-10-08T20:35:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "v1.0",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B0006",
            "flight": 1,
            "block": 1,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "CRS-1",
            "norad_id": [
              38846
            ],
            "cap_serial": "C103",
            "reused": false,
            "customers": [
              "NASA (CRS)"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Dragon 1.0",
            "payload_mass_kg": 400,
            "payload_mass_lbs": 881,
            "orbit": "ISS",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 6643.164,
              "eccentricity": 0.0092222,
              "periapsis_km": 203.764,
              "apoapsis_km": 326.293,
              "inclination_deg": 51.6539,
              "period_min": 89.809,
              "lifespan_years": null,
              "epoch": "2012-10-08T00:31:33.000Z",
              "mean_motion": 16.03395683,
              "raan": 281.4248,
              "arg_of_pericenter": 54.4728,
              "mean_anomaly": 306.4841
            },
            "mass_returned_kg": 905,
            "mass_returned_lbs": 1995,
            "flight_time_sec": 1728000,
            "cargo_manifest": "https://en.wikipedia.org/wiki/SpaceX_CRS-1#Payload"
          },
          {
            "payload_id": "Orbcomm-OG2",
            "norad_id": [],
            "reused": false,
            "customers": [
              "Orbcomm"
            ],
            "payload_type": "Dragon 1.0",
            "payload_mass_kg": 400,
            "payload_mass_lbs": 881,
            "orbit": "LEO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": null,
              "eccentricity": null,
              "periapsis_km": null,
              "apoapsis_km": null,
              "inclination_deg": 45,
              "period_min": null,
              "lifespan_years": 5,
              "epoch": null,
              "mean_motion": null,
              "raan": null
            }
          }
        ]
      },
      "fairings": null
    },
    "ships": [
      "AMERICANISLANDER"
    ],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/52/09/eNvilptL_o.png",
      "mission_patch_small": "https://images2.imgbox.com/0b/33/2eLGEejP_o.png",
      "reddit_campaign": null,
      "reddit_launch": null,
      "reddit_recovery": null,
      "reddit_media": null,
      "presskit": "https://www.nasa.gov/pdf/694166main_SpaceXCRS-1PressKit.pdf",
      "article_link": "https://www.nasa.gov/mission_pages/station/main/spacex-crs1-target.html",
      "wikipedia": "https://en.wikipedia.org/wiki/SpaceX_CRS-1",
      "video_link": "https://www.youtube.com/watch?v=-Vk3hiV_zXU",
      "youtube_id": "-Vk3hiV_zXU",
      "flickr_images": []
    },
    "details": "CRS-1 successful, but the secondary payload was inserted into abnormally low orbit and lost due to Falcon 9 boost stage engine failure, ISS visiting vehicle safety rules, and the primary payload owner's contractual right to decline a second ignition of the second stage under some conditions.",
    "upcoming": false,
    "static_fire_date_utc": "2012-09-29T00:00:00.000Z",
    "static_fire_date_unix": 1348876800,
    "timeline": {
      "webcast_liftoff": 605,
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
      "maxq": 60,
      "meco": 180,
      "stage_sep": 180,
      "second_stage_ignition": 180,
      "seco-1": 540,
      "dragon_separation": 600,
      "dragon_solar_deploy": 720,
      "dragon_bay_door_deploy": 8400
    }
  },
  {
    "flight_number": 10,
    "mission_name": "CRS-2",
    "mission_id": [
      "EE86F74"
    ],
    "launch_year": "2013",
    "launch_date_unix": 1362165000,
    "launch_date_utc": "2013-03-01T19:10:00.000Z",
    "launch_date_local": "2013-03-01T15:10:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "v1.0",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B0007",
            "flight": 1,
            "block": 1,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "CRS-2",
            "norad_id": [
              39115
            ],
            "cap_serial": "C104",
            "reused": false,
            "customers": [
              "NASA (CRS)"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Dragon 1.0",
            "payload_mass_kg": 677,
            "payload_mass_lbs": 1492,
            "orbit": "ISS",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 6640.79,
              "eccentricity": 0.0089419,
              "periapsis_km": 203.274,
              "apoapsis_km": 322.036,
              "inclination_deg": 51.6797,
              "period_min": 89.761,
              "lifespan_years": null,
              "epoch": "2013-03-01T20:19:32.000Z",
              "mean_motion": 16.04255447,
              "raan": 281.5076,
              "arg_of_pericenter": 50.5296,
              "mean_anomaly": 127.2881
            },
            "mass_returned_kg": 1370,
            "mass_returned_lbs": 3020,
            "flight_time_sec": 2160000,
            "cargo_manifest": "https://en.wikipedia.org/wiki/SpaceX_CRS-2#Payload"
          }
        ]
      },
      "fairings": null
    },
    "ships": [
      "AMERICANISLANDER"
    ],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/ef/39/FyZRYeOh_o.png",
      "mission_patch_small": "https://images2.imgbox.com/1b/b6/Z4oktZeR_o.png",
      "reddit_campaign": null,
      "reddit_launch": "https://www.reddit.com/r/space/comments/19gm5f/live_coverage_spacex_crs2_launch_to_the_iss/c8nvah4",
      "reddit_recovery": null,
      "reddit_media": null,
      "presskit": "https://www.nasa.gov/sites/default/files/files/Orb2_PRESS_KIT.pdf",
      "article_link": "https://en.wikipedia.org/wiki/SpaceX_CRS-2",
      "wikipedia": "https://en.wikipedia.org/wiki/SpaceX_CRS-2",
      "video_link": "https://www.youtube.com/watch?v=ik0ElKl5kW4",
      "youtube_id": "ik0ElKl5kW4",
      "flickr_images": []
    },
    "details": "Last launch of the original Falcon 9 v1.0 launch vehicle",
    "upcoming": false,
    "static_fire_date_utc": "2013-02-25T18:30:00.000Z",
    "static_fire_date_unix": 1361817000,
    "timeline": {
      "webcast_liftoff": 2393,
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
      "maxq": 60,
      "meco": 180,
      "stage_sep": 180,
      "second_stage_ignition": 180,
      "seco-1": 540,
      "dragon_separation": 600,
      "dragon_solar_deploy": 720,
      "dragon_bay_door_deploy": 8400
    }
  },
  {
    "flight_number": 11,
    "mission_name": "CASSIOPE",
    "mission_id": [],
    "launch_year": "2013",
    "launch_date_unix": 1380470400,
    "launch_date_utc": "2013-09-29T16:00:00.000Z",
    "launch_date_local": "2013-09-29T09:00:00-07:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "v1.1",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1003",
            "flight": 1,
            "block": 1,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": false,
            "landing_intent": true,
            "landing_type": "Ocean",
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "CASSIOPE",
            "norad_id": [
              39265
            ],
            "reused": false,
            "customers": [
              "MDA"
            ],
            "nationality": "Canada",
            "manufacturer": "MDA",
            "payload_type": "Satellite",
            "payload_mass_kg": 500,
            "payload_mass_lbs": 1100,
            "orbit": "PO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 7180.434,
              "eccentricity": 0.0670527,
              "periapsis_km": 320.832,
              "apoapsis_km": 1283.767,
              "inclination_deg": 80.9698,
              "period_min": 100.921,
              "lifespan_years": 2,
              "epoch": "2019-02-05T04:25:09.000Z",
              "mean_motion": 14.26844543,
              "raan": 114.2528,
              "arg_of_pericenter": 316.6289,
              "mean_anomaly": 38.3927
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
      "AMERICANSPIRIT"
    ],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "vafb_slc_4e",
      "site_name": "VAFB SLC 4E",
      "site_name_long": "Vandenberg Air Force Base Space Launch Complex 4E"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/89/bc/JcbcvuBI_o.png",
      "mission_patch_small": "https://images2.imgbox.com/91/27/VhC1TTYN_o.png",
      "reddit_campaign": null,
      "reddit_launch": "http://www.reddit.com/r/spacex/comments/1ndlay",
      "reddit_recovery": null,
      "reddit_media": null,
      "presskit": "https://spaceflightnow.com/falcon9/006/UpgradedF9DemoMission_PressKit.pdf",
      "article_link": "http://www.parabolicarc.com/2013/09/29/falcon-9-launch-payloads-orbit-vandenberg/",
      "wikipedia": "https://en.wikipedia.org/wiki/CASSIOPE",
      "video_link": "https://www.youtube.com/watch?v=uFefasS6bhc",
      "youtube_id": "uFefasS6bhc",
      "flickr_images": []
    },
    "details": "Commercial mission and first Falcon 9 v1.1 flight, with improved 13-tonne to LEO capacity. Following second-stage separation from the first stage, an attempt was made to perform an ocean touchdown test of the discarded booster vehicle. The test provided good test data on the experiment-its primary objective-but as the booster neared the ocean, aerodynamic forces caused an uncontrollable roll. The center engine, depleted of fuel by centrifugal force, shut down resulting in the impact and destruction of the vehicle.",
    "upcoming": false,
    "static_fire_date_utc": "2013-09-19T00:00:00.000Z",
    "static_fire_date_unix": 1379548800,
    "timeline": {
      "webcast_liftoff": 55,
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
      "maxq": 78,
      "meco": 163,
      "stage_sep": 170,
      "second_stage_ignition": 177,
      "fairing_deploy": 217,
      "seco-1": 534,
      "payload_deploy": 855
    }
  },
  {
    "flight_number": 12,
    "mission_name": "SES-8",
    "mission_id": [
      "6C42550"
    ],
    "launch_year": "2013",
    "launch_date_unix": 1386110460,
    "launch_date_utc": "2013-12-03T22:41:00.000Z",
    "launch_date_local": "2013-12-03T18:41:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "v1.1",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1004",
            "flight": 1,
            "block": 1,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "SES-8",
            "norad_id": [
              39460
            ],
            "reused": false,
            "customers": [
              "SES"
            ],
            "nationality": "Luxembourg",
            "manufacturer": "Orbital ATK",
            "payload_type": "Satellite",
            "payload_mass_kg": 3170,
            "payload_mass_lbs": 6990,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": 95,
              "semi_major_axis_km": 42165.791,
              "eccentricity": 0.0001132,
              "periapsis_km": 35782.883,
              "apoapsis_km": 35792.43,
              "inclination_deg": 0.0225,
              "period_min": 1436.151,
              "lifespan_years": 15,
              "epoch": "2019-02-04T08:43:05.000Z",
              "mean_motion": 1.00268004,
              "raan": 271.2787,
              "arg_of_pericenter": 90.1543,
              "mean_anomaly": 358.5673
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
    "ships": [],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/b5/1d/46Eo0yuu_o.png",
      "mission_patch_small": "https://images2.imgbox.com/42/b0/vP0sk3d5_o.png",
      "reddit_campaign": null,
      "reddit_launch": "http://www.reddit.com/r/spacex/comments/1ryy1n",
      "reddit_recovery": null,
      "reddit_media": null,
      "presskit": "http://www.spacex.com/sites/spacex/files/spacex_ses-8launch_presskit.pdf",
      "article_link": "https://www.nasaspaceflight.com/2013/12/spacex-falcon-9-v1-1-milestone-ses-8-launch/",
      "wikipedia": "https://en.wikipedia.org/wiki/SES-8",
      "video_link": "https://www.youtube.com/watch?v=aAj5xapImEs",
      "youtube_id": "aAj5xapImEs",
      "flickr_images": []
    },
    "details": "First GTO launch for Falcon 9",
    "upcoming": false,
    "static_fire_date_utc": "2013-11-22T06:26:00.000Z",
    "static_fire_date_unix": 1385101560,
    "timeline": {
      "webcast_liftoff": 953,
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
      "maxq": 60,
      "meco": 180,
      "stage_sep": 180,
      "second_stage_ignition": 1620,
      "fairing_deploy": 240,
      "seco-1": 480,
      "second_stage_restart": 1620,
      "seco-2": 1680,
      "payload_deploy": 1980
    }
  },
  {
    "flight_number": 13,
    "mission_name": "Thaicom 6",
    "mission_id": [
      "9D1B7E0"
    ],
    "launch_year": "2014",
    "launch_date_unix": 1389031560,
    "launch_date_utc": "2014-01-06T18:06:00.000Z",
    "launch_date_local": "2014-01-06T14:06:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "v1.1",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1005",
            "flight": 1,
            "block": 1,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "Thaicom 6",
            "norad_id": [
              39500
            ],
            "reused": false,
            "customers": [
              "Thaicom"
            ],
            "nationality": "Thailand",
            "manufacturer": "Orbital ATK",
            "payload_type": "Satellite",
            "payload_mass_kg": 3325,
            "payload_mass_lbs": 7330,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": 78.5,
              "semi_major_axis_km": 42164.301,
              "eccentricity": 0.0000216,
              "periapsis_km": 35785.255,
              "apoapsis_km": 35787.076,
              "inclination_deg": 0.0448,
              "period_min": 1436.074,
              "lifespan_years": 15,
              "epoch": "2019-02-05T12:29:10.000Z",
              "mean_motion": 1.00273322,
              "raan": 130.4799,
              "arg_of_pericenter": 261.6744,
              "mean_anomaly": 8.9755
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
    "ships": [],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/37/c4/jRAk115c_o.png",
      "mission_patch_small": "https://images2.imgbox.com/d8/6d/fnqIBEJh_o.png",
      "reddit_campaign": null,
      "reddit_launch": "http://www.reddit.com/r/spacex/comments/1ujoc0",
      "reddit_recovery": null,
      "reddit_media": null,
      "presskit": "http://www.spacex.com/sites/spacex/files/spacex_thaicom6_presskit.pdf",
      "article_link": "http://spacenews.com/38959spacex-delivers-thaicom-6-satellite-to-orbit/",
      "wikipedia": "https://en.wikipedia.org/wiki/Thaicom_6",
      "video_link": "https://www.youtube.com/watch?v=AnSNRzMEmCU",
      "youtube_id": "AnSNRzMEmCU",
      "flickr_images": [
        "https://farm9.staticflickr.com/8617/16789019815_f99a165dc5_o.jpg",
        "https://farm8.staticflickr.com/7619/16763151866_35a0a4d8e1_o.jpg",
        "https://farm9.staticflickr.com/8569/16169086873_4d8829832e_o.png"
      ]
    },
    "details": "Second GTO launch for Falcon 9. The USAF evaluated launch data from this flight as part of a separate certification program for SpaceX to qualify to fly U.S. military payloads and found that the Thaicom 6 launch had \"unacceptable fuel reserves at engine cutoff of the stage 2 second burnoff\"",
    "upcoming": false,
    "static_fire_date_utc": "2013-12-28T00:00:00.000Z",
    "static_fire_date_unix": 1388188800,
    "timeline": {
      "webcast_liftoff": 2367,
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
      "maxq": 60,
      "meco": 180,
      "stage_sep": 180,
      "second_stage_ignition": 1620,
      "fairing_deploy": 1860,
      "seco-1": 480,
      "second_stage_restart": 1620,
      "seco-2": 1680,
      "payload_deploy": 1860
    }
  },
  {
    "flight_number": 14,
    "mission_name": "CRS-3",
    "mission_id": [
      "EE86F74"
    ],
    "launch_year": "2014",
    "launch_date_unix": 1397849100,
    "launch_date_utc": "2014-04-18T19:25:00.000Z",
    "launch_date_local": "2014-04-18T15:25:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "v1.1",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1006",
            "flight": 1,
            "block": 1,
            "gridfins": false,
            "legs": true,
            "reused": false,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "Ocean",
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "CRS-3",
            "norad_id": [
              39680
            ],
            "cap_serial": "C105",
            "reused": false,
            "customers": [
              "NASA (CRS)"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Dragon 1.1",
            "payload_mass_kg": 2296,
            "payload_mass_lbs": 5062,
            "orbit": "ISS",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 6700.881,
              "eccentricity": 0.0013819,
              "periapsis_km": 313.486,
              "apoapsis_km": 332.006,
              "inclination_deg": 51.6429,
              "period_min": 90.982,
              "lifespan_years": null,
              "epoch": "2014-04-18T19:40:03.000Z",
              "mean_motion": 15.82724147,
              "raan": 34.0918,
              "arg_of_pericenter": 268.425,
              "mean_anomaly": 162.2575
            },
            "mass_returned_kg": 1600,
            "mass_returned_lbs": 3500,
            "flight_time_sec": 2592000,
            "cargo_manifest": "https://en.wikipedia.org/wiki/SpaceX_CRS-3#Primary_payload_and_downmass"
          }
        ]
      },
      "fairings": null
    },
    "ships": [
      "AMERICANISLANDER"
    ],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/ff/81/EOWojaSj_o.png",
      "mission_patch_small": "https://images2.imgbox.com/a0/cb/s1h2RuR0_o.png",
      "reddit_campaign": null,
      "reddit_launch": "http://www.reddit.com/r/spacex/comments/22zo8c",
      "reddit_recovery": null,
      "reddit_media": null,
      "presskit": "http://www.spacex.com/sites/spacex/files/spacexcrs-3_presskit_042014.pdf",
      "article_link": "https://newatlas.com/crs-3-launch-spacex/31671/",
      "wikipedia": "https://en.wikipedia.org/wiki/SpaceX_CRS-3",
      "video_link": "https://www.youtube.com/watch?v=Od-lON4bTyQ",
      "youtube_id": "Od-lON4bTyQ",
      "flickr_images": [
        "https://farm8.staticflickr.com/7615/16670240949_8d43db0e36_o.jpg",
        "https://farm9.staticflickr.com/8597/16856369125_e97cd30ef7_o.jpg",
        "https://farm8.staticflickr.com/7586/16166732954_9338dc859c_o.jpg",
        "https://farm8.staticflickr.com/7603/16855223522_462da54e84_o.jpg",
        "https://farm8.staticflickr.com/7618/16234010894_e1210ec300_o.jpg",
        "https://farm8.staticflickr.com/7617/16855338881_69542a2fa9_o.jpg"
      ]
    },
    "details": "Following second-stage separation, SpaceX conducted a second controlled-descent test of the discarded booster vehicle and achieved the first successful controlled ocean touchdown of a liquid-rocket-engine orbital booster. Following touchdown the first stage tipped over as expected and was destroyed. This was the first Falcon 9 booster to fly with extensible landing legs and the first Dragon mission with the Falcon 9 v1.1 launch vehicle.",
    "upcoming": false,
    "static_fire_date_utc": "2014-03-08T00:00:00.000Z",
    "static_fire_date_unix": 1394236800,
    "timeline": {
      "webcast_liftoff": 2400,
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
      "maxq": 60,
      "meco": 180,
      "stage_sep": 180,
      "second_stage_ignition": 180,
      "seco-1": 540,
      "dragon_separation": 600,
      "dragon_solar_deploy": 720,
      "dragon_bay_door_deploy": 8400
    }
  },
  {
    "flight_number": 15,
    "mission_name": "OG-2 Mission 1",
    "mission_id": [
      "CE91D46"
    ],
    "launch_year": "2014",
    "launch_date_unix": 1405350900,
    "launch_date_utc": "2014-07-14T15:15:00.000Z",
    "launch_date_local": "2014-07-14T11:15:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "v1.1",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1007",
            "flight": 1,
            "block": 1,
            "gridfins": false,
            "legs": true,
            "reused": false,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "Ocean",
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "Orbcomm-OG2-M1",
            "norad_id": [
              38847
            ],
            "reused": false,
            "customers": [
              "Orbcomm"
            ],
            "nationality": "United States",
            "manufacturer": "Boeing",
            "payload_type": "Satellite",
            "payload_mass_kg": 1316,
            "payload_mass_lbs": 2901,
            "orbit": "LEO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 6641.01,
              "eccentricity": 0.0090712,
              "periapsis_km": 202.633,
              "apoapsis_km": 323.117,
              "inclination_deg": 51.6528,
              "period_min": 89.765,
              "lifespan_years": 5,
              "epoch": "2012-10-08T03:42:59.000Z",
              "mean_motion": 16.04175555,
              "raan": 280.7278,
              "arg_of_pericenter": 54.0639,
              "mean_anomaly": 355.0595
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
    "ships": [],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/4d/ed/CHXoRaSP_o.png",
      "mission_patch_small": "https://images2.imgbox.com/a7/b4/bcMrHMey_o.png",
      "reddit_campaign": null,
      "reddit_launch": "http://www.reddit.com/r/spacex/comments/2aany2",
      "reddit_recovery": null,
      "reddit_media": null,
      "presskit": "http://www.spacex.com/sites/spacex/files/spacex_orbcomm_presskit_final.pdf",
      "article_link": "https://www.orbcomm.com/en/networks/satellite/orbcomm-og2",
      "wikipedia": "https://en.wikipedia.org/wiki/Falcon_9_flight_10",
      "video_link": "https://www.youtube.com/watch?v=lbHnSu-DLR4",
      "youtube_id": "lbHnSu-DLR4",
      "flickr_images": [
        "https://farm8.staticflickr.com/7585/16602893909_1181317089_o.jpg",
        "https://farm9.staticflickr.com/8747/16581738577_83e0690136_o.png",
        "https://farm8.staticflickr.com/7285/16581736047_6fd536ab11_o.jpg",
        "https://farm8.staticflickr.com/7597/16789021675_35f0148f78_o.jpg",
        "https://farm8.staticflickr.com/7631/16236321533_829ae07b42_o.jpg",
        "https://farm9.staticflickr.com/8726/16830422056_26c2265bbc_o.jpg",
        "https://farm9.staticflickr.com/8591/16670149079_33d6cc3631_o.jpg"
      ]
    },
    "details": "Total payload mass was 1,316 kg (2,901 lb) : 6 satellites weighing 172 kg each, plus two 142-kg mass simulators. This was the second Falcon 9 booster equipped with landing legs. Following second-stage separation, SpaceX conducted a controlled-descent test of the first stage, which successfully decelerated from hypersonic velocity in the upper atmosphere, made reentry and landing burns, deployed its legs and touched down on the ocean surface. As with the previous mission, the first stage then tipped over as expected and was not recovered.",
    "upcoming": false,
    "static_fire_date_utc": "2015-12-19T04:57:00.000Z",
    "static_fire_date_unix": 1450501020,
    "timeline": {
      "webcast_liftoff": 920,
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
      "meco": 180,
      "stage_sep": 180,
      "second_stage_ignition": 180,
      "fairing_deploy": 180,
      "seco-1": 360,
      "payload_deploy": 900
    }
  },
  {
    "flight_number": 16,
    "mission_name": "AsiaSat 8",
    "mission_id": [
      "593B499"
    ],
    "launch_year": "2014",
    "launch_date_unix": 1407225600,
    "launch_date_utc": "2014-08-05T08:00:00.000Z",
    "launch_date_local": "2014-08-05T04:00:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "v1.1",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1008",
            "flight": 1,
            "block": 1,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "AsiaSat 8",
            "norad_id": [
              40107
            ],
            "reused": false,
            "customers": [
              "AsiaSat"
            ],
            "nationality": "Hong Kong",
            "manufacturer": "SSL",
            "payload_type": "Satellite",
            "payload_mass_kg": 4535,
            "payload_mass_lbs": 9998,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": 105.5,
              "semi_major_axis_km": 42165.361,
              "eccentricity": 0.0001669,
              "periapsis_km": 35780.189,
              "apoapsis_km": 35794.264,
              "inclination_deg": 0.0093,
              "period_min": 1436.129,
              "lifespan_years": 15,
              "epoch": "2019-02-04T15:17:27.000Z",
              "mean_motion": 1.00269538,
              "raan": 79.3598,
              "arg_of_pericenter": 227.2731,
              "mean_anomaly": 53.3518
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
    "ships": [],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/5a/ab/8IzvDOzc_o.png",
      "mission_patch_small": "https://images2.imgbox.com/bf/12/oSP2EwNz_o.png",
      "reddit_campaign": null,
      "reddit_launch": "http://www.reddit.com/r/spacex/comments/2fenrv",
      "reddit_recovery": null,
      "reddit_media": null,
      "presskit": "https://spaceflightnow.com/falcon9/011/presskit.pdf",
      "article_link": "http://spacenews.com/41497spacex-launches-first-of-two-satellites-for-asiasat/",
      "wikipedia": "https://en.wikipedia.org/wiki/AsiaSat_8",
      "video_link": "https://www.youtube.com/watch?v=essrkMGlw5s",
      "youtube_id": "essrkMGlw5s",
      "flickr_images": [
        "https://farm9.staticflickr.com/8638/16855192031_962f7b1113_o.jpg",
        "https://farm8.staticflickr.com/7603/16648925347_769a6009c7_o.jpg",
        "https://farm9.staticflickr.com/8687/16789027675_cde1bd098a_o.jpg",
        "https://farm8.staticflickr.com/7629/16668638138_7acf13cfb5_o.jpg",
        "https://farm8.staticflickr.com/7281/16668845950_7680146525_o.jpg",
        "https://farm8.staticflickr.com/7626/16233865484_10d9925b5d_o.jpg"
      ]
    },
    "details": null,
    "upcoming": false,
    "static_fire_date_utc": "2014-07-31T23:35:15.000Z",
    "static_fire_date_unix": 1406849715,
    "timeline": {
      "webcast_liftoff": 6,
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
      "meco": 180,
      "stage_sep": 180,
      "second_stage_ignition": 1560,
      "fairing_deploy": 180,
      "seco-1": 540,
      "second_stage_restart": 1560,
      "seco-2": 1620,
      "payload_deploy": 1920
    }
  },
  {
    "flight_number": 17,
    "mission_name": "AsiaSat 6",
    "mission_id": [
      "593B499"
    ],
    "launch_year": "2014",
    "launch_date_unix": 1410066000,
    "launch_date_utc": "2014-09-07T05:00:00.000Z",
    "launch_date_local": "2014-09-07T01:00:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 7200,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "v1.1",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1011",
            "flight": 1,
            "block": 1,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "AsiaSat 6",
            "norad_id": [
              40141
            ],
            "reused": false,
            "customers": [
              "AsiaSat"
            ],
            "nationality": "Hong Kong",
            "manufacturer": "SSL",
            "payload_type": "Satellite",
            "payload_mass_kg": 4428,
            "payload_mass_lbs": 9762,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": 120,
              "semi_major_axis_km": 42165.433,
              "eccentricity": 0.0000527,
              "periapsis_km": 35785.075,
              "apoapsis_km": 35789.52,
              "inclination_deg": 0.0368,
              "period_min": 1436.132,
              "lifespan_years": 15,
              "epoch": "2019-02-01T17:22:10.000Z",
              "mean_motion": 1.00269284,
              "raan": 254.8616,
              "arg_of_pericenter": 109.4456,
              "mean_anomaly": 147.7224
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
    "ships": [],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/57/6a/upI6gwfq_o.png",
      "mission_patch_small": "https://images2.imgbox.com/6f/c0/D3Owbmpo_o.png",
      "reddit_campaign": null,
      "reddit_launch": "http://www.reddit.com/r/spacex/comments/2fenrv",
      "reddit_recovery": null,
      "reddit_media": null,
      "presskit": "https://www.spaceflightnow.com/falcon9/012/presskit.pdf",
      "article_link": "https://www.space.com/27052-spacex-launches-asiasat6-satellite.html",
      "wikipedia": "https://en.wikipedia.org/wiki/AsiaSat_6",
      "video_link": "https://www.youtube.com/watch?v=39ninsyTRk8",
      "youtube_id": "39ninsyTRk8",
      "flickr_images": [
        "https://farm8.staticflickr.com/7604/16169087563_0e3559ab5b_o.jpg",
        "https://farm9.staticflickr.com/8742/16233828644_96738200b2_o.jpg",
        "https://farm8.staticflickr.com/7645/16601443698_e70315d1ed_o.jpg",
        "https://farm9.staticflickr.com/8730/16830335046_5f017c17be_o.jpg",
        "https://farm9.staticflickr.com/8637/16855040322_57671ab8eb_o.jpg"
      ]
    },
    "details": null,
    "upcoming": false,
    "static_fire_date_utc": "2014-08-22T23:51:18.000Z",
    "static_fire_date_unix": 1408751478,
    "timeline": {
      "webcast_liftoff": 1071,
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
      "meco": 180,
      "stage_sep": 180,
      "second_stage_ignition": 1560,
      "fairing_deploy": 180,
      "seco-1": 540,
      "second_stage_restart": 1560,
      "seco-2": 1620,
      "payload_deploy": 1920
    }
  },
  {
    "flight_number": 18,
    "mission_name": "CRS-4",
    "mission_id": [
      "EE86F74"
    ],
    "launch_year": "2014",
    "launch_date_unix": 1411278720,
    "launch_date_utc": "2014-09-21T05:52:00.000Z",
    "launch_date_local": "2014-09-21T01:52:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "v1.1",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1010",
            "flight": 1,
            "block": 1,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": false,
            "landing_intent": true,
            "landing_type": "Ocean",
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "CRS-4",
            "norad_id": [
              40210
            ],
            "cap_serial": "C106",
            "reused": true,
            "customers": [
              "NASA (CRS)"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Dragon 1.1",
            "payload_mass_kg": 2216,
            "payload_mass_lbs": 4885,
            "orbit": "ISS",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 6657.288,
              "eccentricity": 0.0113888,
              "periapsis_km": 203.334,
              "apoapsis_km": 354.971,
              "inclination_deg": 51.6518,
              "period_min": 90.095,
              "lifespan_years": null,
              "epoch": "2014-09-21T05:48:51.000Z",
              "mean_motion": 15.98295763,
              "raan": 344.0345,
              "arg_of_pericenter": 46.2662,
              "mean_anomaly": 314.7708
            },
            "mass_returned_kg": 1486,
            "mass_returned_lbs": 3276,
            "flight_time_sec": 2987160,
            "cargo_manifest": "https://www.nasa.gov/sites/default/files/files/SpaceX_CRS-4_Mission_Overview-1.pdf"
          }
        ]
      },
      "fairings": null
    },
    "ships": [
      "AMERICANISLANDER"
    ],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/0d/e8/tfdeNslS_o.png",
      "mission_patch_small": "https://images2.imgbox.com/b4/28/cQwcs8qz_o.png",
      "reddit_campaign": null,
      "reddit_launch": "http://www.reddit.com/r/spacex/comments/2grxer",
      "reddit_recovery": null,
      "reddit_media": null,
      "presskit": "https://www.nasa.gov/sites/default/files/files/SpaceX_NASA_CRS-4_PressKit.pdf",
      "article_link": "https://www.nasa.gov/press/2014/september/nasa-cargo-launches-to-space-station-aboard-spacex-resupply-mission-0",
      "wikipedia": "https://en.wikipedia.org/wiki/SpaceX_CRS-4",
      "video_link": "https://www.youtube.com/watch?v=7YkCh7uOw1Y",
      "youtube_id": "7YkCh7uOw1Y",
      "flickr_images": [
        "https://farm8.staticflickr.com/7608/16661753958_9f61f777e7_o.jpg",
        "https://farm9.staticflickr.com/8593/16763199166_38ba2cafc8_o.jpg",
        "https://farm9.staticflickr.com/8655/16789074175_ba03989359_o.png",
        "https://farm9.staticflickr.com/8659/16166761954_ebc2a72b2a_o.jpg",
        "https://farm9.staticflickr.com/8620/16642025217_a6852b9499_o.jpg"
      ]
    },
    "details": null,
    "upcoming": false,
    "static_fire_date_utc": "2014-09-17T00:00:00.000Z",
    "static_fire_date_unix": 1410912000,
    "timeline": {
      "webcast_liftoff": 875,
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
      "maxq": 60,
      "meco": 180,
      "stage_sep": 180,
      "second_stage_ignition": 180,
      "seco-1": 540,
      "dragon_separation": 600,
      "dragon_solar_deploy": 720,
      "dragon_bay_door_deploy": 8400
    }
  },
  {
    "flight_number": 19,
    "mission_name": "CRS-5",
    "mission_id": [
      "EE86F74"
    ],
    "launch_year": "2015",
    "launch_date_unix": 1420883220,
    "launch_date_utc": "2015-01-10T09:47:00.000Z",
    "launch_date_local": "2015-01-10T05:47:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "v1.1",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1012",
            "flight": 1,
            "block": 1,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": false,
            "landing_intent": true,
            "landing_type": "ASDS",
            "landing_vehicle": "JRTI-1"
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "CRS-5",
            "norad_id": [
              40370
            ],
            "cap_serial": "C107",
            "reused": false,
            "customers": [
              "NASA (CRS)"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Dragon 1.1",
            "payload_mass_kg": 2395,
            "payload_mass_lbs": 5280,
            "orbit": "ISS",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 6656.902,
              "eccentricity": 0.0109236,
              "periapsis_km": 206.049,
              "apoapsis_km": 351.484,
              "inclination_deg": 51.6369,
              "period_min": 90.088,
              "lifespan_years": null,
              "epoch": "2015-01-10T09:44:04.000Z",
              "mean_motion": 15.98433248,
              "raan": 152.0013,
              "arg_of_pericenter": 46.9449,
              "mean_anomaly": 314.0689
            },
            "mass_returned_kg": 1633,
            "mass_returned_lbs": 3600,
            "flight_time_sec": 2764800,
            "cargo_manifest": "https://www.nasa.gov/sites/default/files/files/SpaceX_CRS-5_factsheet.pdf"
          }
        ]
      },
      "fairings": null
    },
    "ships": [
      "ELSBETH3",
      "GOQUEST",
      "GOSEARCHER",
      "JRTI-1",
      "NRCQUEST"
    ],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/fe/5a/WyQS4MXa_o.png",
      "mission_patch_small": "https://images2.imgbox.com/25/b6/RhNppyL3_o.png",
      "reddit_campaign": null,
      "reddit_launch": "http://www.reddit.com/r/spacex/comments/2rrdha",
      "reddit_recovery": null,
      "reddit_media": null,
      "presskit": "http://www.spacex.com/sites/spacex/files/spacex_nasa_crs-5_presskit.pdf",
      "article_link": "https://spaceflightnow.com/2015/01/10/dragon-successfully-launched-rocket-recovery-demo-crash-lands/",
      "wikipedia": "https://en.wikipedia.org/wiki/SpaceX_CRS-5",
      "video_link": "https://www.youtube.com/watch?v=p7x-SumbynI",
      "youtube_id": "p7x-SumbynI",
      "flickr_images": [
        "https://farm9.staticflickr.com/8666/16511391418_bb5cdbbd71_o.jpg",
        "https://farm9.staticflickr.com/8612/16848173281_035bdc6009_o.jpg",
        "https://farm9.staticflickr.com/8571/16699496805_bf39747618_o.jpg",
        "https://farm9.staticflickr.com/8650/16699496705_187e4e53fd_o.jpg",
        "https://farm9.staticflickr.com/8663/16077174554_370937efbe_o.jpg",
        "https://farm9.staticflickr.com/8638/16512101410_83763eb9ea_o.jpg",
        "https://farm9.staticflickr.com/8653/16077173984_17885d4bea_o.jpg",
        "https://farm8.staticflickr.com/7635/16848159582_40c0f9d25f_o.jpg"
      ]
    },
    "details": "Following second stage separation, SpaceX performed a test flight which attempted to return the first stage of the Falcon 9 through the atmosphere and land it on an approximately 90-by-50-meter (300 ft x 160 ft) floating platform-called the autonomous spaceport drone ship. Many of the test objectives were achieved, including precision control of the rocket's descent to land on the platform at a specific point in the Atlantic ocean, and a large amount of test data was obtained from the first use of grid fin control surfaces used for more precise reentry positioning. The grid fin control system ran out of hydraulic fluid a minute before landing and the landing itself resulted in a crash.",
    "upcoming": false,
    "static_fire_date_utc": "2018-06-23T21:30:00.000Z",
    "static_fire_date_unix": 1529789400,
    "timeline": {
      "webcast_liftoff": 959,
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
      "maxq": 60,
      "meco": 180,
      "stage_sep": 180,
      "second_stage_ignition": 180,
      "seco-1": 540,
      "dragon_separation": 600,
      "dragon_solar_deploy": 720,
      "dragon_bay_door_deploy": 8400
    }
  },
  {
    "flight_number": 20,
    "mission_name": "DSCOVR",
    "mission_id": [],
    "launch_year": "2015",
    "launch_date_unix": 1423695780,
    "launch_date_utc": "2015-02-11T23:03:00.000Z",
    "launch_date_local": "2015-02-11T19:03:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "v1.1",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1013",
            "flight": 1,
            "block": 1,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "Ocean",
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "DSCOVR",
            "norad_id": [
              40390
            ],
            "reused": false,
            "customers": [
              "NASA",
              "NOAA",
              "USAF"
            ],
            "nationality": "United States",
            "manufacturer": "Sierra Nevada",
            "payload_type": "Satellite",
            "payload_mass_kg": 570,
            "payload_mass_lbs": 1260,
            "orbit": "ES-L1",
            "orbit_params": {
              "reference_system": "heliocentric",
              "regime": "L1-point",
              "longitude": null,
              "semi_major_axis_km": null,
              "eccentricity": null,
              "periapsis_km": null,
              "apoapsis_km": null,
              "inclination_deg": null,
              "period_min": null,
              "lifespan_years": 5,
              "epoch": null,
              "mean_motion": null,
              "raan": null,
              "arg_of_pericenter": null,
              "mean_anomaly": null
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
      "ELSBETH3",
      "GOQUEST",
      "GOSEARCHER"
    ],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/ec/a0/kTPQRyzt_o.png",
      "mission_patch_small": "https://images2.imgbox.com/63/c5/0OIpD59z_o.png",
      "reddit_campaign": null,
      "reddit_launch": "http://www.reddit.com/r/spacex/comments/2vjm9e",
      "reddit_recovery": null,
      "reddit_media": null,
      "presskit": "http://www.spacex.com/press/2015/02/11/dscovr-launch-update",
      "article_link": "https://spaceflightnow.com/2015/02/12/space-weather-observatory-blasts-off-after-17-year-wait/",
      "wikipedia": "https://en.wikipedia.org/wiki/Deep_Space_Climate_Observatory",
      "video_link": "https://www.youtube.com/watch?v=OvHJSIKP0Hg",
      "youtube_id": "OvHJSIKP0Hg",
      "flickr_images": [
        "https://farm9.staticflickr.com/8619/16511407538_9a25c5d8c6_o.jpg",
        "https://farm9.staticflickr.com/8665/16697946612_1284e952b0_o.jpg",
        "https://farm9.staticflickr.com/8570/16698990475_16524a93de_o.jpg",
        "https://farm9.staticflickr.com/8681/16512864259_e849e496b1_o.jpg",
        "https://farm9.staticflickr.com/8637/16079045013_1f0fab9b54_o.jpg",
        "https://farm9.staticflickr.com/8601/16512864369_2bb896c344_o.jpg",
        "https://farm9.staticflickr.com/8646/16697693861_a038331e0a_o.jpg",
        "https://farm9.staticflickr.com/8680/16511407248_093635a243_o.jpg",
        "https://farm9.staticflickr.com/8654/16511594820_451f194d53_o.jpg",
        "https://farm9.staticflickr.com/8603/16673054016_472fb42a20_o.jpg"
      ]
    },
    "details": "First launch under USAF's OSP 3 launch contract. First SpaceX launch to put a satellite to an orbit with an orbital altitude many times the distance to the Moon: Sun-Earth libration point L1. The first stage made a test flight descent to an over-ocean landing within 10 m (33 ft) of its intended target.",
    "upcoming": false,
    "static_fire_date_utc": "2015-01-31T00:00:00.000Z",
    "static_fire_date_unix": 1422662400,
    "timeline": {
      "webcast_launch": 960
    }
  },
  {
    "flight_number": 21,
    "mission_name": "ABS-3A / Eutelsat 115W B",
    "mission_id": [
      "2CF444A",
      "F7709F2"
    ],
    "launch_year": "2015",
    "launch_date_unix": 1425268200,
    "launch_date_utc": "2015-03-02T03:50:00.000Z",
    "launch_date_local": "2015-03-02T23:50:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "v1.1",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1014",
            "flight": 1,
            "block": 1,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "ABS-3A",
            "norad_id": [
              40424
            ],
            "reused": false,
            "customers": [
              "ABS"
            ],
            "nationality": "Hong Kong",
            "manufacturer": "Boeing",
            "payload_type": "Satellite",
            "payload_mass_kg": 1954,
            "payload_mass_lbs": 4307,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": -3,
              "semi_major_axis_km": 42165.047,
              "eccentricity": 0.0001431,
              "periapsis_km": 35780.878,
              "apoapsis_km": 35792.946,
              "inclination_deg": 0.0147,
              "period_min": 1436.113,
              "lifespan_years": 15,
              "epoch": "2019-02-04T15:13:54.000Z",
              "mean_motion": 1.0027066,
              "raan": 77.9421,
              "arg_of_pericenter": 159.4962,
              "mean_anomaly": 122.5176
            }
          },
          {
            "payload_id": "Eutelsat 115 West B",
            "norad_id": [
              40425
            ],
            "reused": false,
            "customers": [
              "Eutelsat"
            ],
            "nationality": "France",
            "manufacturer": "Boeing",
            "payload_type": "Satellite",
            "payload_mass_kg": 2205,
            "payload_mass_lbs": 4861,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": -114.9,
              "semi_major_axis_km": 42165.344,
              "eccentricity": 0.0000106,
              "periapsis_km": 35786.762,
              "apoapsis_km": 35787.656,
              "inclination_deg": 0.012,
              "period_min": 1436.128,
              "lifespan_years": 15,
              "epoch": "2019-02-04T22:40:21.000Z",
              "mean_motion": 1.00269601,
              "raan": 224.7223,
              "arg_of_pericenter": 56.2191,
              "mean_anomaly": 79.0275
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
    "ships": [],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/78/82/H9gthFmK_o.png",
      "mission_patch_small": "https://images2.imgbox.com/20/10/sqPgZfej_o.png",
      "reddit_campaign": null,
      "reddit_launch": "http://www.reddit.com/r/spacex/comments/2x81fc",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/2xmumx",
      "presskit": "http://www.spacex.com/sites/spacex/files/abs-eutelsatfactsheet.pdf",
      "article_link": "https://www.space.com/28702-spacex-rocket-launches-satellites-video.html",
      "wikipedia": "https://en.wikipedia.org/wiki/ABS-3A",
      "video_link": "https://www.youtube.com/watch?v=mN7lyaCBzT8",
      "youtube_id": "mN7lyaCBzT8",
      "flickr_images": [
        "https://farm9.staticflickr.com/8749/16788442562_ed460c2d9e_o.jpg",
        "https://farm9.staticflickr.com/8586/16510243060_48d6a9b1f6_o.jpg",
        "https://farm9.staticflickr.com/8641/16490359747_c043b8c61a_o.jpg",
        "https://farm9.staticflickr.com/8636/16510241270_ca83157509_o.jpg",
        "https://farm8.staticflickr.com/7618/16601658850_13b826e705_o.jpg",
        "https://farm9.staticflickr.com/8617/16510041628_883af57512_o.jpg"
      ]
    },
    "details": "The launch was Boeing's first-ever conjoined launch of a lighter-weight dual-commsat stack that was specifically designed to take advantage of the lower-cost SpaceX Falcon 9 launch vehicle. Per satellite, launch costs were less than $30 million. The ABS satellite reached its final destination ahead of schedule and started operations on September 10.",
    "upcoming": false,
    "static_fire_date_utc": "2015-02-25T19:10:00.000Z",
    "static_fire_date_unix": 1424891400,
    "timeline": {
      "webcast_liftoff": 898,
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
      "meco": 180,
      "stage_sep": 180,
      "second_stage_ignition": 1500,
      "fairing_deploy": 1800,
      "seco-1": 540,
      "second_stage_restart": 1500,
      "seco-2": 1560,
      "payload_deploy_1": 1800,
      "payload_deploy_2": 2100
    }
  },
  {
    "flight_number": 22,
    "mission_name": "CRS-6",
    "mission_id": [
      "EE86F74"
    ],
    "launch_year": "2015",
    "launch_date_unix": 1429042200,
    "launch_date_utc": "2015-04-14T20:10:00.000Z",
    "launch_date_local": "2015-04-14T16:10:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "v1.1",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1015",
            "flight": 1,
            "block": 1,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": false,
            "landing_intent": true,
            "landing_type": "ASDS",
            "landing_vehicle": "JRTI-1"
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "CRS-6",
            "norad_id": [
              40588
            ],
            "reused": false,
            "cap_serial": "C108",
            "customers": [
              "NASA (CRS)"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Dragon 1.1",
            "payload_mass_kg": 1898,
            "payload_mass_lbs": 4184,
            "orbit": "ISS",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 6661.265,
              "eccentricity": 0.0116467,
              "periapsis_km": 205.548,
              "apoapsis_km": 360.711,
              "inclination_deg": 51.6488,
              "period_min": 90.176,
              "lifespan_years": null,
              "epoch": "2015-04-14T20:35:14.000Z",
              "mean_motion": 15.96863068,
              "raan": 40.8878,
              "arg_of_pericenter": 48.0984,
              "mean_anomaly": 63.0723
            },
            "mass_returned_kg": 1361,
            "mass_returned_lbs": 3000,
            "flight_time_sec": 3110400,
            "cargo_manifest": "https://blogs.nasa.gov/spacex/wp-content/uploads/sites/227/2015/04/SpaceX_CRS-6_Mission_Overview.pdf"
          }
        ]
      },
      "fairings": null
    },
    "ships": [
      "ELSBETH3",
      "GOQUEST",
      "GOSEARCHER",
      "JRTI-1",
      "NRCQUEST"
    ],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/e4/9f/GRP89UBo_o.png",
      "mission_patch_small": "https://images2.imgbox.com/3d/55/kbVulokl_o.png",
      "reddit_campaign": null,
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/32jnyd",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/32lw5y",
      "presskit": "https://www.nasa.gov/sites/default/files/files/SpaceX_NASA_CRS-6_PressKit.pdf",
      "article_link": "https://spaceflightnow.com/2015/04/14/falcon-9-successfully-launches-descends-to-off-balance-landing/",
      "wikipedia": "https://en.wikipedia.org/wiki/SpaceX_CRS-6",
      "video_link": "https://www.youtube.com/watch?v=csVpa25iqH0",
      "youtube_id": "csVpa25iqH0",
      "flickr_images": [
        "https://farm8.staticflickr.com/7624/17170624642_e5949d160e_o.jpg",
        "https://farm8.staticflickr.com/7708/17170624402_f6de506461_o.jpg",
        "https://farm8.staticflickr.com/7658/17170624462_2efc977fee_o.jpg",
        "https://farm8.staticflickr.com/7611/17171659711_42597fefed_o.jpg",
        "https://farm9.staticflickr.com/8774/17170624412_7091dbd04a_o.jpg"
      ]
    },
    "details": "Following the first-stage boost, SpaceX attempted a controlled-descent test of the first stage. The first stage contacted the ship, but soon tipped over due to excess lateral velocity caused by a stuck throttle valve resulting in a later-than-intended downthrottle.",
    "upcoming": false,
    "static_fire_date_utc": "2015-04-11T00:00:00.000Z",
    "static_fire_date_unix": 1428710400,
    "timeline": {
      "webcast_liftoff": 960,
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
      "maxq": 60,
      "meco": 180,
      "stage_sep": 180,
      "second_stage_ignition": 180,
      "seco-1": 540,
      "dragon_separation": 600,
      "dragon_solar_deploy": 720,
      "dragon_bay_door_deploy": 8400
    }
  },
  {
    "flight_number": 23,
    "mission_name": "TürkmenÄlem 52°E / MonacoSAT",
    "mission_id": [],
    "launch_year": "2015",
    "launch_date_unix": 1430175780,
    "launch_date_utc": "2015-04-27T23:03:00.000Z",
    "launch_date_local": "2015-04-27T19:03:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "v1.1",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1016",
            "flight": 1,
            "block": 1,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "TürkmenÄlem 52°E / MonacoSAT",
            "norad_id": [
              40617
            ],
            "reused": false,
            "customers": [
              "Turkmenistan National Space Agency"
            ],
            "nationality": "Turkmenistan",
            "manufacturer": "Thales Alenia Space",
            "payload_type": "Satellite",
            "payload_mass_kg": 4707,
            "payload_mass_lbs": 10377,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": 52,
              "semi_major_axis_km": 42164.956,
              "eccentricity": 0.0001456,
              "periapsis_km": 35780.682,
              "apoapsis_km": 35792.96,
              "inclination_deg": 0.0126,
              "period_min": 1436.108,
              "lifespan_years": 15,
              "epoch": "2019-02-05T09:36:42.000Z",
              "mean_motion": 1.00270984,
              "raan": 73.8891,
              "arg_of_pericenter": 264.8493,
              "mean_anomaly": 352.6731
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
    "ships": [],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/7a/99/RLkM4sNw_o.png",
      "mission_patch_small": "https://images2.imgbox.com/c9/35/VNpbqUPb_o.png",
      "reddit_campaign": null,
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/33xqcj",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/3439s3",
      "presskit": "http://www.spacex.com/sites/spacex/files/spacexthalesfactsheet_final.pdf",
      "article_link": "https://spaceflightnow.com/2015/04/28/falcon-9-rocket-powers-into-space-with-satellite-for-turkmenistan/",
      "wikipedia": "https://en.wikipedia.org/wiki/T%C3%BCrkmen%C3%84lem_52%C2%B0E_/_MonacoSAT",
      "video_link": "https://www.youtube.com/watch?v=nBwAYT_ogj4",
      "youtube_id": "nBwAYT_ogj4",
      "flickr_images": [
        "https://farm8.staticflickr.com/7695/17138865668_18dcce7072_o.jpg",
        "https://farm8.staticflickr.com/7677/16706406093_61a8f9c2f8_o.jpg",
        "https://farm8.staticflickr.com/7691/17324793792_2dd13ea3f3_o.jpg",
        "https://farm8.staticflickr.com/7691/17139094400_b94ce1ff56_o.jpg",
        "https://farm9.staticflickr.com/8739/17140415959_38b5ee8bc6_o.jpg",
        "https://farm8.staticflickr.com/7735/16704192574_e3a0a6fac2_o.jpg"
      ]
    },
    "details": null,
    "upcoming": false,
    "static_fire_date_utc": "2015-04-22T11:11:00.000Z",
    "static_fire_date_unix": 1429701060,
    "timeline": {
      "webcast_liftoff": 4138,
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
      "meco": 180,
      "stage_sep": 180,
      "second_stage_ignition": 1560,
      "fairing_deploy": 240,
      "seco-1": 540,
      "second_stage_restart": 1560,
      "seco-2": 1620,
      "payload_deploy": 1920
    }
  },
  {
    "flight_number": 24,
    "mission_name": "CRS-7",
    "mission_id": [
      "EE86F74"
    ],
    "launch_year": "2015",
    "launch_date_unix": 1435501260,
    "launch_date_utc": "2015-06-28T14:21:00.000Z",
    "launch_date_local": "2015-06-28T10:21:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "v1.1",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1018",
            "flight": 1,
            "block": 1,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": null,
            "landing_intent": true,
            "landing_type": "ASDS",
            "landing_vehicle": "OCISLY"
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "CRS-7",
            "norad_id": [],
            "reused": false,
            "cap_serial": "C109",
            "customers": [
              "NASA (CRS)"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Dragon 1.1",
            "payload_mass_kg": 2477,
            "payload_mass_lbs": 5460.9,
            "orbit": "ISS",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": null,
              "eccentricity": null,
              "periapsis_km": null,
              "apoapsis_km": null,
              "inclination_deg": 51.6,
              "period_min": null,
              "lifespan_years": null,
              "epoch": null,
              "mean_motion": null,
              "raan": null,
              "arg_of_pericenter": null,
              "mean_anomaly": null
            },
            "mass_returned_kg": null,
            "mass_returned_lbs": null,
            "flight_time_sec": 139,
            "cargo_manifest": "https://www.nasa.gov/sites/default/files/atoms/files/spacex_crs-7_mission_overview.pdf"
          }
        ]
      },
      "fairings": null
    },
    "ships": [
      "ELSBETH3",
      "GOQUEST",
      "GOSEARCHER"
    ],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": false,
    "launch_failure_details": {
      "time": 139,
      "altitude": 40,
      "reason": "helium tank overpressure lead to the second stage LOX tank explosion"
    },
    "links": {
      "mission_patch": "https://images2.imgbox.com/47/39/stH98Qy1_o.png",
      "mission_patch_small": "https://images2.imgbox.com/d0/22/gyTVYo21_o.png",
      "reddit_campaign": null,
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/3b27hk",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/3berj3",
      "presskit": "https://www.nasa.gov/sites/default/files/atoms/files/spacex_nasa_crs-7_presskit.pdf",
      "article_link": "https://spaceflightnow.com/2015/06/28/falcon-9-rocket-destroyed-in-launch-mishap/",
      "wikipedia": "https://en.wikipedia.org/wiki/SpaceX_CRS-7",
      "video_link": "https://www.youtube.com/watch?v=PuNymhcTtSQ",
      "youtube_id": "PuNymhcTtSQ",
      "flickr_images": [
        "https://farm1.staticflickr.com/344/19045370790_f20f29cd8d_o.jpg",
        "https://farm1.staticflickr.com/287/18999110808_6e153fed64_o.jpg"
      ]
    },
    "details": "Launch performance was nominal until an overpressure incident in the second-stage LOX tank, leading to vehicle breakup at T+150 seconds. The Dragon capsule survived the explosion but was lost upon splashdown because its software did not contain provisions for parachute deployment on launch vehicle failure.",
    "upcoming": false,
    "static_fire_date_utc": "2015-06-26T05:00:00.000Z",
    "static_fire_date_unix": 1435294800,
    "timeline": {
      "webcast_liftoff": 61,
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
      "maxq": 60,
      "meco": 180,
      "stage_sep": 180,
      "second_stage_ignition": 180,
      "seco-1": 540,
      "dragon_separation": 600,
      "dragon_solar_deploy": 720,
      "dragon_bay_door_deploy": 8400
    }
  },
  {
    "flight_number": 25,
    "mission_name": "OG-2 Mission 2",
    "mission_id": [
      "CE91D46"
    ],
    "launch_year": "2015",
    "launch_date_unix": 1450747740,
    "launch_date_utc": "2015-12-22T01:29:00.000Z",
    "launch_date_local": "2015-12-22T21:29:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1019",
            "flight": 1,
            "block": 1,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "RTLS",
            "landing_vehicle": "LZ-1"
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "Orbcomm-OG2-M2",
            "norad_id": [
              41187
            ],
            "reused": true,
            "customers": [
              "Orbcomm"
            ],
            "nationality": "United States",
            "manufacturer": "Boeing",
            "payload_type": "Satellite",
            "payload_mass_kg": 2034,
            "payload_mass_lbs": 4484,
            "orbit": "LEO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 7088.246,
              "eccentricity": 0.000179,
              "periapsis_km": 708.842,
              "apoapsis_km": 711.379,
              "inclination_deg": 47.0037,
              "period_min": 98.984,
              "lifespan_years": 5,
              "epoch": "2019-02-04T20:26:33.000Z",
              "mean_motion": 14.5477083,
              "raan": 238.0232,
              "arg_of_pericenter": 126.4348,
              "mean_anomaly": 233.6701
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
    "ships": [],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=OG22"
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/65/a5/8iNE9T6Y_o.png",
      "mission_patch_small": "https://images2.imgbox.com/89/e8/5eeThzqZ_o.png",
      "reddit_campaign": null,
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/3xgxh5",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/3xm83h/",
      "presskit": "http://www.spacex.com/sites/spacex/files/spacex_orbcomm_press_kit_final2.pdf",
      "article_link": "https://spaceflightnow.com/2015/12/22/round-trip-rocket-flight-gives-spacex-a-trifecta-of-successes/",
      "wikipedia": "https://en.wikipedia.org/wiki/Falcon_9_flight_20",
      "video_link": "https://www.youtube.com/watch?v=O5bTbVbe4e4",
      "youtube_id": "O5bTbVbe4e4",
      "flickr_images": [
        "https://farm2.staticflickr.com/1648/23827554109_837b21739e_o.jpg",
        "https://farm1.staticflickr.com/597/23802553412_d41e4dcc64_o.jpg",
        "https://farm6.staticflickr.com/5806/23802550622_9ff8c90098_o.jpg",
        "https://farm1.staticflickr.com/571/23604164970_2a1a2366e4_o.jpg",
        "https://farm6.staticflickr.com/5773/23271687254_5e64d726ba_o.jpg",
        "https://farm6.staticflickr.com/5766/23526044959_5bfe74bc88_o.jpg",
        "https://farm6.staticflickr.com/5723/23785609832_83038751d1_o.jpg",
        "https://farm1.staticflickr.com/715/23833499336_d3fde6a25a_o.jpg"
      ]
    },
    "details": "Total payload mass was 2,034 kg (4,484 lb) : 11 satellites weighing 172 kg each, plus a 142-kg mass simulator. This was the first launch of the upgraded v1.1 variant (later called Falcon 9 Full Thrust), with a 30 percent power increase. Orbcomm had originally agreed to be the third flight of the enhanced-thrust rocket, but the change to the maiden flight position was announced in October 2015. SpaceX received a permit from the FAA to land the booster on solid ground at Cape Canaveral, and succeeded.",
    "upcoming": false,
    "static_fire_date_utc": "2015-12-19T00:09:00.000Z",
    "static_fire_date_unix": 1450483740,
    "timeline": {
      "webcast_liftoff": 1382,
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
      "maxq": 60,
      "meco": 140,
      "stage_sep": 144,
      "second_stage_ignition": 155,
      "fairing_deploy": 180,
      "first_stage_boostback_burn": 240,
      "first_stage_entry_burn": 480,
      "seco-1": 600,
      "first_stage_landing": 600,
      "payload_deploy": 900
    }
  },
  {
    "flight_number": 26,
    "mission_name": "Jason 3",
    "mission_id": [],
    "launch_year": "2016",
    "launch_date_unix": 1453045320,
    "launch_date_utc": "2016-01-17T15:42:00.000Z",
    "launch_date_local": "2016-01-17T08:42:00-07:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "v1.1",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1017",
            "flight": 1,
            "block": 1,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": false,
            "landing_intent": true,
            "landing_type": "ASDS",
            "landing_vehicle": "JRTI"
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "Jason-3",
            "norad_id": [
              41240
            ],
            "reused": false,
            "customers": [
              "NASA",
              "NOAA"
            ],
            "nationality": "United States",
            "manufacturer": "Thales Alenia Space",
            "payload_type": "Satellite",
            "payload_mass_kg": 553,
            "payload_mass_lbs": 1219,
            "orbit": "PO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 7715.872,
              "eccentricity": 0.000756,
              "periapsis_km": 1331.904,
              "apoapsis_km": 1343.57,
              "inclination_deg": 66.043,
              "period_min": 112.418,
              "lifespan_years": 5,
              "epoch": "2019-02-05T12:58:20.000Z",
              "mean_motion": 12.80929446,
              "raan": 319.344,
              "arg_of_pericenter": 274.158,
              "mean_anomaly": 85.8571
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
      "JRTI-2",
      "NRCQUEST",
      "PACIFICFREEDOM"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=JSN3"
    },
    "launch_site": {
      "site_id": "vafb_slc_4e",
      "site_name": "VAFB SLC 4E",
      "site_name_long": "Vandenberg Air Force Base Space Launch Complex 4E"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/71/59/j489OwAI_o.png",
      "mission_patch_small": "https://images2.imgbox.com/72/f2/uK9vYzvk_o.png",
      "reddit_campaign": null,
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/417weg",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/41cvdm",
      "presskit": "http://www.spacex.com/sites/spacex/files/spacex_jason3_press_kit.pdf",
      "article_link": "https://spaceflightnow.com/2016/01/18/satellite-launched-to-measure-motions-of-the-oceans/",
      "wikipedia": "https://en.wikipedia.org/wiki/Jason-3",
      "video_link": "https://www.youtube.com/watch?v=ivdKRJzl6y0",
      "youtube_id": "ivdKRJzl6y0",
      "flickr_images": [
        "https://farm2.staticflickr.com/1460/24382360351_9b1f2fcabc_o.jpg",
        "https://farm2.staticflickr.com/1669/24423604506_27d3c4548b_o.jpg",
        "https://farm2.staticflickr.com/1618/24151425850_1cb6040569_o.jpg",
        "https://farm2.staticflickr.com/1622/24127012370_07edc62046_o.jpg",
        "https://farm2.staticflickr.com/1508/24127011190_92ef932c96_o.jpg",
        "https://farm2.staticflickr.com/1591/23778325594_08231286fc_o.jpg",
        "https://farm2.staticflickr.com/1542/24038722499_34c10216a3_o.jpg"
      ]
    },
    "details": "First launch of NASA and NOAA joint science mission under the NLS II launch contract (not related to NASA CRS or USAF OSP3 contracts). Last launch of the original Falcon 9 v1.1 launch vehicle. The Jason-3 satellite was successfully deployed to target orbit. SpaceX again attempted a recovery of the first stage booster by landing on an autonomous drone ship; this time located in the Pacific Ocean. The first stage did achieve a soft-landing on the ship, but a lockout on one of the landing legs failed to latch, so that the booster fell over and exploded.",
    "upcoming": false,
    "static_fire_date_utc": "2016-01-11T18:42:00.000Z",
    "static_fire_date_unix": 1452537720,
    "timeline": {
      "webcast_liftoff": 1309,
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
      "maxq": 78,
      "meco": 154,
      "stage_sep": 157,
      "second_stage_ignition": 3300,
      "fairing_deploy": 3360,
      "first_stage_boostback_burn": 265,
      "first_stage_entry_burn": 420,
      "seco-1": 540,
      "second_stage_restart": 3300,
      "payload_deploy": 3360
    }
  },
  {
    "flight_number": 27,
    "mission_name": "SES-9",
    "mission_id": [
      "6C42550"
    ],
    "launch_year": "2016",
    "launch_date_unix": 1457134500,
    "launch_date_utc": "2016-03-04T23:35:00.000Z",
    "launch_date_local": "2016-03-04T19:35:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 5400,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1020",
            "flight": 1,
            "block": 1,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": false,
            "landing_intent": true,
            "landing_type": "ASDS",
            "landing_vehicle": "OCISLY"
          }
        ]
      },
      "second_stage": {
        "block": 1,
        "payloads": [
          {
            "payload_id": "SES-9",
            "norad_id": [
              41380
            ],
            "reused": false,
            "customers": [
              "SES"
            ],
            "nationality": "Luxembourg",
            "manufacturer": "Boeing",
            "payload_type": "Satellite",
            "payload_mass_kg": 5271,
            "payload_mass_lbs": 11621,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": 108.2,
              "semi_major_axis_km": 42165.705,
              "eccentricity": 0.000099,
              "periapsis_km": 35783.396,
              "apoapsis_km": 35791.745,
              "inclination_deg": 0.0202,
              "period_min": 1436.146,
              "lifespan_years": 15,
              "epoch": "2019-02-05T07:46:07.000Z",
              "mean_motion": 1.00268311,
              "raan": 274.4111,
              "arg_of_pericenter": 132.5918,
              "mean_anomaly": 313.0054
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
      "ELSBETH3",
      "GOQUEST",
      "GOSEARCHER",
      "OCISLY"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=SES9"
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/f6/aa/xDtGo0WJ_o.png",
      "mission_patch_small": "https://images2.imgbox.com/fa/ef/4FBvVReu_o.png",
      "reddit_campaign": null,
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/48u4yq",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/472k8c",
      "presskit": "http://www.spacex.com/sites/spacex/files/spacex_ses9_press_kit_final.pdf",
      "article_link": "https://spaceflightnow.com/2016/03/05/tv-broadcasting-satellite-finally-launched-on-falcon-9/",
      "wikipedia": "https://en.wikipedia.org/wiki/SES-9",
      "video_link": "https://www.youtube.com/watch?v=muDPSyO7-A0",
      "youtube_id": "muDPSyO7-A0",
      "flickr_images": [
        "https://farm2.staticflickr.com/1623/25395662282_942fd68ba3_o.jpg",
        "https://farm2.staticflickr.com/1458/25395661442_bfd783f18a_o.jpg",
        "https://farm2.staticflickr.com/1641/25421381351_38390bcb8e_o.jpg",
        "https://farm2.staticflickr.com/1616/25514167315_b19b0a4365_o.jpg",
        "https://farm2.staticflickr.com/1482/24883160354_b03cefd416_o.jpg",
        "https://farm2.staticflickr.com/1653/25420915781_8fc648b4a4_o.jpg",
        "https://farm2.staticflickr.com/1610/25486858116_9c06dfea59_o.jpg",
        "https://farm2.staticflickr.com/1617/25168697841_00dfff89bb_o.jpg",
        "https://farm2.staticflickr.com/1533/24631230904_83b1624807_o.jpg",
        "https://farm2.staticflickr.com/1627/25145624551_1b8743116f_o.jpg",
        "https://farm2.staticflickr.com/1622/25120540712_7fc1a5ed72_o.jpg",
        "https://farm2.staticflickr.com/1550/24585667074_aa712b13a8_o.jpg"
      ]
    },
    "details": "Second launch of the enhanced Falcon 9 Full Thrust launch vehicle. Following the launch, SpaceX attempted an experimental landing test to a drone ship, although a successful landing was not expected because launch mass exceeded previously indicated limit for a GTO there was little fuel left. As predicted, booster recovery failed: the spent first stage \"landed hard\", but the controlled-descent, atmospheric re-entry and navigation to the drone ship were successful and returned significant test data on bringing back high-energy Falcon 9s.",
    "upcoming": false,
    "static_fire_date_utc": "2016-10-02T14:11:00.000Z",
    "static_fire_date_unix": 1475417460,
    "timeline": {
      "webcast_liftoff": 600,
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
      "maxq": 60,
      "meco": 156,
      "stage_sep": 160,
      "second_stage_ignition": 1627,
      "fairing_deploy": 222,
      "seco-1": 541,
      "second_stage_restart": 1627,
      "seco-2": 1675,
      "payload_deploy": 1884
    }
  },
  {
    "flight_number": 28,
    "mission_name": "CRS-8",
    "mission_id": [
      "EE86F74"
    ],
    "launch_year": "2016",
    "launch_date_unix": 1460148180,
    "launch_date_utc": "2016-04-08T20:43:00.000Z",
    "launch_date_local": "2016-04-08T16:43:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1021",
            "flight": 1,
            "block": 2,
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
        "block": 2,
        "payloads": [
          {
            "payload_id": "CRS-8",
            "norad_id": [
              41452
            ],
            "cap_serial": "C110",
            "reused": false,
            "customers": [
              "NASA (CRS)"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Dragon 1.1",
            "payload_mass_kg": 3136,
            "payload_mass_lbs": 6914,
            "orbit": "ISS",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 6659.721,
              "eccentricity": 0.0108437,
              "periapsis_km": 209.37,
              "apoapsis_km": 353.802,
              "inclination_deg": 51.6569,
              "period_min": 90.145,
              "lifespan_years": null,
              "epoch": "2016-04-08T21:07:36.000Z",
              "mean_motion": 15.9741849,
              "raan": 43.9641,
              "arg_of_pericenter": 44.2256,
              "mean_anomaly": 64.0651
            },
            "mass_returned_kg": 1678,
            "mass_returned_lbs": 3700,
            "flight_time_sec": 2843280,
            "cargo_manifest": "https://www.nasa.gov/sites/default/files/atoms/files/spacex_crs-8_mission_overview.pdf"
          }
        ]
      },
      "fairings": null
    },
    "ships": [
      "ELSBETH3",
      "GOQUEST",
      "GOSEARCHER",
      "NRCQUEST",
      "OCISLY"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=CRS8"
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/1b/f0/tyNDMK5j_o.png",
      "mission_patch_small": "https://images2.imgbox.com/49/2a/gkSR50yc_o.png",
      "reddit_campaign": null,
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/4dtoly",
      "reddit_recovery": "https://www.reddit.com/r/spacex/comments/4ee2zy",
      "reddit_media": "https://www.reddit.com/r/spacex/comments/4dtpxn/",
      "presskit": "http://www.spacex.com/sites/spacex/files/spacex_crs8_press_kit.pdf",
      "article_link": "https://spaceflightnow.com/2016/04/08/spacex-lands-rocket-on-floating-platform-after-station-resupply-launch/",
      "wikipedia": "https://en.wikipedia.org/wiki/SpaceX_CRS-8",
      "video_link": "https://www.youtube.com/watch?v=7pUAydjne5M",
      "youtube_id": "7pUAydjne5M",
      "flickr_images": [
        "https://farm2.staticflickr.com/1633/25788014884_6a3f9ae183_o.jpg",
        "https://farm2.staticflickr.com/1650/26300505022_8b8b9035e8_o.jpg",
        "https://farm2.staticflickr.com/1486/25787998624_3ca213be1e_o.jpg",
        "https://farm2.staticflickr.com/1450/26326628031_e1b08ec0b3_o.jpg",
        "https://farm2.staticflickr.com/1670/26239020092_05e5e4c538_o.jpg",
        "https://farm2.staticflickr.com/1709/26305479266_76b4d01caf_o.jpg",
        "https://farm2.staticflickr.com/1645/26239017922_28c7ac50e0_o.jpg",
        "https://farm2.staticflickr.com/1559/26288402056_6c5997ce66_o.jpg",
        "https://farm2.staticflickr.com/1449/25709481274_60f8c77358_o.jpg",
        "https://farm2.staticflickr.com/1671/26217360302_b66c3e384e_o.jpg",
        "https://farm2.staticflickr.com/1704/26283822056_838c1103b9_o.jpg",
        "https://farm2.staticflickr.com/1508/26217345472_118767c608_o.jpg",
        "https://farm2.staticflickr.com/1495/25916886442_821a152917_o.jpg"
      ]
    },
    "details": "Dragon carried over 1500 kg of supplies and delivered (stowed in its trunk) the inflatable Bigelow Expandable Activity Module (BEAM) to the ISS for two years of in-orbit tests. The rocket's first stage landed smoothly on SpaceX's autonomous spaceport drone ship 9 minutes after liftoff, making this the first ever successful landing of a rocket booster on a ship at sea as part of an orbital launch. The first stage B1021 was later also the first orbital booster to be used again, when launching SES-10 on March 30, 2017.",
    "upcoming": false,
    "static_fire_date_utc": "2016-04-05T00:00:00.000Z",
    "static_fire_date_unix": 1459814400,
    "timeline": {
      "webcast_liftoff": 1141,
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
      "maxq": 71,
      "stage_sep": 154,
      "second_stage_ignition": 161,
      "first_stage_boostback_burn": 240,
      "first_stage_entry_burn": 420,
      "seco-1": 600,
      "dragon_separation": 630,
      "dragon_solar_deploy": 720,
      "dragon_bay_door_deploy": 8400
    }
  },
  {
    "flight_number": 29,
    "mission_name": "JCSAT-2B",
    "mission_id": [
      "FE3533D"
    ],
    "launch_year": "2016",
    "launch_date_unix": 1462512060,
    "launch_date_utc": "2016-05-06T05:21:00.000Z",
    "launch_date_local": "2016-05-06T01:21:00-04:00",
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
            "core_serial": "B1022",
            "flight": 1,
            "block": 2,
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
        "block": 2,
        "payloads": [
          {
            "payload_id": "JCSAT-2B",
            "norad_id": [
              41471
            ],
            "reused": false,
            "customers": [
              "SKY Perfect JSAT Group"
            ],
            "nationality": "Japan",
            "manufacturer": "SSL",
            "payload_type": "Satellite",
            "payload_mass_kg": 4696,
            "payload_mass_lbs": 10353,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": 154,
              "semi_major_axis_km": 42164.983,
              "eccentricity": 0.0001811,
              "periapsis_km": 35779.212,
              "apoapsis_km": 35794.485,
              "inclination_deg": 0.0152,
              "period_min": 1436.109,
              "lifespan_years": 15,
              "epoch": "2019-02-05T04:43:44.000Z",
              "mean_motion": 1.00270886,
              "raan": 77.0478,
              "arg_of_pericenter": 240.3619,
              "mean_anomaly": 42.5465
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
      "ELSBETH3",
      "GOQUEST",
      "GOSEARCHER"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=JC14"
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/84/40/ddJiuhNV_o.png",
      "mission_patch_small": "https://images2.imgbox.com/87/c9/qViUTdt5_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/4gyh8z",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/4htenu",
      "reddit_recovery": "https://www.reddit.com/r/spacex/comments/4ihp1p",
      "reddit_media": "https://www.reddit.com/r/spacex/comments/4htg2g",
      "presskit": "http://www.spacex.com/sites/spacex/files/spacex_jcsat_press_kit_final.pdf",
      "article_link": "https://spaceflightnow.com/2016/05/06/falcon-9-succeeds-in-middle-of-the-night-launch/",
      "wikipedia": "https://en.wikipedia.org/wiki/JCSAT-2B",
      "video_link": "https://www.youtube.com/watch?v=L0bMeDj76ig",
      "youtube_id": "L0bMeDj76ig",
      "flickr_images": [
        "https://farm8.staticflickr.com/7340/27044931232_7b755276ec_o.jpg",
        "https://farm8.staticflickr.com/7444/27028105566_1d3413daa7_o.jpg",
        "https://farm8.staticflickr.com/7597/26778141961_e3bd237942_o.jpg",
        "https://farm8.staticflickr.com/7079/26778141661_559b48ac80_o.jpg",
        "https://farm8.staticflickr.com/7682/26778141401_c437b04b74_o.jpg",
        "https://farm8.staticflickr.com/7706/26751237322_ceb6d56235_o.jpg",
        "https://farm8.staticflickr.com/7677/26809210466_fc55835f3c_o.jpg",
        "https://farm8.staticflickr.com/7085/26809208046_d77bd31fd0_o.jpg",
        "https://farm8.staticflickr.com/7103/26809207316_cdc7d582e6_o.jpg"
      ]
    },
    "details": "Launched the JCSAT 14 communications satellite for Tokyo-based SKY Perfect JSAT Corp. JCSAT 14 will support data networks, television broadcasters and mobile communications users in Japan, East Asia, Russia, Oceania, Hawaii and other Pacific islands. This was the first time a booster successfully landed after a GTO mission.",
    "upcoming": false,
    "static_fire_date_utc": "2016-05-01T21:32:00.000Z",
    "static_fire_date_unix": 1462138320,
    "timeline": {
      "webcast_liftoff": 1260,
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
      "maxq": 80,
      "meco": 158,
      "stage_sep": 161,
      "second_stage_ignition": 1587,
      "fairing_deploy": 216,
      "seco-1": 533,
      "second_stage_restart": 1587,
      "seco-2": 1646,
      "payload_deploy": 1922
    }
  },
  {
    "flight_number": 30,
    "mission_name": "Thaicom 8",
    "mission_id": [
      "9D1B7E0"
    ],
    "launch_year": "2016",
    "launch_date_unix": 1464385140,
    "launch_date_utc": "2016-05-27T21:39:00.000Z",
    "launch_date_local": "2016-05-27T17:39:00-04:00",
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
            "core_serial": "B1023",
            "flight": 1,
            "block": 2,
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
        "block": 2,
        "payloads": [
          {
            "payload_id": "Thaicom 8",
            "norad_id": [
              41552
            ],
            "reused": false,
            "customers": [
              "Thaicom"
            ],
            "nationality": "Thailand",
            "manufacturer": "Orbital ATK",
            "payload_type": "Satellite",
            "payload_mass_kg": 3100,
            "payload_mass_lbs": 6800,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": 78.5,
              "semi_major_axis_km": 42164.558,
              "eccentricity": 0.0004148,
              "periapsis_km": 35768.933,
              "apoapsis_km": 35803.913,
              "inclination_deg": 0.0539,
              "period_min": 1436.088,
              "lifespan_years": 15,
              "epoch": "2019-02-04T09:48:56.000Z",
              "mean_motion": 1.00272405,
              "raan": 41.2458,
              "arg_of_pericenter": 308.0662,
              "mean_anomaly": 10.6485
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
      "ELSBETH3",
      "GOQUEST",
      "GOSEARCHER",
      "OCISLY"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=THM8"
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/b7/ec/5kukvU10_o.png",
      "mission_patch_small": "https://images2.imgbox.com/d1/de/waYRCanq_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/4hjz4k",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/4l9uou",
      "reddit_recovery": "https://www.reddit.com/r/spacex/comments/4lz2y6",
      "reddit_media": "https://www.reddit.com/r/spacex/comments/4l4af1",
      "presskit": "http://www.spacex.com/sites/spacex/files/spacex_thaicom_8_press_kit.pdf",
      "article_link": "https://spaceflightnow.com/2016/05/27/spacex-logs-successful-late-afternoon-launch-for-thaicom/",
      "wikipedia": "https://en.wikipedia.org/wiki/Thaicom_8",
      "video_link": "https://www.youtube.com/watch?v=zBYC4f79iXc",
      "youtube_id": "zBYC4f79iXc",
      "flickr_images": [
        "https://farm8.staticflickr.com/7420/26814484893_13059e4b39_o.jpg",
        "https://farm8.staticflickr.com/7321/26812794884_bf91665325_o.jpg",
        "https://farm8.staticflickr.com/7337/26812792104_9323121f0b_o.jpg",
        "https://farm8.staticflickr.com/7376/27421461715_5640d2b87a_o.jpg",
        "https://farm8.staticflickr.com/7717/26812758364_74569b4327_o.jpg",
        "https://farm8.staticflickr.com/7742/27294263035_9b43bd141c_o.jpg",
        "https://farm8.staticflickr.com/7252/27294262435_c534cc4351_o.jpg",
        "https://farm8.staticflickr.com/7698/27294261525_82c4b7e604_o.jpg",
        "https://farm8.staticflickr.com/7045/27259828166_9e32061cc9_o.jpg",
        "https://farm8.staticflickr.com/7013/27259827316_c2f7507b3d_o.jpg",
        "https://farm8.staticflickr.com/7211/27182485331_ed2414a947_o.jpg",
        "https://farm8.staticflickr.com/7740/27182481921_0d7a759736_o.jpg",
        "https://farm8.staticflickr.com/7315/26645036414_39736db559_o.jpg"
      ]
    },
    "details": "Manufactured by Orbital ATK, the 3,100-kilogram (6,800 lb) Thaicom 8 communications satellite will serve Thailand, India and Africa from the 78.5° East geostationary location. It is equipped with 24 active Ku-band transponders.",
    "upcoming": false,
    "static_fire_date_utc": "2016-05-25T00:00:00.000Z",
    "static_fire_date_unix": 1464134400,
    "timeline": {
      "webcast_liftoff": 1290,
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
      "maxq": 77,
      "meco": 155,
      "stage_sep": 159,
      "second_stage_ignition": 166,
      "fairing_deploy": 217,
      "seco-1": 536,
      "second_stage_restart": 1627,
      "seco-2": 1700,
      "payload_deploy": 1916
    }
  },
  {
    "flight_number": 31,
    "mission_name": "ABS-2A / Eutelsat 117W B",
    "mission_id": [
      "2CF444A",
      "F7709F2"
    ],
    "launch_year": "2016",
    "launch_date_unix": 1466000940,
    "launch_date_utc": "2016-06-15T14:29:00.000Z",
    "launch_date_local": "2016-06-15T10:29:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 2700,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1024",
            "flight": 1,
            "block": 2,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": false,
            "landing_intent": true,
            "landing_type": "ASDS",
            "landing_vehicle": "OCISLY"
          }
        ]
      },
      "second_stage": {
        "block": 2,
        "payloads": [
          {
            "payload_id": "ABS-2A",
            "norad_id": [
              41588
            ],
            "reused": false,
            "customers": [
              "ABS"
            ],
            "nationality": "Hong Kong",
            "manufacturer": "Boeing",
            "payload_type": "Satellite",
            "payload_mass_kg": 1800,
            "payload_mass_lbs": 3950,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": 75,
              "semi_major_axis_km": 42165.109,
              "eccentricity": 0.0001335,
              "periapsis_km": 35781.345,
              "apoapsis_km": 35792.603,
              "inclination_deg": 0.0113,
              "period_min": 1436.116,
              "lifespan_years": 15,
              "epoch": "2019-02-04T10:03:53.000Z",
              "mean_motion": 1.00270439,
              "raan": 91.5352,
              "arg_of_pericenter": 156.6487,
              "mean_anomaly": 111.7716
            }
          },
          {
            "payload_id": "Eutelsat 117 West B",
            "norad_id": [
              40425
            ],
            "reused": false,
            "customers": [
              "Eutelsat"
            ],
            "nationality": "France",
            "manufacturer": "Boeing",
            "payload_type": "Satellite",
            "payload_mass_kg": 1800,
            "payload_mass_lbs": 3950,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": -116.8,
              "semi_major_axis_km": null,
              "eccentricity": null,
              "periapsis_km": null,
              "apoapsis_km": null,
              "inclination_deg": null,
              "period_min": null,
              "lifespan_years": 15,
              "epoch": null,
              "mean_motion": null,
              "raan": null
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
      "ELSBETH3",
      "GOQUEST",
      "GOSEARCHER",
      "OCISLY"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=EUA2"
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/07/79/4ajR03l9_o.png",
      "mission_patch_small": "https://images2.imgbox.com/ae/e9/VTH2y7S5_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/4ksdy3",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/4o5u6r",
      "reddit_recovery": "https://www.reddit.com/r/spacex/comments/4on75l",
      "reddit_media": "https://www.reddit.com/r/spacex/comments/4o5j6o",
      "presskit": "https://drive.google.com/open?id=0BwA3a65ef1OvMGpJSlpDNHhjelU",
      "article_link": "https://spaceflightnow.com/2016/06/15/spacex-successfully-fires-satellites-into-orbit-but-loses-booster-on-landing/",
      "wikipedia": "https://en.wikipedia.org/wiki/ABS_(satellite_operator)",
      "video_link": "https://www.youtube.com/watch?v=gLNmtUEvI5A",
      "youtube_id": "gLNmtUEvI5A",
      "flickr_images": [
        "https://farm8.staticflickr.com/7088/27661326426_ce3c3f320d_o.jpg",
        "https://farm8.staticflickr.com/7698/27661325446_affb08be24_o.jpg",
        "https://farm8.staticflickr.com/7733/27661322976_073466e80c_o.jpg",
        "https://farm8.staticflickr.com/7218/27661320706_4c16f3b76b_o.jpg",
        "https://farm8.staticflickr.com/7340/27661315686_6dcb2ce6f9_o.jpg",
        "https://farm8.staticflickr.com/7656/27661313956_e1ac9650b9_o.jpg",
        "https://farm8.staticflickr.com/7616/27661312516_640764f8fd_o.jpg",
        "https://farm8.staticflickr.com/7413/27078893234_0142dd80f0_o.jpg",
        "https://farm8.staticflickr.com/7334/27078889924_8819fd55ea_o.jpg"
      ]
    },
    "details": "One year after pioneering this technique on flight 16, Falcon again launched two Boeing 702SP gridded ion thruster satellites in a dual-stack configuration, with the two customers sharing the rocket and mission costs. First stage landing attempt on drone ship failed on landing due to low thrust on one of the three landing engines.",
    "upcoming": false,
    "static_fire_date_utc": "2016-06-13T15:03:00.000Z",
    "static_fire_date_unix": 1465830180,
    "timeline": {
      "webcast_liftoff": 1079,
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
      "maxq": 77,
      "meco": 156,
      "stage_sep": 159,
      "second_stage_ignition": 167,
      "fairing_deploy": 2129,
      "seco-1": 562,
      "second_stage_restart": 1554,
      "seco-2": 1618,
      "payload_deploy_1": 1829,
      "payload_deploy_2": 2129
    }
  },
  {
    "flight_number": 32,
    "mission_name": "CRS-9",
    "mission_id": [
      "EE86F74"
    ],
    "launch_year": "2016",
    "launch_date_unix": 1468817100,
    "launch_date_utc": "2016-07-18T04:45:00.000Z",
    "launch_date_local": "2016-07-18T00:45:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1025",
            "flight": 1,
            "block": 2,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "RTLS",
            "landing_vehicle": "LZ-1"
          }
        ]
      },
      "second_stage": {
        "block": 2,
        "payloads": [
          {
            "payload_id": "CRS-9",
            "norad_id": [
              41672
            ],
            "cap_serial": "C111",
            "reused": false,
            "customers": [
              "NASA (CRS)"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Dragon 1.1",
            "payload_mass_kg": 2257,
            "payload_mass_lbs": 4976,
            "orbit": "ISS",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 6657.994,
              "eccentricity": 0.0113615,
              "periapsis_km": 204.214,
              "apoapsis_km": 355.504,
              "inclination_deg": 51.6593,
              "period_min": 90.11,
              "lifespan_years": null,
              "epoch": "2016-07-18T05:09:49.000Z",
              "mean_motion": 15.98039801,
              "raan": 263.3429,
              "arg_of_pericenter": 43.7868,
              "mean_anomaly": 66.5408
            },
            "mass_returned_kg": 1550,
            "mass_returned_lbs": 3410,
            "flight_time_sec": 3409380,
            "cargo_manifest": "https://www.nasa.gov/sites/default/files/atoms/files/spacex_crs-9_mission_overview2.pdf"
          }
        ]
      },
      "fairings": null
    },
    "ships": [
      "ELSBETH3",
      "GOQUEST",
      "GOSEARCHER",
      "NRCQUEST"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=CRS9"
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/7c/07/rs4MS4HU_o.png",
      "mission_patch_small": "https://images2.imgbox.com/b6/52/p5vdNEJF_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/4ksedl",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/4t2umd/",
      "reddit_recovery": "https://www.reddit.com/r/spacex/comments/4znsvo",
      "reddit_media": "https://www.reddit.com/r/spacex/comments/4tayth",
      "presskit": "https://drive.google.com/open?id=0BwA3a65ef1OvM0JpSXdDUUJMRVk",
      "article_link": "https://spaceflightnow.com/2016/07/18/spacex-sends-supplies-to-space-station-lands-another-falcon-rocket/",
      "wikipedia": "https://en.wikipedia.org/wiki/SpaceX_CRS-9",
      "video_link": "https://www.youtube.com/watch?v=ThIdCuSsJh8",
      "youtube_id": "ThIdCuSsJh8",
      "flickr_images": [
        "https://farm9.staticflickr.com/8819/27776240293_fcbf8c4a0a_o.jpg",
        "https://farm8.staticflickr.com/7720/27776237513_038971797c_o.jpg",
        "https://farm8.staticflickr.com/7594/27776235133_d794ce01f4_o.jpg",
        "https://farm8.staticflickr.com/7759/27776229243_a0674e590f_o.jpg",
        "https://farm8.staticflickr.com/7512/27776228443_6652c6baea_o.jpg",
        "https://farm9.staticflickr.com/8038/27776218453_34112abbc1_o.jpg",
        "https://farm8.staticflickr.com/7636/27776215913_3f9f1b05df_o.jpg",
        "https://farm8.staticflickr.com/7740/28358960896_9785456101_o.jpg",
        "https://farm8.staticflickr.com/7488/27776206663_262526ba5f_o.jpg",
        "https://farm8.staticflickr.com/7656/28358955546_ce55d65e16_o.jpg",
        "https://farm8.staticflickr.com/7467/27776204693_68b4ed82c9_o.jpg",
        "https://farm8.staticflickr.com/7693/28348649546_0a54b1aa44_o.jpg",
        "https://farm8.staticflickr.com/7540/28291786662_5e2e874576_o.jpg"
      ]
    },
    "details": "Among other cargo, an International Docking Adapter (IDA-2) was carried to the ISS. This mission had a successful first-stage landing at Cape Canaveral.*Including the reusable Dragon Capsule, total payload to orbit was 6457 kg.",
    "upcoming": false,
    "static_fire_date_utc": "2016-07-16T02:31:47.000Z",
    "static_fire_date_unix": 1468636307,
    "timeline": {
      "webcast_liftoff": 1019,
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
      "maxq": 68,
      "meco": 141,
      "stage_sep": 144,
      "second_stage_ignition": 152,
      "first_stage_boostback_burn": 162,
      "first_stage_entry_burn": 391,
      "first_stage_landing": 496,
      "seco-1": 542,
      "dragon_separation": 577,
      "dragon_solar_deploy": 660,
      "dragon_bay_door_deploy": 8340
    }
  },
  {
    "flight_number": 33,
    "mission_name": "JCSAT-16",
    "mission_id": [
      "FE3533D"
    ],
    "launch_year": "2016",
    "launch_date_unix": 1471152360,
    "launch_date_utc": "2016-08-14T05:26:00.000Z",
    "launch_date_local": "2016-08-14T01:26:00-04:00",
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
            "core_serial": "B1026",
            "flight": 1,
            "block": 2,
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
        "block": 2,
        "payloads": [
          {
            "payload_id": "JCSAT-16",
            "norad_id": [
              41729
            ],
            "reused": false,
            "customers": [
              "SKY Perfect JCSAT Group"
            ],
            "nationality": "Japan",
            "manufacturer": "SSL",
            "payload_type": "Satellite",
            "payload_mass_kg": 4600,
            "payload_mass_lbs": 10100,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": 162,
              "semi_major_axis_km": 42165.459,
              "eccentricity": 0.0001855,
              "periapsis_km": 35779.502,
              "apoapsis_km": 35795.146,
              "inclination_deg": 0.022,
              "period_min": 1436.134,
              "lifespan_years": 15,
              "epoch": "2019-02-04T05:27:24.000Z",
              "mean_motion": 1.0026919,
              "raan": 80.1726,
              "arg_of_pericenter": 280.8983,
              "mean_anomaly": 358.9296
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
      "ELSBETH3",
      "GOQUEST",
      "GOSEARCHER",
      "OCISLY"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=JC16"
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/74/fc/KiaMQgym_o.png",
      "mission_patch_small": "https://images2.imgbox.com/a4/21/eLkeQOl8_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/4pv6ws",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/4xi7uq",
      "reddit_recovery": "https://www.reddit.com/r/spacex/comments/4y5xd1",
      "reddit_media": "https://www.reddit.com/r/spacex/comments/4xkdfj",
      "presskit": "https://drive.google.com/open?id=0BwA3a65ef1Ovb0FkYnE5dElZRlU",
      "article_link": "https://spaceflightnow.com/2016/08/14/falcon-9-rocket-launches-japanese-satellite-then-nails-bullseye-landing/",
      "wikipedia": "https://en.wikipedia.org/wiki/JCSAT-16",
      "video_link": "https://www.youtube.com/watch?v=QZTCEO0gvLo",
      "youtube_id": "QZTCEO0gvLo",
      "flickr_images": [
        "https://farm9.staticflickr.com/8699/28965678292_17533229f3_o.jpg",
        "https://farm9.staticflickr.com/8173/28453337463_b9d11eeb4c_o.jpg",
        "https://farm8.staticflickr.com/7793/28453335533_3f5a0a5760_o.jpg",
        "https://farm9.staticflickr.com/8784/28938085496_74b3fd0527_o.jpg",
        "https://farm9.staticflickr.com/8337/28969742675_15f78369a1_o.jpg",
        "https://farm9.staticflickr.com/8691/28353012603_ab83b6f5aa_o.jpg",
        "https://farm9.staticflickr.com/8078/28351782813_58ca783e51_o.jpg"
      ]
    },
    "details": "First attempt to touch down from a ballistic trajectory using a single-engine landing burn. All previous landings from a ballistic trajectory had fired three engines on the landing-burn, which provided more braking force, but subjected the vehicle to greater structural stresses. The single-engine landing burn takes more time and fuel, but puts less stress on the vehicle.",
    "upcoming": false,
    "static_fire_date_utc": "2016-08-11T04:01:00.000Z",
    "static_fire_date_unix": 1470888060,
    "timeline": {
      "webcast_liftoff": 1020,
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
      "maxq": 78,
      "stage_sep": 156,
      "second_stage_ignition": 1590,
      "fairing_deploy": 212,
      "seco-1": 512,
      "second_stage_restart": 1590,
      "seco-2": 1652,
      "payload_deploy": 1933
    }
  },
  {
    "flight_number": 34,
    "mission_name": "Amos-6",
    "mission_id": [],
    "launch_year": "2016",
    "launch_date_unix": 1472735220,
    "launch_date_utc": "2016-09-01T13:07:00.000Z",
    "launch_date_local": "2016-09-01T09:07:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": null,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1028",
            "flight": 1,
            "block": 3,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": null,
            "landing_intent": true,
            "landing_type": "ASDS",
            "landing_vehicle": "OCISLY"
          }
        ]
      },
      "second_stage": {
        "block": 3,
        "payloads": [
          {
            "payload_id": "Amos-6",
            "norad_id": [],
            "reused": false,
            "customers": [
              "Spacecom"
            ],
            "nationality": "Israel",
            "manufacturer": "Israel Aerospace Industries",
            "payload_type": "Satellite",
            "payload_mass_kg": 5500,
            "payload_mass_lbs": 12100,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": -4,
              "semi_major_axis_km": null,
              "eccentricity": null,
              "periapsis_km": 35785,
              "apoapsis_km": 35800,
              "inclination_deg": null,
              "period_min": null,
              "lifespan_years": 15,
              "epoch": null,
              "mean_motion": null,
              "raan": null,
              "arg_of_pericenter": null,
              "mean_anomaly": null
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
    "ships": [],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": false,
    "launch_failure_details": {
      "time": -165180,
      "altitude": 0,
      "reason": "buckled liner in several of the COPV tanks, causing perforations that allowed liquid and/or solid oxygen to accumulate underneath the lining, which was ignited by friction."
    },
    "links": {
      "mission_patch": "https://images2.imgbox.com/eb/28/cg2hkitx_o.png",
      "mission_patch_small": "https://images2.imgbox.com/54/7a/c5XLHIvL_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/4pv7jl",
      "reddit_launch": null,
      "reddit_recovery": null,
      "reddit_media": null,
      "presskit": null,
      "article_link": "https://spaceflightnow.com/2016/09/01/spacex-rocket-and-israeli-satellite-destroyed-in-launch-pad-explosion/",
      "wikipedia": "https://en.wikipedia.org/wiki/Amos-6",
      "video_link": "https://www.youtube.com/watch?v=_BgJEXQkjNQ",
      "youtube_id": "_BgJEXQkjNQ",
      "flickr_images": []
    },
    "details": "The rocket and Amos-6 payload were lost in a launch pad explosion on September 1, 2016 during propellant fill prior to a static fire test. The pad was clear of personnel and there were no injuries.",
    "upcoming": false,
    "static_fire_date_utc": "2016-09-01T13:07:00.000Z",
    "static_fire_date_unix": 1472735220,
    "timeline": null
  },
  {
    "flight_number": 35,
    "mission_name": "Iridium NEXT Mission 1",
    "mission_id": [
      "F3364BF"
    ],
    "launch_year": "2017",
    "launch_date_unix": 1484416440,
    "launch_date_utc": "2017-01-14T17:54:00.000Z",
    "launch_date_local": "2017-01-14T10:54:00-07:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1029",
            "flight": 1,
            "block": 3,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "ASDS",
            "landing_vehicle": "JRTI"
          }
        ]
      },
      "second_stage": {
        "block": 3,
        "payloads": [
          {
            "payload_id": "Iridium NEXT 1",
            "norad_id": [
              41917,
              41918,
              41919,
              41920,
              41921,
              41922,
              41923,
              41924,
              41925,
              41926
            ],
            "reused": false,
            "customers": [
              "Iridium Communications"
            ],
            "nationality": "United States",
            "manufacturer": "Thales Alenia Space",
            "payload_type": "Satellite",
            "payload_mass_kg": 9600,
            "payload_mass_lbs": 21200,
            "orbit": "PO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 7155.801,
              "eccentricity": 0.0002666,
              "periapsis_km": 775.758,
              "apoapsis_km": 779.573,
              "inclination_deg": 86.3999,
              "period_min": 100.403,
              "lifespan_years": 15,
              "epoch": "2019-02-05T08:33:06.000Z",
              "mean_motion": 14.34218662,
              "raan": 132.169,
              "arg_of_pericenter": 96.9839,
              "mean_anomaly": 263.1661
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
      "JRTI-2",
      "NRCQUEST",
      "PACIFICWARRIOR"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=IRD1"
    },
    "launch_site": {
      "site_id": "vafb_slc_4e",
      "site_name": "VAFB SLC 4E",
      "site_name_long": "Vandenberg Air Force Base Space Launch Complex 4E"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/ab/b8/USCniUHy_o.png",
      "mission_patch_small": "https://images2.imgbox.com/a6/e8/5PyY296y_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/5dii6z",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/5nsaqm",
      "reddit_recovery": "https://www.reddit.com/r/spacex/comments/5oe9kk",
      "reddit_media": "https://www.reddit.com/r/spacex/comments/5nsico",
      "presskit": "https://drive.google.com/open?id=0BwA3a65ef1OvZC1aU3FuMlQzalE",
      "article_link": "https://spaceflightnow.com/2017/01/14/spacex-resumes-flights-with-on-target-launch-for-iridium/",
      "wikipedia": "https://en.wikipedia.org/wiki/Iridium_satellite_constellation#Next-generation_constellation",
      "video_link": "https://www.youtube.com/watch?v=7WimRhydggo",
      "youtube_id": "7WimRhydggo",
      "flickr_images": [
        "https://farm1.staticflickr.com/658/32394688795_55a9873ea7_o.jpg",
        "https://farm1.staticflickr.com/506/32394688095_a3339f3c6d_o.jpg",
        "https://farm1.staticflickr.com/745/32394687645_63ae2b4740_o.jpg",
        "https://farm1.staticflickr.com/318/31548291014_e3a30abca8_o.jpg",
        "https://farm1.staticflickr.com/670/32351549066_e9cffe8d2b_o.jpg",
        "https://farm6.staticflickr.com/5518/31579784413_83aeac560a_o.jpg",
        "https://farm6.staticflickr.com/5556/32312421135_22c197c156_o.jpg",
        "https://farm1.staticflickr.com/529/32312420015_5d2403a847_o.jpg",
        "https://farm1.staticflickr.com/435/32312417695_19c0e50c4b_o.jpg",
        "https://farm1.staticflickr.com/735/32312416415_b90892af0a_o.jpg",
        "https://farm1.staticflickr.com/293/32312415025_cae16d1994_o.jpg",
        "https://farm1.staticflickr.com/738/31467130724_92e02c9524_o.jpg",
        "https://farm1.staticflickr.com/464/31467130374_9f7a7d380e_o.jpg",
        "https://farm1.staticflickr.com/581/31467129424_bac77d594a_o.jpg",
        "https://farm1.staticflickr.com/380/32308163845_c1731a4b1f_o.jpg",
        "https://farm1.staticflickr.com/447/31450835954_72ed10a19e_o.jpg",
        "https://farm1.staticflickr.com/507/31450834974_b8a3f4aca5_o.jpg"
      ]
    },
    "details": "Return-to-flight mission after the loss of Amos-6 in September 2016. Iridium NEXT will replace the original Iridium constellation, launched in the late 1990s. Each Falcon mission will carry 10 satellites, with a goal to complete deployment of the 66 plus 9 spare satellite constellation by mid 2018. The first two Iridium qualification units were supposed to ride a Dnepr rocket in April 2016 but were delayed, so Iridium decided to qualify the first batch of 10 satellites instead.",
    "upcoming": false,
    "static_fire_date_utc": "2017-01-05T19:40:00.000Z",
    "static_fire_date_unix": 1483645200,
    "timeline": {
      "webcast_liftoff": 1179,
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
      "maxq": 69,
      "stage_sep": 147,
      "second_stage_ignition": 3151,
      "fairing_deploy": 195,
      "first_stage_landing": 469,
      "seco-1": 549,
      "second_stage_restart": 3151,
      "seco-2": 3154,
      "payload_deploy": 4456
    }
  },
  {
    "flight_number": 36,
    "mission_name": "CRS-10",
    "mission_id": [
      "EE86F74"
    ],
    "launch_year": "2017",
    "launch_date_unix": 1487515140,
    "launch_date_utc": "2017-02-19T14:39:00.000Z",
    "launch_date_local": "2017-02-19T10:39:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1031",
            "flight": 1,
            "block": 3,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "RTLS",
            "landing_vehicle": "LZ-1"
          }
        ]
      },
      "second_stage": {
        "block": 3,
        "payloads": [
          {
            "payload_id": "CRS-10",
            "norad_id": [
              42053
            ],
            "cap_serial": "C112",
            "reused": false,
            "customers": [
              "NASA (CRS)"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Dragon 1.1",
            "payload_mass_kg": 2490,
            "payload_mass_lbs": 5490,
            "orbit": "ISS",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 6657.603,
              "eccentricity": 0.0115859,
              "periapsis_km": 202.334,
              "apoapsis_km": 356.602,
              "inclination_deg": 51.632,
              "period_min": 90.102,
              "lifespan_years": null,
              "epoch": "2017-02-19T15:02:32.000Z",
              "mean_motion": 15.98180622,
              "raan": 264.9784,
              "arg_of_pericenter": 44.275,
              "mean_anomaly": 62.9999
            },
            "mass_returned_kg": 1652,
            "mass_returned_lbs": 3642,
            "flight_time_sec": 2419620,
            "cargo_manifest": "https://www.nasa.gov/sites/default/files/atoms/files/spacex_crs-10_mission_overview.pdf"
          }
        ]
      },
      "fairings": null
    },
    "ships": [
      "NRCQUEST"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=CR10"
    },
    "launch_site": {
      "site_id": "ksc_lc_39a",
      "site_name": "KSC LC 39A",
      "site_name_long": "Kennedy Space Center Historic Launch Complex 39A"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/02/52/hp8DpyGM_o.png",
      "mission_patch_small": "https://images2.imgbox.com/d3/08/7YmXiSOQ_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/5n2eqx",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/5uw4bh",
      "reddit_recovery": "https://www.reddit.com/r/spacex/comments/609aq4",
      "reddit_media": "https://www.reddit.com/r/spacex/comments/5uoy8o",
      "presskit": "http://www.spacex.com/sites/spacex/files/crs10presskitfinal.pdf",
      "article_link": "https://spaceflightnow.com/2017/02/19/historic-launch-pad-back-in-service-with-thundering-blastoff-by-spacex/",
      "wikipedia": "https://en.wikipedia.org/wiki/SpaceX_CRS-10",
      "video_link": "https://www.youtube.com/watch?v=giNhaEzv_PI",
      "youtube_id": "giNhaEzv_PI",
      "flickr_images": [
        "https://farm3.staticflickr.com/2815/32761844973_d2e8d76e9c_o.jpg",
        "https://farm4.staticflickr.com/3878/32761843663_8e366494f4_o.jpg",
        "https://farm3.staticflickr.com/2790/32852846842_6f1f7b26b9_o.jpg",
        "https://farm3.staticflickr.com/2295/32852845662_e7ae0daf4a_o.jpg",
        "https://farm4.staticflickr.com/3888/33000639155_2a6e2bb23d_o.jpg",
        "https://farm1.staticflickr.com/405/33000638185_b4ec7c7b93_o.jpg",
        "https://farm1.staticflickr.com/574/32874779241_9f463de901_o.jpg",
        "https://farm4.staticflickr.com/3710/32153433074_96337a54db_o.jpg",
        "https://farm1.staticflickr.com/327/32153432924_09dd1482d8_o.jpg",
        "https://farm3.staticflickr.com/2881/32183025803_36bf976b9e_o.jpg",
        "https://farm3.staticflickr.com/2362/32183025493_2a37b4e22c_o.jpg",
        "https://farm1.staticflickr.com/504/32178458813_ff47f61bb9_o.jpg",
        "https://farm1.staticflickr.com/265/32176806823_879ccc5da0_o.jpg",
        "https://farm1.staticflickr.com/401/32866357531_69c6d289ed_o.jpg",
        "https://farm3.staticflickr.com/2105/32945170805_553d45ca56_o.jpg",
        "https://farm4.staticflickr.com/3865/32945170225_58129f00dc_o.jpg"
      ]
    },
    "details": "First Falcon 9 flight from the historic LC-39A launchpad at Kennedy Space Center, carrying supplies and materials to support dozens of science and research investigations scheduled during ISS Expeditions 50 and 51. The first stage returned to launch site and landed at LZ-1.",
    "upcoming": false,
    "static_fire_date_utc": "2017-02-12T21:30:00.000Z",
    "static_fire_date_unix": 1486935000,
    "timeline": {
      "webcast_liftoff": 1199,
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
      "maxq": 75,
      "meco": 141,
      "stage_sep": 144,
      "second_stage_ignition": 152,
      "first_stage_boostback_burn": 161,
      "first_stage_entry_burn": 392,
      "seco-1": 545,
      "dragon_separation": 605,
      "dragon_solar_deploy": 660,
      "dragon_bay_door_deploy": 8400
    }
  },
  {
    "flight_number": 37,
    "mission_name": "EchoStar 23",
    "mission_id": [],
    "launch_year": "2017",
    "launch_date_unix": 1489644000,
    "launch_date_utc": "2017-03-16T06:00:00.000Z",
    "launch_date_local": "2017-03-16T02:00:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 9000,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1030",
            "flight": 1,
            "block": 3,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 3,
        "payloads": [
          {
            "payload_id": "EchoStar 23",
            "norad_id": [
              42070
            ],
            "reused": false,
            "customers": [
              "EchoStar"
            ],
            "nationality": "United States",
            "manufacturer": "Airbus Defence and Space",
            "payload_type": "Satellite",
            "payload_mass_kg": 5600,
            "payload_mass_lbs": 12399,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": -44.9,
              "semi_major_axis_km": 42164.48,
              "eccentricity": 0.0002052,
              "periapsis_km": 35777.693,
              "apoapsis_km": 35794.997,
              "inclination_deg": 0.0171,
              "period_min": 1436.084,
              "lifespan_years": 15,
              "epoch": "2019-02-04T18:01:03.000Z",
              "mean_motion": 1.00272682,
              "raan": 84.6572,
              "arg_of_pericenter": 226.7645,
              "mean_anomaly": 48.5304
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
    "ships": [],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=ES23"
    },
    "launch_site": {
      "site_id": "ksc_lc_39a",
      "site_name": "KSC LC 39A",
      "site_name_long": "Kennedy Space Center Historic Launch Complex 39A"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/47/c2/mmiTCLkJ_o.png",
      "mission_patch_small": "https://images2.imgbox.com/54/f8/0X2hNhNK_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/5n2e10/echostar_23_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/5z8dkm/welcome_to_the_rspacex_echostar23_official_launch/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/5z8if6/rspacex_echostar_23_media_thread_videos_images/",
      "presskit": "http://www.spacex.com/sites/spacex/files/echostarxxiiifinal.pdf",
      "article_link": "http://spacenews.com/spacex-launches-echostar-23/",
      "wikipedia": "https://en.wikipedia.org/wiki/EchoStar#Satellite_fleet",
      "video_link": "https://www.youtube.com/watch?v=lZmqbL-hz7U",
      "youtube_id": "lZmqbL-hz7U",
      "flickr_images": [
        "https://farm4.staticflickr.com/3819/33094074350_ae56bd5c73_o.jpg",
        "https://farm3.staticflickr.com/2935/33094073720_92234ddaee_o.jpg",
        "https://farm1.staticflickr.com/768/33094072690_31a85e82ba_o.jpg",
        "https://farm3.staticflickr.com/2876/33094072100_546090a4f3_o.jpg",
        "https://farm3.staticflickr.com/2860/32626053254_d702922d87_o.jpg",
        "https://farm3.staticflickr.com/2904/32654666113_ba833971e0_o.jpg",
        "https://farm1.staticflickr.com/677/32654665263_751d29ded1_o.jpg",
        "https://farm3.staticflickr.com/2936/33299697331_09313ac49d_o.jpg"
      ]
    },
    "details": "Communications satellite for EchoStar Corp. EchoStar XXIII, based on a spare platform from the cancelled CMBStar 1 satellite program, will provide direct-to-home television broadcast services over Brazil. There was no attempt at a first-stage recovery so this rocket did not have landing legs or grid fins.",
    "upcoming": false,
    "static_fire_date_utc": "2017-03-09T23:00:00.000Z",
    "static_fire_date_unix": 1489100400,
    "timeline": {
      "webcast_liftoff": 1079,
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
      "maxq": 76,
      "stage_sep": 167,
      "second_stage_ignition": 1579,
      "fairing_deploy": 223,
      "seco-1": 511,
      "second_stage_restart": 1579,
      "seco-2": 1639,
      "payload_deploy": 2040
    }
  },
  {
    "flight_number": 38,
    "mission_name": "SES-10",
    "mission_id": [
      "6C42550"
    ],
    "launch_year": "2017",
    "launch_date_unix": 1490912820,
    "launch_date_utc": "2017-03-30T22:27:00.000Z",
    "launch_date_local": "2017-03-30T18:27:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 9000,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1021",
            "flight": 2,
            "block": 2,
            "gridfins": true,
            "legs": true,
            "reused": true,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "ASDS",
            "landing_vehicle": "OCISLY"
          }
        ]
      },
      "second_stage": {
        "block": 2,
        "payloads": [
          {
            "payload_id": "SES-10",
            "norad_id": [
              42432
            ],
            "reused": false,
            "customers": [
              "SES"
            ],
            "nationality": "Luxembourg",
            "manufacturer": "Airbus Defence and Space",
            "payload_type": "Satellite",
            "payload_mass_kg": 5300,
            "payload_mass_lbs": 11700,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": -67,
              "semi_major_axis_km": 42164.72,
              "eccentricity": 0.0002278,
              "periapsis_km": 35776.98,
              "apoapsis_km": 35796.19,
              "inclination_deg": 0.0105,
              "period_min": 1436.096,
              "lifespan_years": 15,
              "epoch": "2019-02-04T19:28:48.000Z",
              "mean_motion": 1.00271826,
              "raan": 78.5479,
              "arg_of_pericenter": 239.6494,
              "mean_anomaly": 41.7551
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
      "ELSBETH3",
      "GOQUEST",
      "GOSEARCHER",
      "OCISLY"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=SS10"
    },
    "launch_site": {
      "site_id": "ksc_lc_39a",
      "site_name": "KSC LC 39A",
      "site_name_long": "Kennedy Space Center Historic Launch Complex 39A"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/d1/f6/9q2edz2p_o.png",
      "mission_patch_small": "https://images2.imgbox.com/5b/10/dfj7yRG3_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/5sjrzj/ses10_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/62aqi7/rspacex_ses10_official_launch_discussion_updates/",
      "reddit_recovery": "https://www.reddit.com/r/spacex/comments/634gmr/b1021ses10_recovery_thread/",
      "reddit_media": "https://www.reddit.com/r/spacex/comments/62aqad/rspacex_ses10_media_thread_videos_images_gifs/",
      "presskit": "http://www.spacex.com/sites/spacex/files/finalses10presskit.pdf",
      "article_link": "https://spaceflightnow.com/2017/03/31/spacex-flies-rocket-for-second-time-in-historic-test-of-cost-cutting-technology/",
      "wikipedia": "https://en.wikipedia.org/wiki/SES-10",
      "video_link": "https://www.youtube.com/watch?v=xsZSXav4wI8",
      "youtube_id": "xsZSXav4wI8",
      "flickr_images": [
        "https://farm1.staticflickr.com/601/33026465643_462ef7a2cb_o.jpg",
        "https://farm3.staticflickr.com/2850/32996438264_b79ca3664b_o.jpg",
        "https://farm4.staticflickr.com/3956/32996437434_4dab1ae8e3_o.jpg",
        "https://farm4.staticflickr.com/3831/32996435084_6c5662caca_o.jpg",
        "https://farm4.staticflickr.com/3775/32915200224_b6ecfabd7e_o.jpg",
        "https://farm4.staticflickr.com/3886/32915199874_b826eac153_o.jpg",
        "https://farm3.staticflickr.com/2842/32915199514_6c44178e87_o.jpg",
        "https://farm4.staticflickr.com/3771/32915198904_2df85aed05_o.jpg",
        "https://farm4.staticflickr.com/3668/32915198334_d2fa2f16ab_o.jpg",
        "https://farm4.staticflickr.com/3955/32915197674_24d6e27cf5_o.jpg",
        "https://farm4.staticflickr.com/3830/33616913981_f04b6e2351_o.jpg",
        "https://farm4.staticflickr.com/3819/33616913111_e699b48d66_o.jpg",
        "https://farm4.staticflickr.com/3835/33361035860_c57ed61239_o.jpg",
        "https://farm4.staticflickr.com/3783/33361035200_bfb797d38f_o.jpg",
        "https://farm4.staticflickr.com/3698/33611796351_54d5a6d65a_o.jpg",
        "https://farm3.staticflickr.com/2857/33611795531_82cc2d8789_o.jpg"
      ]
    },
    "details": "First payload to fly on a reused first stage, B1021, previously launched with CRS-8, which also landed a second time. In what is also a first, the payload fairing remained intact after a successful splashdown achieved with thrusters and a steerable parachute.",
    "upcoming": false,
    "static_fire_date_utc": "2017-03-27T18:00:00.000Z",
    "static_fire_date_unix": 1490637600,
    "timeline": {
      "webcast_liftoff": 1139,
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
      "maxq": 82,
      "stage_sep": 161,
      "second_stage_ignition": 1589,
      "fairing_deploy": 229,
      "first_stage_entry_burn": 379,
      "first_stage_landing": 512,
      "seco-1": 514,
      "second_stage_restart": 1589,
      "seco-2": 1642,
      "payload_deploy": 1923
    }
  },
  {
    "flight_number": 39,
    "mission_name": "NROL-76",
    "mission_id": [],
    "launch_year": "2017",
    "launch_date_unix": 1493637300,
    "launch_date_utc": "2017-05-01T11:15:00.000Z",
    "launch_date_local": "2017-05-01T07:15:00-04:00",
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
            "core_serial": "B1032",
            "flight": 1,
            "block": 3,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "RTLS",
            "landing_vehicle": "LZ-1"
          }
        ]
      },
      "second_stage": {
        "block": 3,
        "payloads": [
          {
            "payload_id": "NROL-76",
            "norad_id": [],
            "reused": false,
            "customers": [
              "NRO"
            ],
            "nationality": "United States",
            "manufacturer": "Boeing",
            "payload_type": "Satellite",
            "payload_mass_kg": null,
            "payload_mass_lbs": null,
            "orbit": "LEO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": null,
              "eccentricity": null,
              "periapsis_km": null,
              "apoapsis_km": null,
              "inclination_deg": 50,
              "period_min": null,
              "lifespan_years": 10,
              "epoch": null,
              "mean_motion": null,
              "raan": null,
              "arg_of_pericenter": null,
              "mean_anomaly": null
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
      "GOSEARCHER"
    ],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ksc_lc_39a",
      "site_name": "KSC LC 39A",
      "site_name_long": "Kennedy Space Center Historic Launch Complex 39A"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/8e/6e/dM1L8DMs_o.png",
      "mission_patch_small": "https://images2.imgbox.com/0d/06/aNPEVF72_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/601ykx",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/68bn8y/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/68bpii",
      "presskit": "http://www.spacex.com/sites/spacex/files/nrol76presskit.pdf",
      "article_link": "https://techcrunch.com/2017/05/01/spacex-successfully-launches-nrol-76-u-s-military-satellite/",
      "wikipedia": "https://en.wikipedia.org/wiki/List_of_NRO_launches",
      "video_link": "https://www.youtube.com/watch?v=EzQpkQ1etdA",
      "youtube_id": "EzQpkQ1etdA",
      "flickr_images": [
        "https://farm3.staticflickr.com/2922/33578359423_4169ac8f98_o.jpg",
        "https://farm3.staticflickr.com/2900/33578357343_85c247ebce_o.jpg",
        "https://farm5.staticflickr.com/4166/34006001860_8c45f28e69_o.jpg",
        "https://farm5.staticflickr.com/4166/34005999880_77684dba4b_o.jpg",
        "https://farm3.staticflickr.com/2934/34005998140_c77076b6fb_o.jpg",
        "https://farm5.staticflickr.com/4191/34005996220_fe9e4342d3_o.jpg",
        "https://farm3.staticflickr.com/2883/33575654563_699c544776_o.jpg",
        "https://farm3.staticflickr.com/2902/33575652913_0dece34db4_o.jpg",
        "https://farm5.staticflickr.com/4163/33575651063_24e05826c5_o.jpg",
        "https://farm3.staticflickr.com/2876/33994851620_fabd14770f_o.jpg",
        "https://farm3.staticflickr.com/2832/33973172140_b370b79c51_o.jpg",
        "https://farm3.staticflickr.com/2874/34357262105_11b417bea2_o.jpg",
        "https://farm5.staticflickr.com/4158/34357260545_16870a94ba_o.jpg"
      ]
    },
    "details": "First launch under SpaceX's certification for national security space missions, which allows SpaceX to contract launch services for classified payloads. Second-stage speed and altitude telemetry were omitted from the launch webcast, which displayed first-stage telemetry instead, with continuous tracking of the booster from liftoff to landing for the first time.",
    "upcoming": false,
    "static_fire_date_utc": "2017-04-25T19:02:00.000Z",
    "static_fire_date_unix": 1493146920,
    "timeline": {
      "webcast_liftoff": 718,
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
      "maxq": 68,
      "stage_sep": 140,
      "second_stage_ignition": 148,
      "fairing_deploy": 168,
      "first_stage_landing": 526
    }
  },
  {
    "flight_number": 40,
    "mission_name": "Inmarsat-5 F4",
    "mission_id": [],
    "launch_year": "2017",
    "launch_date_unix": 1494890460,
    "launch_date_utc": "2017-05-15T23:21:00.000Z",
    "launch_date_local": "2017-05-15T19:21:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 2940,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1034",
            "flight": 1,
            "block": 3,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 3,
        "payloads": [
          {
            "payload_id": "Inmarsat-5 F4",
            "norad_id": [
              42698
            ],
            "reused": false,
            "customers": [
              "Inmarsat"
            ],
            "nationality": "United Kingdom",
            "manufacturer": "Boeing",
            "payload_type": "Satellite",
            "payload_mass_kg": 6070,
            "payload_mass_lbs": 13380,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": 117,
              "semi_major_axis_km": 42165.963,
              "eccentricity": 0.000016,
              "periapsis_km": 35787.153,
              "apoapsis_km": 35788.503,
              "inclination_deg": 0.0143,
              "period_min": 1436.159,
              "lifespan_years": 15,
              "epoch": "2019-02-04T11:16:38.000Z",
              "mean_motion": 1.00267392,
              "raan": 81.7372,
              "arg_of_pericenter": 132.3823,
              "mean_anomaly": 145.8491
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
    "ships": [],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=I5F4"
    },
    "launch_site": {
      "site_id": "ksc_lc_39a",
      "site_name": "KSC LC 39A",
      "site_name_long": "Kennedy Space Center Historic Launch Complex 39A"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/76/0b/bJD0zV02_o.png",
      "mission_patch_small": "https://images2.imgbox.com/82/d6/SCoNa79H_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/64kguj/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/6b88hz/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/6bcf8j/",
      "presskit": "https://www.spacex.com/sites/spacex/files/inmarsat5f4presskit_final.pdf",
      "article_link": "https://www.space.com/36852-spacex-launches-inmarsat-5-f4-satellite.html",
      "wikipedia": "https://en.wikipedia.org/wiki/Inmarsat#Satellites",
      "video_link": "https://www.youtube.com/watch?v=ynMYE64IEKs",
      "youtube_id": "ynMYE64IEKs",
      "flickr_images": [
        "https://farm5.staticflickr.com/4174/33859521334_d75fa367d5_o.jpg",
        "https://farm5.staticflickr.com/4158/33859520764_5bb7a7daf6_o.jpg",
        "https://farm5.staticflickr.com/4182/33859520404_a9c78c971d_o.jpg",
        "https://farm5.staticflickr.com/4157/34556140711_f404943340_o.jpg",
        "https://farm5.staticflickr.com/4179/34556139821_b2d6255e07_o.jpg",
        "https://farm5.staticflickr.com/4187/34684981395_2f93965492_o.jpg",
        "https://farm5.staticflickr.com/4155/34684980875_77b745158a_o.jpg",
        "https://farm5.staticflickr.com/4183/34296430820_8d3a42c0d7_o.jpg"
      ]
    },
    "details": "At 6,070 kg this was the heaviest payload launched to GTO by a Falcon 9 rocket. The launch was originally scheduled for the Falcon Heavy, but performance improvements allowed the mission to be carried out by an expendable Falcon 9 instead.",
    "upcoming": false,
    "static_fire_date_utc": "2017-05-11T16:45:00.000Z",
    "static_fire_date_unix": 1494521100,
    "timeline": {
      "webcast_liftoff": 600,
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
      "maxq": 77,
      "stage_sep": 169,
      "second_stage_ignition": 1619,
      "fairing_deploy": 215,
      "seco-1": 518,
      "second_stage_restart": 1619,
      "seco-2": 1675,
      "payload_deploy": 1908
    }
  },
  {
    "flight_number": 41,
    "mission_name": "CRS-11",
    "mission_id": [
      "EE86F74"
    ],
    "launch_year": "2017",
    "launch_date_unix": 1496524020,
    "launch_date_utc": "2017-06-03T21:07:00.000Z",
    "launch_date_local": "2017-06-03T17:07:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1035",
            "flight": 1,
            "block": 3,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "RTLS",
            "landing_vehicle": "LZ-1"
          }
        ]
      },
      "second_stage": {
        "block": 3,
        "payloads": [
          {
            "payload_id": "CRS-11",
            "norad_id": [
              42744
            ],
            "cap_serial": "C106",
            "reused": false,
            "customers": [
              "NASA (CRS)"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Dragon 1.1",
            "payload_mass_kg": 2708,
            "payload_mass_lbs": 5970,
            "orbit": "ISS",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 6657.963,
              "eccentricity": 0.0113366,
              "periapsis_km": 204.35,
              "apoapsis_km": 355.307,
              "inclination_deg": 51.639,
              "period_min": 90.109,
              "lifespan_years": null,
              "epoch": "2017-06-03T23:01:19.000Z",
              "mean_motion": 15.9805087,
              "raan": 104.5218,
              "arg_of_pericenter": 45.1464,
              "mean_anomaly": 62.5836
            },
            "mass_returned_kg": 1900,
            "mass_returned_lbs": 4100,
            "flight_time_sec": 2559840,
            "cargo_manifest": "https://www.nasa.gov/sites/default/files/atoms/files/spacex_crs-11_mission_overview.pdf"
          }
        ]
      },
      "fairings": null
    },
    "ships": [
      "NRCQUEST"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=CR11"
    },
    "launch_site": {
      "site_id": "ksc_lc_39a",
      "site_name": "KSC LC 39A",
      "site_name_long": "Kennedy Space Center Historic Launch Complex 39A"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/4b/88/4irzX449_o.png",
      "mission_patch_small": "https://images2.imgbox.com/e8/33/RV791zv9_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/68ul58/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/6ektkt/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/6emlzr/",
      "presskit": "http://www.spacex.com/sites/spacex/files/crs11presskit.pdf",
      "article_link": "https://spaceflightnow.com/2017/06/03/reused-dragon-cargo-capsule-launched-on-journey-to-space-station/",
      "wikipedia": "https://en.wikipedia.org/wiki/SpaceX_CRS-11",
      "video_link": "https://www.youtube.com/watch?v=JuZBOUMsYws",
      "youtube_id": "JuZBOUMsYws",
      "flickr_images": [
        "https://farm5.staticflickr.com/4210/34696326760_cee662ef1f_o.jpg",
        "https://farm5.staticflickr.com/4279/34239858024_64795724c9_o.jpg",
        "https://farm5.staticflickr.com/4250/35043398436_3ceaa0098a_o.jpg",
        "https://farm5.staticflickr.com/4223/34272083563_f52e5bfffe_o.jpg",
        "https://farm5.staticflickr.com/4219/34918571502_7cf66854f7_o.jpg",
        "https://farm5.staticflickr.com/4252/34918568732_4efe0885de_o.jpg",
        "https://farm5.staticflickr.com/4264/34272065153_cfd8899f3e_o.jpg",
        "https://farm5.staticflickr.com/4284/34948230531_e76b7560c9_o.jpg",
        "https://farm5.staticflickr.com/4280/35078830875_afbd41c675_o.jpg",
        "https://farm5.staticflickr.com/4280/34268361083_71fc70ff1a_o.jpg",
        "https://farm5.staticflickr.com/4199/35038651646_93d0339269_o.jpg",
        "https://farm5.staticflickr.com/4227/34223076793_4abe7e74d6_o.jpg"
      ]
    },
    "details": "This mission delivered the Neutron Star Interior Composition Explorer (NICER) to the ISS, along with the MUSES Earth imaging platform and ROSA solar array. For the first time, this mission launched a refurbished Dragon capsule, serial number C106 which first flew in September 2014 on the CRS-4 mission. Originally scheduled to launch on June 1, but was scrubbed due to inclement weather.",
    "upcoming": false,
    "static_fire_date_utc": "2017-05-28T16:00:00.000Z",
    "static_fire_date_unix": 1495987200,
    "timeline": {
      "webcast_liftoff": 1199,
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
      "maxq": 78,
      "meco": 142,
      "stage_sep": 145,
      "second_stage_ignition": 152,
      "first_stage_boostback_burn": 158,
      "first_stage_landing": 447,
      "seco-1": 560,
      "dragon_separation": 620,
      "dragon_solar_deploy": 720,
      "dragon_bay_door_deploy": 8400
    }
  },
  {
    "flight_number": 42,
    "mission_name": "BulgariaSat-1",
    "mission_id": [],
    "launch_year": "2017",
    "launch_date_unix": 1498245000,
    "launch_date_utc": "2017-06-23T19:10:00.000Z",
    "launch_date_local": "2017-06-23T15:10:00-04:00",
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
            "core_serial": "B1029",
            "flight": 2,
            "block": 3,
            "gridfins": true,
            "legs": true,
            "reused": true,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "ASDS",
            "landing_vehicle": "OCISLY"
          }
        ]
      },
      "second_stage": {
        "block": 3,
        "payloads": [
          {
            "payload_id": "BulgariaSat-1",
            "norad_id": [
              42801
            ],
            "reused": false,
            "customers": [
              "Bulgaria Sat"
            ],
            "nationality": "Bulgaria",
            "manufacturer": "SSL",
            "payload_type": "Satellite",
            "payload_mass_kg": 3669,
            "payload_mass_lbs": 8089,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": 1.9,
              "semi_major_axis_km": 42164.282,
              "eccentricity": 0.0002393,
              "periapsis_km": 35776.057,
              "apoapsis_km": 35796.237,
              "inclination_deg": 0.0089,
              "period_min": 1436.073,
              "lifespan_years": 15,
              "epoch": "2019-02-04T14:54:19.000Z",
              "mean_motion": 1.00273388,
              "raan": 58.068,
              "arg_of_pericenter": 257.072,
              "mean_anomaly": 44.8103
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
      "ELSBETH3",
      "GOQUEST",
      "GOSEARCHER",
      "OCISLY"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=BGS1"
    },
    "launch_site": {
      "site_id": "ksc_lc_39a",
      "site_name": "KSC LC 39A",
      "site_name_long": "Kennedy Space Center Historic Launch Complex 39A"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/3b/6c/d5ulGpoh_o.png",
      "mission_patch_small": "https://images2.imgbox.com/1b/40/Ouyy9Neh_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/69hhkm/bulgariasat1_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/6isph2/welcome_to_the_rspacex_bulgariasat1_official/",
      "reddit_recovery": "https://www.reddit.com/r/spacex/comments/6k3kop/b10292_bulgariasat_1_recovery_thread/",
      "reddit_media": "https://www.reddit.com/r/spacex/comments/6iuj1z/rspacex_bulgariasat1_media_thread_videos_images/",
      "presskit": "http://www.spacex.com/sites/spacex/files/bulgariasat1presskit.pdf",
      "article_link": "https://en.wikipedia.org/wiki/BulgariaSat-1",
      "wikipedia": "https://en.wikipedia.org/wiki/BulgariaSat-1",
      "video_link": "https://www.youtube.com/watch?v=Y8mLi-rRTh8",
      "youtube_id": "Y8mLi-rRTh8",
      "flickr_images": [
        "https://farm5.staticflickr.com/4216/35496028185_ac5456195f_o.jpg",
        "https://farm5.staticflickr.com/4278/35496027525_9ab9d90417_o.jpg",
        "https://farm5.staticflickr.com/4277/35496026875_fd25c46934_o.jpg",
        "https://farm5.staticflickr.com/4257/35496026065_02fe65754b_o.jpg",
        "https://farm5.staticflickr.com/4289/35491530485_5a4d0f39ae_o.jpg",
        "https://farm5.staticflickr.com/4279/35491529875_1e35ee0a1e_o.jpg",
        "https://farm5.staticflickr.com/4230/34681559323_53f05581ca_o.jpg"
      ]
    },
    "details": "Second time a booster will be reused: Second flight of B1029 after the Iridium mission of January 2017. The satellite will be the first commercial Bulgarian-owned communications satellite and it will provide television broadcasts and other communications services over southeast Europe.",
    "upcoming": false,
    "static_fire_date_utc": "2017-06-15T22:25:00.000Z",
    "static_fire_date_unix": 1497565500,
    "timeline": {
      "webcast_liftoff": 989,
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
      "maxq": 79,
      "meco": 156,
      "stage_sep": 160,
      "second_stage_ignition": 167,
      "fairing_deploy": 220,
      "first_stage_entry_burn": 379,
      "first_stage_landing": 511,
      "seco-1": 518,
      "second_stage_restart": 1628,
      "seco-2": 1693,
      "payload_deploy": 2095
    }
  },
  {
    "flight_number": 43,
    "mission_name": "Iridium NEXT Mission 2",
    "mission_id": [
      "F3364BF"
    ],
    "launch_year": "2017",
    "launch_date_unix": 1498422300,
    "launch_date_utc": "2017-06-25T20:25:00.000Z",
    "launch_date_local": "2017-06-25T13:25:00-07:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1036",
            "flight": 1,
            "block": 3,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "ASDS",
            "landing_vehicle": "JRTI"
          }
        ]
      },
      "second_stage": {
        "block": 3,
        "payloads": [
          {
            "payload_id": "Iridium NEXT 2",
            "norad_id": [
              42803,
              42804,
              42805,
              42806,
              42807,
              42808,
              42809,
              42805,
              42810,
              42811
            ],
            "reused": false,
            "customers": [
              "Iridium Communications"
            ],
            "nationality": "United States",
            "manufacturer": "Thales Alenia Space",
            "payload_type": "Satellite",
            "payload_mass_kg": 9600,
            "payload_mass_lbs": 21164,
            "orbit": "PO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 7155.804,
              "eccentricity": 0.0002316,
              "periapsis_km": 776.012,
              "apoapsis_km": 779.327,
              "inclination_deg": 86.3993,
              "period_min": 100.403,
              "lifespan_years": 15,
              "epoch": "2019-02-05T12:01:43.000Z",
              "mean_motion": 14.34217499,
              "raan": 5.5888,
              "arg_of_pericenter": 100.1995,
              "mean_anomaly": 259.9462
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
      "JRTI-2",
      "KELLYC",
      "NRCQUEST"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=IRD2"
    },
    "launch_site": {
      "site_id": "vafb_slc_4e",
      "site_name": "VAFB SLC 4E",
      "site_name_long": "Vandenberg Air Force Base Space Launch Complex 4E"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/3f/f0/7zaluW42_o.png",
      "mission_patch_small": "https://images2.imgbox.com/cd/99/lNWjUnUS_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/6bp4fj/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/6j67ti/",
      "reddit_recovery": "https://www.reddit.com/r/spacex/comments/6k16ho/",
      "reddit_media": "https://www.reddit.com/r/spacex/comments/6j7va6/",
      "presskit": "http://www.spacex.com/sites/spacex/files/iridium2presskit.pdf",
      "article_link": "https://www.space.com/37304-liftoff-spacex-second-launch-three-days.html",
      "wikipedia": "https://en.wikipedia.org/wiki/Iridium_satellite_constellation",
      "video_link": "https://www.youtube.com/watch?v=7tIwZg8F9b8",
      "youtube_id": "7tIwZg8F9b8",
      "flickr_images": [
        "https://farm5.staticflickr.com/4162/34868729603_c75aa126b5_o.jpg",
        "https://farm5.staticflickr.com/4256/35618496935_5049a27240_o.jpg",
        "https://farm5.staticflickr.com/4138/35231792310_377477e626_o.jpg",
        "https://farm5.staticflickr.com/4005/35231791780_dd15335d5e_o.jpg",
        "https://farm5.staticflickr.com/4289/35371450262_bb9c682ace_o.jpg",
        "https://farm5.staticflickr.com/4263/35499710806_f9179bea0e_o.jpg",
        "https://farm5.staticflickr.com/4256/35533873795_eb04895a60_o.jpg",
        "https://farm5.staticflickr.com/4217/35533872755_900b3e8977_o.jpg"
      ]
    },
    "details": "First flight with titanium grid fins to improve control authority and better cope with heat during re-entry.",
    "upcoming": false,
    "static_fire_date_utc": "2017-06-20T22:10:00.000Z",
    "static_fire_date_unix": 1497996600,
    "timeline": {
      "webcast_liftoff": 1197,
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
      "maxq": 69,
      "meco": 144,
      "stage_sep": 148,
      "second_stage_ignition": 155,
      "fairing_deploy": 196,
      "first_stage_entry_burn": 348,
      "first_stage_landing": 465,
      "seco-1": 544,
      "second_stage_restart": 3126,
      "seco-2": 3129,
      "payload_deploy": 3430
    }
  },
  {
    "flight_number": 44,
    "mission_name": "Intelsat 35e",
    "mission_id": [],
    "launch_year": "2017",
    "launch_date_unix": 1499297700,
    "launch_date_utc": "2017-07-05T23:35:00.000Z",
    "launch_date_local": "2017-07-05T19:35:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 3480,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1037",
            "flight": 1,
            "block": 3,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 3,
        "payloads": [
          {
            "payload_id": "Intelsat 35e",
            "norad_id": [
              42818
            ],
            "reused": false,
            "customers": [
              "Intelsat"
            ],
            "nationality": "United States",
            "manufacturer": "Boeing",
            "payload_type": "Satellite",
            "payload_mass_kg": 6761,
            "payload_mass_lbs": 14905.45,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geosynchronous",
              "longitude": -34.5,
              "semi_major_axis_km": 42165.034,
              "eccentricity": 0.0001205,
              "periapsis_km": 35781.818,
              "apoapsis_km": 35791.98,
              "inclination_deg": 0.0153,
              "period_min": 1436.112,
              "lifespan_years": 15,
              "epoch": "2019-02-04T17:19:34.000Z",
              "mean_motion": 1.00270705,
              "raan": 209.6436,
              "arg_of_pericenter": 108.1154,
              "mean_anomaly": 42.2317
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
    "ships": [],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ksc_lc_39a",
      "site_name": "KSC LC 39A",
      "site_name_long": "Kennedy Space Center Historic Launch Complex 39A"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/94/85/7GzzSMBu_o.png",
      "mission_patch_small": "https://images2.imgbox.com/ab/6f/3l4ib2QW_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/6fw4yy/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/6kt2re/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/6kt3fe/",
      "presskit": "http://www.spacex.com/sites/spacex/files/intelsat35epresskit.pdf",
      "article_link": "https://spaceflightnow.com/2017/07/06/spacex-delivers-for-intelsat-on-heavyweight-falcon-9-mission/",
      "wikipedia": "https://en.wikipedia.org/wiki/Intelsat_35e",
      "video_link": "https://www.youtube.com/watch?v=MIHVPCj25Z0",
      "youtube_id": "MIHVPCj25Z0",
      "flickr_images": [
        "https://farm5.staticflickr.com/4063/35758875505_a8559a6226_o.jpg",
        "https://farm5.staticflickr.com/4025/35758874355_5075298440_o.jpg",
        "https://farm5.staticflickr.com/4235/35359372730_df7c79797b_o.jpg",
        "https://farm5.staticflickr.com/4014/35359371840_239a658872_o.jpg",
        "https://farm5.staticflickr.com/4002/35577536822_679c68862d_o.jpg",
        "https://farm5.staticflickr.com/4259/34868730393_b778d81a71_o.jpg",
        "https://farm5.staticflickr.com/4162/34868729603_c75aa126b5_o.jpg"
      ]
    },
    "details": "Due to the constraints of sending a heavy satellite (~6,000 kg) to GTO, the rocket will fly in its expendable configuration and the first-stage booster will not be recovered.",
    "upcoming": false,
    "static_fire_date_utc": "2017-06-29T00:30:00.000Z",
    "static_fire_date_unix": 1498696200,
    "timeline": {
      "webcast_liftoff": 450,
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
      "maxq": 78,
      "meco": 162,
      "stage_sep": 166,
      "second_stage_ignition": 173,
      "fairing_deploy": 219,
      "seco-1": 517,
      "second_stage_restart": 1578,
      "seco-2": 1630,
      "payload_deploy": 1921
    }
  },
  {
    "flight_number": 45,
    "mission_name": "CRS-12",
    "mission_id": [
      "EE86F74"
    ],
    "launch_year": "2017",
    "launch_date_unix": 1502728260,
    "launch_date_utc": "2017-08-14T16:31:00.000Z",
    "launch_date_local": "2017-08-14T12:31:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1039",
            "flight": 1,
            "block": 4,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "RTLS",
            "landing_vehicle": "LZ-1"
          }
        ]
      },
      "second_stage": {
        "block": 4,
        "payloads": [
          {
            "payload_id": "CRS-12",
            "norad_id": [
              42904
            ],
            "reused": false,
            "cap_serial": "C113",
            "customers": [
              "NASA (CRS)"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Dragon 1.1",
            "payload_mass_kg": 2910,
            "payload_mass_lbs": 6415.5,
            "orbit": "ISS",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 6658.399,
              "eccentricity": 0.0116656,
              "periapsis_km": 202.59,
              "apoapsis_km": 357.938,
              "inclination_deg": 51.6336,
              "period_min": 90.118,
              "lifespan_years": null,
              "epoch": "2017-08-14T16:54:33.000Z",
              "mean_motion": 15.97894031,
              "raan": 106.677,
              "arg_of_pericenter": 47.0303,
              "mean_anomaly": 58.0005
            },
            "mass_returned_kg": 1724,
            "mass_returned_lbs": 3800,
            "flight_time_sec": 2842920,
            "cargo_manifest": "https://www.nasa.gov/sites/default/files/atoms/files/spacex_crs-12_missionoverview.pdf"
          }
        ]
      },
      "fairings": null
    },
    "ships": [
      "NRCQUEST"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=CR12"
    },
    "launch_site": {
      "site_id": "ksc_lc_39a",
      "site_name": "KSC LC 39A",
      "site_name_long": "Kennedy Space Center Historic Launch Complex 39A"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/95/31/PhgU9kf9_o.png",
      "mission_patch_small": "https://images2.imgbox.com/4e/c6/M7X1WGKk_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/6mrga2/crs12_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/6tfcio/welcome_to_the_rspacex_crs12_official_launch/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/6th2nf/rspacex_crs12_media_thread_videos_images_gifs/",
      "presskit": "http://www.spacex.com/sites/spacex/files/crs12presskit.pdf",
      "article_link": "https://spaceflightnow.com/2017/08/17/photos-falcon-9-rocket-soars-into-space-lands-back-at-cape-canaveral/",
      "wikipedia": "https://en.wikipedia.org/wiki/SpaceX_CRS-12",
      "video_link": "https://www.youtube.com/watch?v=vLxWsYx8dbo",
      "youtube_id": "vLxWsYx8dbo",
      "flickr_images": [
        "https://farm5.staticflickr.com/4352/36438808381_733603843d_o.jpg",
        "https://farm5.staticflickr.com/4434/35760634184_f75457493b_o.jpg",
        "https://farm5.staticflickr.com/4418/35741466074_327e9d0a80_o.jpg",
        "https://farm5.staticflickr.com/4414/35741465934_db82541cf3_o.jpg",
        "https://farm5.staticflickr.com/4384/35741465854_e264864537_o.jpg",
        "https://farm5.staticflickr.com/4333/35741465714_d0a8800533_o.jpg",
        "https://farm5.staticflickr.com/4397/35741465464_1d49cc1cae_o.jpg",
        "https://farm5.staticflickr.com/4354/35762350653_d94b2b5b07_o.jpg",
        "https://farm5.staticflickr.com/4353/36571921725_2a0be4ec58_o.jpg"
      ]
    },
    "details": "Dragon is expected to carry 2,349 kg (5,179 lb) of pressurized mass and 961 kg (2,119 lb) unpressurized. The external payload manifested for this flight is the CREAM cosmic-ray detector. First flight of the Falcon 9 Block 4 upgrade. Last flight of a newly-built Dragon capsule; further missions will use refurbished spacecraft.",
    "upcoming": false,
    "static_fire_date_utc": "2017-08-10T13:10:00.000Z",
    "static_fire_date_unix": 1502370600,
    "timeline": {
      "webcast_liftoff": 816,
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
      "maxq": 68,
      "meco": 145,
      "stage_sep": 148,
      "second_stage_ignition": 151,
      "first_stage_boostback_burn": 161,
      "first_stage_entry_burn": 369,
      "first_stage_landing": 463,
      "seco-1": 554,
      "dragon_separation": 614,
      "dragon_solar_deploy": 660,
      "dragon_bay_door_deploy": 8400
    }
  },
  {
    "flight_number": 46,
    "mission_name": "FormoSat-5",
    "mission_id": [],
    "launch_year": "2017",
    "launch_date_unix": 1503600600,
    "launch_date_utc": "2017-08-24T18:50:00.000Z",
    "launch_date_local": "2017-08-24T11:50:00-07:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 2520,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1038",
            "flight": 1,
            "block": 3,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "ASDS",
            "landing_vehicle": "JRTI"
          }
        ]
      },
      "second_stage": {
        "block": 3,
        "payloads": [
          {
            "payload_id": "FormoSat-5",
            "norad_id": [
              42920
            ],
            "reused": false,
            "customers": [
              "NSPO (Taiwan)"
            ],
            "nationality": "Taiwan",
            "manufacturer": "NSPO",
            "payload_type": "Satellite",
            "payload_mass_kg": 475,
            "payload_mass_lbs": 1047,
            "orbit": "SSO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "sun-synchronous",
              "longitude": null,
              "semi_major_axis_km": 7101.084,
              "eccentricity": 0.0011661,
              "periapsis_km": 714.669,
              "apoapsis_km": 731.23,
              "inclination_deg": 98.3409,
              "period_min": 99.253,
              "lifespan_years": 5,
              "epoch": "2019-02-05T10:33:16.000Z",
              "mean_motion": 14.50827238,
              "raan": 115.9778,
              "arg_of_pericenter": 59.5803,
              "mean_anomaly": 300.6543
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
      "BETTYRGAMBARELLA",
      "JRTI-2"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=FRM5"
    },
    "launch_site": {
      "site_id": "vafb_slc_4e",
      "site_name": "VAFB SLC 4E",
      "site_name_long": "Vandenberg Air Force Base Space Launch Complex 4E"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/a7/2a/s41i5C9t_o.png",
      "mission_patch_small": "https://images2.imgbox.com/f9/3a/3kH19hlj_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/6o98st",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/6vihsl/welcome_to_the_rspacex_formosat5_official_launch/",
      "reddit_recovery": "https://www.reddit.com/r/spacex/comments/6wk653/b1038_recovery_thread/",
      "reddit_media": "https://www.reddit.com/r/spacex/comments/6vhwi1/rspacex_formosat5_media_thread_videos_images_gifs/",
      "presskit": "http://www.spacex.com/sites/spacex/files/formosat5presskit.pdf",
      "article_link": "https://spaceflightnow.com/2017/08/25/taiwanese-satellite-rides-spacex-rocket-into-orbit/",
      "wikipedia": "https://en.wikipedia.org/wiki/Formosat-5",
      "video_link": "https://www.youtube.com/watch?v=J4u3ZN2g_MI",
      "youtube_id": "J4u3ZN2g_MI",
      "flickr_images": [
        "https://farm5.staticflickr.com/4434/36075361533_54b3b937dd_o.jpg",
        "https://farm5.staticflickr.com/4428/36884090115_ced8a80f14_o.jpg",
        "https://farm5.staticflickr.com/4393/36073897213_6746d2a8b2_o.jpg",
        "https://farm5.staticflickr.com/4341/36073878143_45c3ef0b93_o.jpg",
        "https://farm5.staticflickr.com/4369/35978284213_e12e5743ab_o.jpg",
        "https://farm5.staticflickr.com/4394/35978283413_145ba2ca2f_o.jpg",
        "https://farm5.staticflickr.com/4340/35978282703_5dff70fb19_o.jpg"
      ]
    },
    "details": "Formosat-5 is an Earth observation satellite of the Taiwanese space agency. The SHERPA space tug by Spaceflight Industries was removed from the cargo manifest of this mission. The satellite has a mass of only 475 kg.",
    "upcoming": false,
    "static_fire_date_utc": "2017-08-24T18:50:00.000Z",
    "static_fire_date_unix": 1503600600,
    "timeline": {
      "webcast_liftoff": 719,
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
      "maxq": 69,
      "meco": 148,
      "stage_sep": 152,
      "second_stage_ignition": 159,
      "fairing_deploy": 173,
      "first_stage_entry_burn": 525,
      "seco-1": 557,
      "first_stage_landing": 647,
      "payload_deploy": 678
    }
  },
  {
    "flight_number": 47,
    "mission_name": "Boeing X-37B OTV-5",
    "mission_id": [],
    "launch_year": "2017",
    "launch_date_unix": 1504792200,
    "launch_date_utc": "2017-09-07T13:50:00.000Z",
    "launch_date_local": "2017-09-07T09:50:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 18300,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1040",
            "flight": 1,
            "block": 4,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "RTLS",
            "landing_vehicle": "LZ-1"
          }
        ]
      },
      "second_stage": {
        "block": 4,
        "payloads": [
          {
            "payload_id": "X-37B OTV-5",
            "norad_id": [],
            "reused": false,
            "customers": [
              "USAF"
            ],
            "nationality": "United States",
            "manufacturer": "Boeing Defense",
            "payload_type": "Satellite",
            "payload_mass_kg": 4990,
            "payload_mass_lbs": 11001,
            "orbit": "LEO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": null,
              "eccentricity": null,
              "periapsis_km": null,
              "apoapsis_km": null,
              "inclination_deg": 54,
              "period_min": null,
              "lifespan_years": null,
              "epoch": null,
              "mean_motion": null,
              "raan": null,
              "arg_of_pericenter": null,
              "mean_anomaly": null
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
      "ELSBETH3",
      "GOQUEST"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=OTV5"
    },
    "launch_site": {
      "site_id": "ksc_lc_39a",
      "site_name": "KSC LC 39A",
      "site_name_long": "Kennedy Space Center Historic Launch Complex 39A"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/7e/ad/Q6iDgXq2_o.png",
      "mission_patch_small": "https://images2.imgbox.com/bb/c2/CpO3VtI7_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/6u6q1t/x37b_otv5_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/6ygmf1/rspacex_x37b_otv5_official_launch_discussion/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/6yih4g/rspacex_x37b_otv5_media_thread_videos_images_gifs/",
      "presskit": "https://www.spacex.com/sites/spacex/files/otv5_presskit.pdf",
      "article_link": "https://spaceflightnow.com/2017/09/07/spacex-beats-hurricane-with-smooth-launch-of-militarys-x-37b-spaceplane/",
      "wikipedia": "https://en.wikipedia.org/wiki/Boeing_X-37",
      "video_link": "https://www.youtube.com/watch?v=9M6Zvi-fFv4",
      "youtube_id": "9M6Zvi-fFv4",
      "flickr_images": [
        "https://farm5.staticflickr.com/4411/37087809715_08a6d9904d_o.jpg",
        "https://farm5.staticflickr.com/4384/37087808315_4dc9575d1b_o.jpg",
        "https://farm5.staticflickr.com/4363/36251815974_8b996dbbfb_o.jpg",
        "https://farm5.staticflickr.com/4374/36251814644_1a469f63ee_o.jpg",
        "https://farm5.staticflickr.com/4388/36251812554_006501315f_o.jpg",
        "https://farm5.staticflickr.com/4355/36250895284_8c24cb4232_o.jpg",
        "https://farm5.staticflickr.com/4342/36689886890_99709e6934_o.jpg",
        "https://farm5.staticflickr.com/4364/36689885100_c3c427c6bf_o.jpg"
      ]
    },
    "details": "Notable because Boeing is the primary contractor of the X-37B, which has until now been launched by ULA, a SpaceX competitor and Boeing partnership. Second flight of the Falcon 9 Block 4 upgrade.",
    "upcoming": false,
    "static_fire_date_utc": "2017-08-31T20:30:00.000Z",
    "static_fire_date_unix": 1504211400,
    "timeline": {
      "webcast_liftoff": 780,
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
      "maxq": 79,
      "meco": 143,
      "stage_sep": 146,
      "second_stage_ignition": 154,
      "first_stage_boostback_burn": 159,
      "first_stage_entry_burn": 394,
      "first_stage_landing": 494
    }
  },
  {
    "flight_number": 48,
    "mission_name": "Iridium NEXT Mission 3",
    "mission_id": [
      "F3364BF"
    ],
    "launch_year": "2017",
    "launch_date_unix": 1507552620,
    "launch_date_utc": "2017-10-09T12:37:00.000Z",
    "launch_date_local": "2017-10-09T05:37:00-07:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1041",
            "flight": 1,
            "block": 4,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "ASDS",
            "landing_vehicle": "JRTI"
          }
        ]
      },
      "second_stage": {
        "block": 4,
        "payloads": [
          {
            "payload_id": "Iridium NEXT 3",
            "norad_id": [
              42955,
              42956,
              42957,
              42958,
              42959,
              42960,
              42961,
              42962,
              42963,
              42964
            ],
            "reused": false,
            "customers": [
              "Iridium Communications"
            ],
            "nationality": "United States",
            "manufacturer": "Thales Alenia Space",
            "payload_type": "Satellite",
            "payload_mass_kg": 9600,
            "payload_mass_lbs": 21164.4,
            "orbit": "PO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 7155.797,
              "eccentricity": 0.0002145,
              "periapsis_km": 776.127,
              "apoapsis_km": 779.197,
              "inclination_deg": 86.394,
              "period_min": 100.403,
              "lifespan_years": 15,
              "epoch": "2019-02-05T12:02:26.000Z",
              "mean_motion": 14.34219667,
              "raan": 68.8054,
              "arg_of_pericenter": 108.5755,
              "mean_anomaly": 251.5674
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
      "BETTYRGAMBARELLA",
      "JRTI-2"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=IRD3"
    },
    "launch_site": {
      "site_id": "vafb_slc_4e",
      "site_name": "VAFB SLC 4E",
      "site_name_long": "Vandenberg Air Force Base Space Launch Complex 4E"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/16/0c/P2REhX5k_o.png",
      "mission_patch_small": "https://images2.imgbox.com/1c/e0/lhGbeqkh_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/6ygwxw/iridium_next_constellation_mission_3_launch/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/753e0m/iridium_next_mission_3_official_launch_discussion/",
      "reddit_recovery": "https://www.reddit.com/r/spacex/comments/75z823/b10411_recovery_thread/",
      "reddit_media": "https://www.reddit.com/r/spacex/comments/755m2z/rspacex_iridium3_media_thread_videos_images_gifs/",
      "presskit": "http://www.spacex.com/sites/spacex/files/iridium3presskit.pdf",
      "article_link": "https://spaceflightnow.com/2017/10/09/spacex-launch-adds-another-10-satellites-to-iridium-next-fleet/",
      "wikipedia": "https://en.wikipedia.org/wiki/Iridium_satellite_constellation#Next-generation_constellation",
      "video_link": "https://www.youtube.com/watch?v=SB4N4xF2B2w&feature=youtu.be",
      "youtube_id": "SB4N4xF2B2w",
      "flickr_images": [
        "https://farm5.staticflickr.com/4509/37610550066_b56bc5d743_o.jpg",
        "https://farm5.staticflickr.com/4487/37610548356_1b7d30001e_o.jpg",
        "https://farm5.staticflickr.com/4514/37610547696_9114038d60_o.jpg",
        "https://farm5.staticflickr.com/4483/37610547226_01d19395a3_o.jpg",
        "https://farm5.staticflickr.com/4504/36984625383_d7707548ec_o.jpg",
        "https://farm5.staticflickr.com/4505/36984623903_7bb6643649_o.jpg",
        "https://farm5.staticflickr.com/4445/36984622463_6f9b21929c_o.jpg",
        "https://farm5.staticflickr.com/4471/36944884234_92ddc7fb39_o.jpg"
      ]
    },
    "details": "Third of eight missions to launch Iridium's second generation constellation from VAFB",
    "upcoming": false,
    "static_fire_date_utc": "2017-10-05T13:31:00.000Z",
    "static_fire_date_unix": 1507210260,
    "timeline": {
      "webcast_liftoff": 958,
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
      "maxq": 70,
      "meco": 143,
      "stage_sep": 147,
      "second_stage_ignition": 156,
      "fairing_deploy": 189,
      "first_stage_entry_burn": 341,
      "first_stage_landing": 443,
      "seco-1": 541,
      "second_stage_restart": 3122,
      "seco-2": 3125,
      "payload_deploy": 3426
    }
  },
  {
    "flight_number": 49,
    "mission_name": "SES-11 / Echostar 105",
    "mission_id": [
      "6C42550"
    ],
    "launch_year": "2017",
    "launch_date_unix": 1507762380,
    "launch_date_utc": "2017-10-11T22:53:00.000Z",
    "launch_date_local": "2017-10-11T18:53:00-04:00",
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
            "core_serial": "B1031",
            "flight": 2,
            "block": 3,
            "gridfins": true,
            "legs": true,
            "reused": true,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "ASDS",
            "landing_vehicle": "OCISLY"
          }
        ]
      },
      "second_stage": {
        "block": 3,
        "payloads": [
          {
            "payload_id": "SES-11 / Echostar 105",
            "norad_id": [
              42967
            ],
            "reused": false,
            "customers": [
              "SES",
              "Echostar"
            ],
            "nationality": "United States",
            "manufacturer": "Airbus Defence and Space",
            "payload_type": "Satellite",
            "payload_mass_kg": 5200,
            "payload_mass_lbs": 11464,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": -105,
              "semi_major_axis_km": 42165.222,
              "eccentricity": 0.000235,
              "periapsis_km": 35777.178,
              "apoapsis_km": 35796.996,
              "inclination_deg": 0.0128,
              "period_min": 1436.121,
              "lifespan_years": 15,
              "epoch": "2019-02-03T22:04:33.000Z",
              "mean_motion": 1.00270035,
              "raan": 117.3862,
              "arg_of_pericenter": 205.6835,
              "mean_anomaly": 36.9142
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
      "GOQUEST",
      "HAWK",
      "OCISLY"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=SS11"
    },
    "launch_site": {
      "site_id": "ksc_lc_39a",
      "site_name": "KSC LC 39A",
      "site_name_long": "Kennedy Space Center Historic Launch Complex 39A"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/75/43/F11jelFx_o.png",
      "mission_patch_small": "https://images2.imgbox.com/e3/b5/UEzC560l_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/6yvn64/ses11echostar_105_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/75bw7p/ses11echostar105_official_launch_discussions/",
      "reddit_recovery": "https://www.reddit.com/r/spacex/comments/76fqz1/b10312_recovery_thread/",
      "reddit_media": "https://www.reddit.com/r/spacex/comments/75pgu5/rspacex_ses11_media_thread_videos_images_gifs/",
      "presskit": "http://www.spacex.com/sites/spacex/files/echostar105ses11presskit.pdf",
      "article_link": "https://spaceflightnow.com/2017/10/12/video-falcon-9-rocket-lifts-off-with-joint-satellite-for-ses-echostar/",
      "wikipedia": "https://en.wikipedia.org/wiki/List_of_SES_satellites",
      "video_link": "https://www.youtube.com/watch?v=iv1zeGSvhIw",
      "youtube_id": "iv1zeGSvhIw",
      "flickr_images": [
        "https://farm5.staticflickr.com/4471/37388002420_b86680c3af_o.jpg",
        "https://farm5.staticflickr.com/4497/37388002170_a267280534_o.jpg",
        "https://farm5.staticflickr.com/4455/37388001730_0869279a8d_o.jpg",
        "https://farm5.staticflickr.com/4465/36975195443_b98ed0fb24_o.jpg",
        "https://farm5.staticflickr.com/4499/36975194993_8548a53c60_o.jpg",
        "https://farm5.staticflickr.com/4482/36975194613_15bb109059_o.jpg",
        "https://farm5.staticflickr.com/4453/36975194233_5f8f45c686_o.jpg"
      ]
    },
    "details": "Nineteenth comsat to GTO, also the fourth satellite launched for SES and second for Echostar. Third time a first stage booster will be reused.",
    "upcoming": false,
    "static_fire_date_utc": "2017-10-02T20:30:00.000Z",
    "static_fire_date_unix": 1506976200,
    "timeline": {
      "webcast_liftoff": 840,
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
      "maxq": 78,
      "meco": 155,
      "stage_sep": 158,
      "second_stage_ignition": 160,
      "fairing_deploy": 220,
      "first_stage_entry_burn": 384,
      "first_stage_landing": 513,
      "seco-1": 518,
      "second_stage_restart": 1619,
      "seco-2": 1678,
      "payload_deploy": 2167
    }
  },
  {
    "flight_number": 50,
    "mission_name": "KoreaSat 5A",
    "mission_id": [],
    "launch_year": "2017",
    "launch_date_unix": 1509392040,
    "launch_date_utc": "2017-10-30T19:34:00.000Z",
    "launch_date_local": "2017-10-30T15:34:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 8640,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1042",
            "flight": 1,
            "block": 4,
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
        "block": 4,
        "payloads": [
          {
            "payload_id": "KoreaSat 5A",
            "norad_id": [
              42984
            ],
            "reused": false,
            "customers": [
              "KT Corporation"
            ],
            "nationality": "South Korea",
            "manufacturer": "Thales Alenia Space",
            "payload_type": "Satellite",
            "payload_mass_kg": 3700,
            "payload_mass_lbs": 8157.104,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": 113,
              "semi_major_axis_km": 42164.727,
              "eccentricity": 0.0001083,
              "periapsis_km": 35782.026,
              "apoapsis_km": 35791.159,
              "inclination_deg": 0.0192,
              "period_min": 1436.096,
              "lifespan_years": 15,
              "epoch": "2019-02-04T07:30:33.000Z",
              "mean_motion": 1.002718,
              "raan": 110.1542,
              "arg_of_pericenter": 175.3113,
              "mean_anomaly": 74.492
            }
          }
        ]
      },
      "fairings": {
        "reused": false,
        "recovery_attempt": true,
        "recovered": false,
        "ship": "MR STEVEN"
      }
    },
    "ships": [
      "HAWK",
      "MRSTEVEN",
      "OCISLY"
    ],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ksc_lc_39a",
      "site_name": "KSC LC 39A",
      "site_name_long": "Kennedy Space Center Historic Launch Complex 39A"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/69/f5/04lBXd2F_o.png",
      "mission_patch_small": "https://images2.imgbox.com/02/51/7NLaBm8c_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/73ttkd/koreasat_5a_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/79iuvb/rspacex_koreasat_5a_official_launch_discussion/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/79lmdu/rspacex_koreasat5a_media_thread_videos_images/",
      "presskit": "http://www.spacex.com/sites/spacex/files/koreasat5apresskit.pdf",
      "article_link": "https://spaceflightnow.com/2017/10/30/spacex-launches-and-lands-third-rocket-in-three-weeks/",
      "wikipedia": "https://en.wikipedia.org/wiki/Koreasat_5A",
      "video_link": "https://www.youtube.com/watch?v=RUjH14vhLxA",
      "youtube_id": "RUjH14vhLxA",
      "flickr_images": [
        "https://farm5.staticflickr.com/4477/38056454431_a5f40f9fd7_o.jpg",
        "https://farm5.staticflickr.com/4455/26280153979_b8016a829f_o.jpg",
        "https://farm5.staticflickr.com/4459/38056455051_79ef2b949a_o.jpg",
        "https://farm5.staticflickr.com/4466/26280153539_ecbc2b3fa9_o.jpg",
        "https://farm5.staticflickr.com/4482/26280154209_bf08d76361_o.jpg",
        "https://farm5.staticflickr.com/4493/38056455211_a4565a9cee_o.jpg"
      ]
    },
    "details": "KoreaSat 5A is a Ku-band satellite capable of providing communication services from East Africa and Central Asia to southern India, Southeast Asia, the Philippines, Guam, Korea, and Japan. The satellite will be placed in GEO at 113Â° East Longitude, and will provide services ranging from broadband internet to broadcasting services and maritime communications.",
    "upcoming": false,
    "static_fire_date_utc": "2017-10-26T16:00:00.000Z",
    "static_fire_date_unix": 1509033600,
    "timeline": {
      "webcast_liftoff": 1147,
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
      "maxq": 76,
      "meco": 153,
      "stage_sep": 156,
      "second_stage_ignition": 158,
      "fairing_deploy": 220,
      "first_stage_entry_burn": 382,
      "seco-1": 512,
      "first_stage_landing": 515,
      "second_stage_restart": 1605,
      "seco-2": 1672,
      "payload_deploy": 2138
    }
  },
  {
    "flight_number": 51,
    "mission_name": "CRS-13",
    "mission_id": [
      "EE86F74"
    ],
    "launch_year": "2017",
    "launch_date_unix": 1513352160,
    "launch_date_utc": "2017-12-15T15:36:00.000Z",
    "launch_date_local": "2017-12-15T10:36:00-05:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1035",
            "flight": 2,
            "block": 3,
            "gridfins": true,
            "legs": true,
            "reused": true,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "RTLS",
            "landing_vehicle": "LZ-1"
          }
        ]
      },
      "second_stage": {
        "block": 3,
        "payloads": [
          {
            "payload_id": "CRS-13",
            "norad_id": [
              43060
            ],
            "cap_serial": "C108",
            "reused": true,
            "customers": [
              "NASA (CRS)"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Dragon 1.1",
            "payload_mass_kg": 2205,
            "payload_mass_lbs": 4861.2,
            "orbit": "ISS",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 6657.799,
              "eccentricity": 0.0114283,
              "periapsis_km": 203.576,
              "apoapsis_km": 355.751,
              "inclination_deg": 51.6387,
              "period_min": 90.106,
              "lifespan_years": null,
              "epoch": "2017-12-15T16:01:04.000Z",
              "mean_motion": 15.98110186,
              "raan": 213.9231,
              "arg_of_pericenter": 45.5617,
              "mean_anomaly": 67.7217
            },
            "mass_returned_kg": 1859.7,
            "mass_returned_lbs": 4100,
            "flight_time_sec": 2375340,
            "cargo_manifest": "https://www.nasa.gov/sites/default/files/atoms/files/spacex_crs-13_mision_overview_low_res8.pdf"
          }
        ]
      },
      "fairings": null
    },
    "ships": [
      "NRCQUEST"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=CR13"
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/1b/30/oP1DBQ6b_o.png",
      "mission_patch_small": "https://images2.imgbox.com/ea/12/8vVzlOeL_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/7bxg5a/crs13_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/7j725w/rspacex_crs13_official_launch_discussion_updates/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/7j6oxz/rspacex_crs13_media_thread_videos_images_gifs/",
      "presskit": "http://www.spacex.com/sites/spacex/files/crs13presskit12_11.pdf",
      "article_link": "https://spaceflightnow.com/2017/12/15/spacexs-50th-falcon-rocket-launch-kicks-off-station-resupply-mission/",
      "wikipedia": "https://en.wikipedia.org/wiki/SpaceX_CRS-13",
      "video_link": "https://www.youtube.com/watch?v=OPHbqY9LHCs",
      "youtube_id": "OPHbqY9LHCs",
      "flickr_images": [
        "https://farm5.staticflickr.com/4591/38372264594_8140bd943d_o.png",
        "https://farm5.staticflickr.com/4546/39051469552_13703e6b2e_o.jpg",
        "https://farm5.staticflickr.com/4682/39051469662_55c55150c0_o.jpg",
        "https://farm5.staticflickr.com/4565/25215551218_2597838c1a_o.jpg",
        "https://farm5.staticflickr.com/4680/39051469812_b6f802fc9d_o.jpg",
        "https://farm5.staticflickr.com/4517/27304331429_59b9d6c1d4_o.jpg"
      ]
    },
    "details": "Will reuse the Dragon capsule previously flown on CRS-6 and will reuse the booster from CRS-11.",
    "upcoming": false,
    "static_fire_date_utc": "2017-12-06T20:00:00.000Z",
    "static_fire_date_unix": 1512590400,
    "timeline": {
      "webcast_liftoff": 959,
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
      "maxq": 78,
      "meco": 141,
      "stage_sep": 145,
      "second_stage_ignition": 153,
      "first_stage_boostback_burn": 158,
      "first_stage_entry_burn": 367,
      "first_stage_landing": 466,
      "seco-1": 540,
      "dragon_separation": 600,
      "dragon_solar_deploy": 660,
      "dragon_bay_door_deploy": 8400
    }
  },
  {
    "flight_number": 52,
    "mission_name": "Iridium NEXT Mission 4",
    "mission_id": [
      "F3364BF"
    ],
    "launch_year": "2017",
    "launch_date_unix": 1513992443,
    "launch_date_utc": "2017-12-23T01:27:23.000Z",
    "launch_date_local": "2017-12-22T17:27:23-08:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1036",
            "flight": 2,
            "block": 3,
            "gridfins": true,
            "legs": false,
            "reused": true,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "Ocean",
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 3,
        "payloads": [
          {
            "payload_id": "Iridium NEXT 4",
            "norad_id": [
              43070,
              43071,
              43072,
              43073,
              43074,
              43075,
              43076,
              43077,
              43078,
              43079
            ],
            "reused": false,
            "customers": [
              "Iridium Communications"
            ],
            "nationality": "United States",
            "manufacturer": "Thales Alenia Space",
            "payload_type": "Satellite",
            "payload_mass_kg": 9600,
            "payload_mass_lbs": 21164.38,
            "orbit": "PO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 7155.81,
              "eccentricity": 0.0002404,
              "periapsis_km": 775.954,
              "apoapsis_km": 779.395,
              "inclination_deg": 86.3987,
              "period_min": 100.403,
              "lifespan_years": 15,
              "epoch": "2019-02-05T11:34:18.000Z",
              "mean_motion": 14.34215916,
              "raan": 5.6109,
              "arg_of_pericenter": 75.6268,
              "mean_anomaly": 284.5194
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
      "MRSTEVEN"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/result?code=IRD4"
    },
    "launch_site": {
      "site_id": "vafb_slc_4e",
      "site_name": "VAFB SLC 4E",
      "site_name_long": "Vandenberg Air Force Base Space Launch Complex 4E"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/ee/c2/x8q8XiTg_o.png",
      "mission_patch_small": "https://images2.imgbox.com/cb/4b/n6GTX4PI_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/7cgts7/iridium_next_constellation_mission_4_launch/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/7li8y2/rspacex_iridium_next_4_official_launch_discussion/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/7litv2/rspacex_iridium4_media_thread_videos_images_gifs/",
      "presskit": "http://www.spacex.com/sites/spacex/files/iridium4presskit.pdf",
      "article_link": "https://spaceflightnow.com/2017/12/23/spacex-launch-dazzles-delivering-10-more-satellites-for-iridium/",
      "wikipedia": "https://en.wikipedia.org/wiki/Iridium_satellite_constellation#Next-generation_constellation",
      "video_link": "https://www.youtube.com/watch?v=wtdjCwo6d3Q",
      "youtube_id": "wtdjCwo6d3Q",
      "flickr_images": [
        "https://farm5.staticflickr.com/4695/25557986177_2d315f4c11_o.jpg",
        "https://farm5.staticflickr.com/4735/25377631178_d28e0a9141_o.jpg",
        "https://farm5.staticflickr.com/4733/25377628928_a79bb43a31_o.jpg",
        "https://farm5.staticflickr.com/4732/25377628288_361f551d34_o.jpg",
        "https://farm5.staticflickr.com/4598/39244105581_eeb76c8ed2_o.jpg",
        "https://farm5.staticflickr.com/4728/24381830217_a49ae2100f_o.jpg"
      ]
    },
    "details": "Reusing the booster first used on Iridium-2, but will be flying expendable.",
    "upcoming": false,
    "static_fire_date_utc": "2017-12-17T21:00:00.000Z",
    "static_fire_date_unix": 1513544400,
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
      "maxq": 74,
      "meco": 153,
      "stage_sep": 156,
      "second_stage_ignition": 158,
      "fairing_deploy": 191,
      "seco-1": 540,
      "second_stage_restart": 3114,
      "seco-2": 3125,
      "payload_deploy": 3425
    }
  },
  {
    "flight_number": 53,
    "mission_name": "ZUMA",
    "mission_id": [],
    "launch_year": "2018",
    "launch_date_unix": 1515373200,
    "launch_date_utc": "2018-01-08T01:00:00.000Z",
    "launch_date_local": "2018-01-07T20:00:00-05:00",
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
            "core_serial": "B1043",
            "flight": 1,
            "block": 4,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "RTLS",
            "landing_vehicle": "LZ-1"
          }
        ]
      },
      "second_stage": {
        "block": 4,
        "payloads": [
          {
            "payload_id": "ZUMA",
            "norad_id": [],
            "reused": false,
            "customers": [
              "Northrop Grumman"
            ],
            "nationality": "United States",
            "manufacturer": "Northrop Grumman",
            "payload_type": "Satellite",
            "payload_mass_kg": null,
            "payload_mass_lbs": null,
            "orbit": "LEO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": null,
              "eccentricity": null,
              "periapsis_km": null,
              "apoapsis_km": null,
              "inclination_deg": 51,
              "period_min": null,
              "lifespan_years": null,
              "epoch": null,
              "mean_motion": null,
              "raan": null,
              "arg_of_pericenter": null,
              "mean_anomaly": null
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
    "ships": [],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/result?code=ZUMA"
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/26/99/ppTFXiLw_o.png",
      "mission_patch_small": "https://images2.imgbox.com/e8/30/yMNPvCci_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/7895bo/zuma_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/7oqjf0/rspacex_zuma_official_launch_discussion_updates/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/7orksl/rspacex_zuma_media_thread_videos_images_gifs/",
      "presskit": "http://www.spacex.com/sites/spacex/files/zumapresskit.pdf",
      "article_link": "https://spaceflightnow.com/2018/01/08/spacex-kicks-off-ambitious-2018-schedule-with-launch-for-u-s-government/",
      "wikipedia": "https://en.wikipedia.org/wiki/Zuma_(satellite)",
      "video_link": "https://www.youtube.com/watch?v=0PWu3BRxn60",
      "youtube_id": "0PWu3BRxn60",
      "flickr_images": [
        "https://farm5.staticflickr.com/4751/39557026242_384d287045_o.jpg",
        "https://farm5.staticflickr.com/4674/39556549372_810396618d_o.jpg",
        "https://farm5.staticflickr.com/4661/39556548902_f66c7be90d_o.jpg",
        "https://farm5.staticflickr.com/4607/39585580001_8b21846eab_o.jpg",
        "https://farm5.staticflickr.com/4754/39585578201_a67ab9b9a8_o.jpg",
        "https://farm5.staticflickr.com/4603/39585575631_216cc035f4_o.jpg"
      ]
    },
    "details": "Originally planned for mid-November 2017, the mission was delayed due to test results from the fairing of another customer. First-stage booster will attempt landing at LZ-1",
    "upcoming": false,
    "static_fire_date_utc": "2017-11-11T23:00:00.000Z",
    "static_fire_date_unix": 1510441200,
    "timeline": {
      "webcast_liftoff": 840,
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
      "maxq": 70,
      "meco": 136,
      "stage_sep": 139,
      "second_stage_ignition": 141,
      "fairing_deploy": 188,
      "first_stage_entry_burn": 369,
      "first_stage_landing": 471
    }
  },
  {
    "flight_number": 54,
    "mission_name": "SES-16 / GovSat-1",
    "mission_id": [
      "6C42550"
    ],
    "launch_year": "2018",
    "launch_date_unix": 1517433900,
    "launch_date_utc": "2018-01-31T21:25:00.000Z",
    "launch_date_local": "2018-01-31T16:25:00-05:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 8460,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1032",
            "flight": 2,
            "block": 3,
            "gridfins": true,
            "legs": true,
            "reused": true,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "Ocean",
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 3,
        "payloads": [
          {
            "payload_id": "GovSat-1",
            "norad_id": [
              43178
            ],
            "reused": false,
            "customers": [
              "GovSat"
            ],
            "nationality": "Luxembourg",
            "manufacturer": "Orbital ATK",
            "payload_type": "Satellite",
            "payload_mass_kg": 4230,
            "payload_mass_lbs": 9325.6,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": 21.5,
              "semi_major_axis_km": null,
              "eccentricity": null,
              "periapsis_km": null,
              "apoapsis_km": null,
              "inclination_deg": null,
              "period_min": null,
              "lifespan_years": 15,
              "epoch": null,
              "mean_motion": null,
              "raan": null,
              "arg_of_pericenter": null,
              "mean_anomaly": null
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
      "GOQUEST"
    ],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/42/0a/LAupFe3L_o.png",
      "mission_patch_small": "https://images2.imgbox.com/95/ec/FoFpPft0_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/7olw86/govsat1_ses16_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/7tvtbh/rspacex_govsat1_official_launch_discussion/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/7tzzwy/rspacex_govsat1_media_thread_videos_images_gifs/",
      "presskit": "http://www.spacex.com/sites/spacex/files/govsat1presskit.pdf",
      "article_link": "https://spaceflightnow.com/2018/01/31/spacex-rocket-flies-on-60th-anniversary-of-first-u-s-satellite-launch/",
      "wikipedia": "https://en.wikipedia.org/wiki/List_of_SES_satellites#SES_Fleet",
      "video_link": "https://www.youtube.com/watch?v=ScYUA51-POQ",
      "youtube_id": "ScYUA51-POQ",
      "flickr_images": [
        "https://farm5.staticflickr.com/4721/40026315981_f16a7cd32a_o.jpg",
        "https://farm5.staticflickr.com/4708/40026316291_0b3aef9d8d_o.jpg",
        "https://farm5.staticflickr.com/4652/39128355655_3eefa0d583_o.jpg",
        "https://farm5.staticflickr.com/4741/39128355825_7c4166dbbe_o.jpg",
        "https://farm5.staticflickr.com/4609/39128355355_17381fc00e_o.jpg"
      ]
    },
    "details": "Reused booster from the classified NROL-76 mission in May 2017. Following a successful experimental ocean landing that used three engines, the booster unexpectedly remained intact; Elon Musk stated in a tweet that SpaceX will attempt to tow the booster to shore.",
    "upcoming": false,
    "static_fire_date_utc": "2018-01-26T15:27:00.000Z",
    "static_fire_date_unix": 1516980420,
    "timeline": {
      "webcast_liftoff": 746,
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
      "maxq": 78,
      "meco": 158,
      "stage_sep": 160,
      "second_stage_ignition": 161,
      "fairing_deploy": 224,
      "seco-1": 515,
      "second_stage_restart": 1600,
      "seco-2": 1668,
      "payload_deploy": 1939
    }
  },
  {
    "flight_number": 55,
    "mission_name": "Falcon Heavy Test Flight",
    "mission_id": [],
    "launch_year": "2018",
    "launch_date_unix": 1517949900,
    "launch_date_utc": "2018-02-06T20:45:00.000Z",
    "launch_date_local": "2018-02-06T15:45:00-05:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 9000,
    "rocket": {
      "rocket_id": "falconheavy",
      "rocket_name": "Falcon Heavy",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1033",
            "flight": 1,
            "block": 3,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": false,
            "landing_intent": true,
            "landing_type": "ASDS",
            "landing_vehicle": "OCISLY"
          },
          {
            "core_serial": "B1025",
            "flight": 2,
            "block": 2,
            "gridfins": true,
            "legs": true,
            "reused": true,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "RTLS",
            "landing_vehicle": "LZ-2"
          },
          {
            "core_serial": "B1023",
            "flight": 2,
            "block": 2,
            "gridfins": true,
            "legs": true,
            "reused": true,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "RTLS",
            "landing_vehicle": "LZ-1"
          }
        ]
      },
      "second_stage": {
        "block": 3,
        "payloads": [
          {
            "payload_id": "Tesla Roadster",
            "norad_id": [
              43205
            ],
            "reused": false,
            "customers": [
              "SpaceX"
            ],
            "nationality": "United States",
            "manufacturer": "Tesla",
            "payload_type": "Satellite",
            "payload_mass_kg": 1350,
            "payload_mass_lbs": 2976.2,
            "orbit": "HCO",
            "orbit_params": {
              "reference_system": "heliocentric",
              "regime": null,
              "longitude": null,
              "semi_major_axis_km": 9943.766,
              "eccentricity": 0.3404246,
              "periapsis_km": 180.528,
              "apoapsis_km": 6950.733,
              "inclination_deg": 29.0185,
              "period_min": 164.469,
              "lifespan_years": 3500000,
              "epoch": "2018-02-06T22:36:19.000Z",
              "mean_motion": 8.75540848,
              "raan": 287.358,
              "arg_of_pericenter": 180.027,
              "mean_anomaly": 180.584
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
      "GOSEARCHER",
      "HAWK",
      "OCISLY"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/result?code=FHD1"
    },
    "launch_site": {
      "site_id": "ksc_lc_39a",
      "site_name": "KSC LC 39A",
      "site_name_long": "Kennedy Space Center Historic Launch Complex 39A"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/33/1a/ujrnfkna_o.png",
      "mission_patch_small": "https://images2.imgbox.com/22/5f/jAAULKc3_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/7hjp03/falcon_heavy_demo_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/7vg63x/rspacex_falcon_heavy_test_flight_official_launch/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/7vimtm/rspacex_falcon_heavy_test_flight_media_thread/",
      "presskit": "http://www.spacex.com/sites/spacex/files/falconheavypresskit_v1.pdf",
      "article_link": "https://spaceflightnow.com/2018/02/07/spacex-debuts-worlds-most-powerful-rocket-sends-tesla-toward-the-asteroid-belt/",
      "wikipedia": "https://en.wikipedia.org/wiki/Elon_Musk%27s_Tesla_Roadster",
      "video_link": "https://www.youtube.com/watch?v=wbSwFU6tY1c",
      "youtube_id": "wbSwFU6tY1c",
      "flickr_images": [
        "https://farm5.staticflickr.com/4745/40110304192_b0165b7785_o.jpg",
        "https://farm5.staticflickr.com/4676/40110297852_6173e5cae6_o.jpg",
        "https://farm5.staticflickr.com/4615/40143096241_0324643b5e_o.jpg",
        "https://farm5.staticflickr.com/4702/40110298232_4e9c412936_o.jpg",
        "https://farm5.staticflickr.com/4610/39337245575_41d760caef_o.jpg",
        "https://farm5.staticflickr.com/4654/25254688767_59603ff06c_o.jpg",
        "https://farm5.staticflickr.com/4627/40126462801_d54b4f00be_o.jpg",
        "https://farm5.staticflickr.com/4760/40126462231_cdf00ef431_o.jpg",
        "https://farm5.staticflickr.com/4655/40202121122_5d29cfe2ac_o.jpg",
        "https://farm5.staticflickr.com/4631/39337245145_5f5630a66a_o.jpg",
        "https://farm5.staticflickr.com/4650/40126461851_14b93ec9d7_o.jpg",
        "https://farm5.staticflickr.com/4711/40126461411_b1ed283d45_o.jpg",
        "https://farm5.staticflickr.com/4696/40126460511_7b5cc64871_o.jpg",
        "https://farm5.staticflickr.com/4589/38583831555_9ae89f5c10_o.jpg",
        "https://farm5.staticflickr.com/4682/38583829815_e01509d1a7_o.jpg",
        "https://farm5.staticflickr.com/4731/39225582801_80594d5d91_o.jpg",
        "https://farm5.staticflickr.com/4641/39225582421_7aa0c65851_o.jpg",
        "https://farm5.staticflickr.com/4643/27449864329_d2424bc280_o.jpg",
        "https://farm5.staticflickr.com/4681/39225582171_137a4c75e7_o.jpg",
        "https://farm5.staticflickr.com/4644/39225582351_ac6aba2533_o.jpg",
        "https://farm5.staticflickr.com/4587/27449863849_709e135a98_o.jpg"
      ]
    },
    "details": "The launch was a success, and the side boosters landed simultaneously at adjacent ground pads. Drone ship landing of the central core failed. Final burn to heliocentric mars-earth orbit was successful after the second stage and payload passed through the Van Allen belts.",
    "upcoming": false,
    "static_fire_date_utc": "2018-01-24T17:30:00.000Z",
    "static_fire_date_unix": 1516815000,
    "timeline": {
      "webcast_liftoff": 1320,
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
      "maxq": 66,
      "beco": 149,
      "side_core_sep": 153,
      "side_core_boostback": 170,
      "meco": 184,
      "center_stage_sep": 187,
      "second_stage_ignition": 195,
      "center_core_boostback": 204,
      "fairing_deploy": 229,
      "side_core_entry_burn": 401,
      "center_core_entry_burn": 407,
      "side_core_landing": 478,
      "center_core_landing": 499,
      "seco-1": 511,
      "second_stage_restart": 1702,
      "seco-2": 1732
    }
  },
  {
    "flight_number": 56,
    "mission_name": "Paz / Starlink Demo",
    "mission_id": [],
    "launch_year": "2018",
    "launch_date_unix": 1519309020,
    "launch_date_utc": "2018-02-22T14:17:00.000Z",
    "launch_date_local": "2018-02-22T06:17:00-08:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1038",
            "flight": 2,
            "block": 3,
            "gridfins": true,
            "legs": false,
            "reused": true,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 3,
        "payloads": [
          {
            "payload_id": "Paz",
            "norad_id": [
              43215
            ],
            "reused": false,
            "customers": [
              "HisdeSAT"
            ],
            "nationality": "Spain",
            "manufacturer": "Airbus Defence and Space",
            "payload_type": "Satellite",
            "payload_mass_kg": 1350,
            "payload_mass_lbs": 2976.2,
            "orbit": "SSO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "sun-synchronous",
              "longitude": null,
              "semi_major_axis_km": 6886.531,
              "eccentricity": 0.0001606,
              "periapsis_km": 507.29,
              "apoapsis_km": 509.502,
              "inclination_deg": 97.4454,
              "period_min": 94.789,
              "lifespan_years": 15,
              "epoch": "2019-02-05T12:34:39.000Z",
              "mean_motion": 15.19154378,
              "raan": 45.3989,
              "arg_of_pericenter": 79.7938,
              "mean_anomaly": 74.0543
            }
          },
          {
            "payload_id": "Tintin A & B",
            "norad_id": [
              43216,
              43217
            ],
            "reused": false,
            "customers": [
              "SpaceX"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Satellite",
            "payload_mass_kg": 800,
            "payload_mass_lbs": 1763.7,
            "orbit": "SSO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 6884.537,
              "eccentricity": 0.001378,
              "periapsis_km": 496.915,
              "apoapsis_km": 515.889,
              "inclination_deg": 97.4539,
              "period_min": 94.748,
              "lifespan_years": 1,
              "epoch": "2019-02-05T03:00:05.000Z",
              "mean_motion": 15.19814483,
              "raan": 45.6419,
              "arg_of_pericenter": 139.7219,
              "mean_anomaly": 220.5039
            }
          }
        ]
      },
      "fairings": {
        "reused": false,
        "recovery_attempt": true,
        "recovered": false,
        "ship": "MR STEVEN"
      }
    },
    "ships": [
      "MRSTEVEN"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/result?code=PAZ1"
    },
    "launch_site": {
      "site_id": "vafb_slc_4e",
      "site_name": "VAFB SLC 4E",
      "site_name_long": "Vandenberg Air Force Base Space Launch Complex 4E"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/f1/b8/HAXSg9rr_o.png",
      "mission_patch_small": "https://images2.imgbox.com/f9/05/I9duWQ6v_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/7qnflk/paz_microsat2a_2b_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/7y0grt/rspacex_paz_official_launch_discussion_updates/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/7zdvop/rspacex_paz_media_thread_videos_images_gifs/",
      "presskit": "http://www.spacex.com/sites/spacex/files/paz_press_kit_2.21.pdf",
      "article_link": "https://spaceflightnow.com/2018/02/22/recycled-spacex-rocket-boosts-paz-radar-satellite-first-starlink-testbeds-into-orbit/",
      "wikipedia": "https://en.wikipedia.org/wiki/Paz_(satellite)",
      "video_link": "https://www.youtube.com/watch?v=-p-PToD2URA",
      "youtube_id": "-p-PToD2URA",
      "flickr_images": [
        "https://farm5.staticflickr.com/4768/25557986627_f3cc243afb_o.jpg",
        "https://farm5.staticflickr.com/4631/25557986367_6339dd8f1d_o.jpg",
        "https://farm5.staticflickr.com/4650/25557987937_585c15c34d_o.jpg",
        "https://farm5.staticflickr.com/4695/39718494114_6523797470_o.jpg",
        "https://farm5.staticflickr.com/4655/39533211685_5e0ceb78ef_o.jpg"
      ]
    },
    "details": "First flight with fairing 2.0. Will also carry two SpaceX test satellites for the upcoming Starlink constellation.",
    "upcoming": false,
    "static_fire_date_utc": "2018-02-11T18:23:00.000Z",
    "static_fire_date_unix": 1518373380,
    "timeline": {
      "webcast_liftoff": 1017,
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
      "maxq": 77,
      "meco": 149,
      "stage_sep": 153,
      "second_stage_ignition": 160,
      "fairing_deploy": 176,
      "seco-1": 538,
      "payload_deploy": 658
    }
  },
  {
    "flight_number": 57,
    "mission_name": "Hispasat 30W-6",
    "mission_id": [],
    "launch_year": "2018",
    "launch_date_unix": 1520314380,
    "launch_date_utc": "2018-03-06T05:33:00.000Z",
    "launch_date_local": "2018-03-06T00:33:00-05:00",
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
            "core_serial": "B1044",
            "flight": 1,
            "block": 4,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 4,
        "payloads": [
          {
            "payload_id": "Hispasat 30W-6",
            "norad_id": [
              43228
            ],
            "reused": false,
            "customers": [
              "Hispasat"
            ],
            "nationality": "Spain",
            "manufacturer": "SSL",
            "payload_type": "Satellite",
            "payload_mass_kg": 6092,
            "payload_mass_lbs": 13430.6,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": -30,
              "semi_major_axis_km": 42164.852,
              "eccentricity": 0.0004455,
              "periapsis_km": 35767.933,
              "apoapsis_km": 35805.502,
              "inclination_deg": 0.0399,
              "period_min": 1436.103,
              "lifespan_years": 15,
              "epoch": "2019-02-04T17:01:38.000Z",
              "mean_motion": 1.00271354,
              "raan": 52.981,
              "arg_of_pericenter": 288.0157,
              "mean_anomaly": 18.9563
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
    "ships": [],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/86/73/dycVqz0C_o.png",
      "mission_patch_small": "https://images2.imgbox.com/87/5d/ZDr6l98A_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/7r5pyn/hispasat_30w6_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/7r5pyn/hispasat_30w6_launch_campaign_thread/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/825asx/rspacex_hispasat_30w6_media_thread_videos_images/",
      "presskit": "http://www.spacex.com/sites/spacex/files/hispasat30w6_presskit.pdf",
      "article_link": "https://spaceflightnow.com/2018/03/06/hefty-hispasat-satellite-rides-spacex-rocket-into-orbit/",
      "wikipedia": "https://en.wikipedia.org/wiki/Hispasat_30W-6",
      "video_link": "https://www.youtube.com/watch?v=Kpfrp-GMKKM",
      "youtube_id": "Kpfrp-GMKKM",
      "flickr_images": [
        "https://farm5.staticflickr.com/4753/25790223907_36e7b59efa_o.jpg",
        "https://farm5.staticflickr.com/4666/38850799080_e17426795c_o.jpg",
        "https://farm5.staticflickr.com/4758/40660917561_daa8efea04_o.jpg",
        "https://farm5.staticflickr.com/4622/39951085264_b5deeed6c9_o.jpg",
        "https://farm5.staticflickr.com/4772/39951085474_77be77c227_o.jpg"
      ]
    },
    "details": "Launched with landing legs and titanium grid fins. Did not attempt a landing due to 'unfavorable weather conditions in the recovery area'.",
    "upcoming": false,
    "static_fire_date_utc": "2018-02-21T03:46:00.000Z",
    "static_fire_date_unix": 1519184760,
    "timeline": {
      "webcast_liftoff": 719,
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
      "maxq": 78,
      "meco": 155,
      "stage_sep": 157,
      "second_stage_ignition": 159,
      "fairing_deploy": 219,
      "seco-1": 519,
      "second_stage_restart": 1598,
      "seco-2": 1653,
      "payload_deploy": 1971
    }
  },
  {
    "flight_number": 58,
    "mission_name": "Iridium NEXT Mission 5",
    "mission_id": [
      "F3364BF"
    ],
    "launch_year": "2018",
    "launch_date_unix": 1522419231,
    "launch_date_utc": "2018-03-30T14:13:51.000Z",
    "launch_date_local": "2018-03-30T07:13:51-08:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1041",
            "flight": 2,
            "block": 4,
            "gridfins": true,
            "legs": true,
            "reused": true,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 4,
        "payloads": [
          {
            "payload_id": "Iridium NEXT 5",
            "norad_id": [
              43249,
              43250,
              43251,
              43252,
              43253,
              43254,
              43255,
              43256,
              43257,
              43258
            ],
            "reused": false,
            "customers": [
              "Iridium Communications"
            ],
            "nationality": "United States",
            "manufacturer": "Thales Alenia Space",
            "payload_type": "Satellite",
            "payload_mass_kg": 9600,
            "payload_mass_lbs": 21164.38,
            "orbit": "PO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 7155.796,
              "eccentricity": 0.0002605,
              "periapsis_km": 775.797,
              "apoapsis_km": 779.525,
              "inclination_deg": 86.4001,
              "period_min": 100.403,
              "lifespan_years": 15,
              "epoch": "2019-02-05T08:26:42.000Z",
              "mean_motion": 14.34219963,
              "raan": 334.0911,
              "arg_of_pericenter": 84.1949,
              "mean_anomaly": 275.9543
            }
          }
        ]
      },
      "fairings": {
        "reused": false,
        "recovery_attempt": true,
        "recovered": false,
        "ship": "MR STEVEN"
      }
    },
    "ships": [],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=IRD5"
    },
    "launch_site": {
      "site_id": "vafb_slc_4e",
      "site_name": "VAFB SLC 4E",
      "site_name_long": "Vandenberg Air Force Base Space Launch Complex 4E"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/6e/32/3hj6BIWx_o.png",
      "mission_patch_small": "https://images2.imgbox.com/2f/36/Bn1RX3aO_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/82njj5/iridium_next_constellation_mission_5_launch/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/88184i/rspacex_iridium_next_5_official_launch_discussion/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/88114l/rspacex_iridium5_media_thread_videos_images_gifs/",
      "presskit": "https://www.spacex.com/sites/spacex/files/iridium-5_press_kit_2018.pdf",
      "article_link": "https://spaceflightnow.com/2018/03/30/iridium-messaging-network-gets-another-boost-from-spacex/",
      "wikipedia": "https://en.wikipedia.org/wiki/Iridium_satellite_constellation#Next-generation_constellation",
      "video_link": "https://www.youtube.com/watch?v=mp0TW8vkCLg",
      "youtube_id": "mp0TW8vkCLg",
      "flickr_images": [
        "https://farm1.staticflickr.com/791/40227113515_da97986607_o.jpg",
        "https://farm1.staticflickr.com/788/27248936158_2eaf1a98b3_o.jpg",
        "https://farm1.staticflickr.com/864/40227112595_c34a1cf8d1_o.jpg",
        "https://farm1.staticflickr.com/806/41121608121_8f0b886f9d_o.jpg",
        "https://farm1.staticflickr.com/809/41121608541_cdfec6a849_o.jpg",
        "https://farm1.staticflickr.com/822/40227112875_ec3c5df585_o.jpg"
      ]
    },
    "details": "Fifth Iridium NEXT mission to deploy ten Iridium NEXT satellites. Reused booster from third Iridium flight, and although controlled descent was performed, the booster was expended into the ocean. SpaceX planned a second recovery attempt of one half of the fairing using the specially modified boat Mr. Steven. However, the fairing's parafoil twisted during the recovery, which led to water impact at high speed",
    "upcoming": false,
    "static_fire_date_utc": "2018-03-25T12:23:00.000Z",
    "static_fire_date_unix": 1521980580,
    "timeline": {
      "webcast_liftoff": 1313,
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
      "maxq": 76,
      "meco": 154,
      "stage_sep": 157,
      "second_stage_ignition": 159,
      "fairing_deploy": 208,
      "seco-1": 542,
      "second_stage_restart": 3125,
      "seco-2": 3136,
      "payload_deploy": 3436
    }
  },
  {
    "flight_number": 59,
    "mission_name": "CRS-14",
    "mission_id": [
      "EE86F74"
    ],
    "launch_year": "2018",
    "launch_date_unix": 1522701041,
    "launch_date_utc": "2018-04-02T20:30:41.000Z",
    "launch_date_local": "2018-04-02T16:30:41-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1039",
            "flight": 2,
            "block": 4,
            "gridfins": true,
            "legs": true,
            "reused": true,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 4,
        "payloads": [
          {
            "payload_id": "CRS-14",
            "norad_id": [
              43267
            ],
            "cap_serial": "C110",
            "reused": true,
            "customers": [
              "NASA (CRS)"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Dragon 1.1",
            "payload_mass_kg": 2760,
            "payload_mass_lbs": 6084.7,
            "orbit": "ISS",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 6658.324,
              "eccentricity": 0.011476,
              "periapsis_km": 203.778,
              "apoapsis_km": 356.6,
              "inclination_deg": 51.6437,
              "period_min": 90.117,
              "lifespan_years": null,
              "epoch": "2018-04-02T20:54:48.000Z",
              "mean_motion": 15.97921108,
              "raan": 34.3281,
              "arg_of_pericenter": 48.6187,
              "mean_anomaly": 62.8495
            },
            "mass_returned_kg": 1743,
            "mass_returned_lbs": 3843,
            "flight_time_sec": 3862140,
            "cargo_manifest": "https://www.nasa.gov/sites/default/files/atoms/files/spacex_crs-14_mision_overview_high_res.pdf"
          }
        ]
      },
      "fairings": null
    },
    "ships": [
      "NRCQUEST"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=CR14"
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/4c/3a/VGGRo5PT_o.png",
      "mission_patch_small": "https://images2.imgbox.com/e7/bf/WzMju1cP_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/82op7a/crs14_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/88s8a7/rspacex_crs14_official_launch_discussion_updates/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/88l52i/rspacex_crs14_media_thread_videos_images_gifs/",
      "presskit": "http://www.spacex.com/sites/spacex/files/crs-14presskit2018.pdf",
      "article_link": "https://spaceflightnow.com/2018/04/02/spacex-supply-ship-departs-cape-canaveral-for-space-station/",
      "wikipedia": "https://en.wikipedia.org/wiki/SpaceX_CRS-14",
      "video_link": "https://www.youtube.com/watch?v=BPQHG-LevZM",
      "youtube_id": "BPQHG-LevZM",
      "flickr_images": [
        "https://farm1.staticflickr.com/819/26326005987_c3aec29db5_o.jpg",
        "https://farm1.staticflickr.com/791/40303273215_4926c917c4_o.jpg",
        "https://farm1.staticflickr.com/867/26326007227_39e71e6775_o.jpg"
      ]
    },
    "details": "The launch used a refurbished booster (from CRS-12) for the 11th time, and a refurbished capsule (C110 from CRS-8) for the third time. External payloads include a materials research platform MISSE-FF phase 3 of the Robotic Refueling Mission TSIS, heliophysics sensor several crystallization experiments, and the RemoveDebris spacecraft aimed at space junk removal. The booster was expended in order to test a new landing profile.",
    "upcoming": false,
    "static_fire_date_utc": "2018-03-28T15:52:00.000Z",
    "static_fire_date_unix": 1522252320,
    "timeline": {
      "webcast_liftoff": 1195,
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
      "maxq": 68,
      "meco": 161,
      "stage_sep": 165,
      "second_stage_ignition": 172,
      "seco-1": 543,
      "dragon_separation": 603,
      "dragon_solar_deploy": 660,
      "dragon_bay_door_deploy": 8400
    }
  },
  {
    "flight_number": 60,
    "mission_name": "TESS",
    "mission_id": [],
    "launch_year": "2018",
    "launch_date_unix": 1524091860,
    "launch_date_utc": "2018-04-18T22:51:00.000Z",
    "launch_date_local": "2018-04-18T18:51:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 30,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1045",
            "flight": 1,
            "block": 4,
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
        "block": 4,
        "payloads": [
          {
            "payload_id": "TESS",
            "norad_id": [
              43435
            ],
            "reused": false,
            "customers": [
              "NASA"
            ],
            "nationality": "United States",
            "manufacturer": "Orbital ATK",
            "payload_type": "Satellite",
            "payload_mass_kg": 350,
            "payload_mass_lbs": 772,
            "orbit": "HEO",
            "orbit_params": {
              "reference_system": "highly-elliptical",
              "regime": "high-earth",
              "longitude": null,
              "semi_major_axis_km": 143549.447,
              "eccentricity": 0.943685,
              "periapsis_km": 1705.852,
              "apoapsis_km": 272636.772,
              "inclination_deg": 28.6882,
              "period_min": 9021.152,
              "lifespan_years": 10,
              "epoch": "2018-04-25T05:40:13.000Z",
              "mean_motion": 0.15962484,
              "raan": 36.536,
              "arg_of_pericenter": 230.9609,
              "mean_anomaly": 356.5485
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
      "flight_club": "https://www.flightclub.io/results/?code=TESS"
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/7d/2c/pYXpOVCz_o.png",
      "mission_patch_small": "https://images2.imgbox.com/ca/54/EEGqRRto_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/88l46q/tess_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/8cm61o/rspacex_tess_official_launch_discussion_updates/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/8cmzop/rspacex_tess_media_thread_videos_images_gifs/",
      "presskit": "http://www.spacex.com/sites/spacex/files/tesspresskitfinal417.pdf",
      "article_link": "https://spaceflightnow.com/2018/04/19/all-sky-surveyor-launched-from-cape-canaveral-on-the-hunt-for-exoplanets/",
      "wikipedia": "https://en.wikipedia.org/wiki/Transiting_Exoplanet_Survey_Satellite",
      "video_link": "https://www.youtube.com/watch?v=aY-0uBIYYKk",
      "youtube_id": "aY-0uBIYYKk",
      "flickr_images": [
        "https://farm1.staticflickr.com/799/27684194488_0d9a703c1c_o.jpg",
        "https://farm1.staticflickr.com/854/41512967372_0c37360126_o.jpg",
        "https://farm1.staticflickr.com/832/41512968122_20c2e31de3_o.jpg",
        "https://farm1.staticflickr.com/803/27684194678_c1ccd0680b_o.jpg",
        "https://farm1.staticflickr.com/902/41512967962_74913ef5b0_o.jpg"
      ]
    },
    "details": "Part of the Explorers program, this space telescope is intended for wide-field search of exoplanets transiting nearby stars. It is the first NASA high priority science mission launched by SpaceX. It was the first time SpaceX launched a scientific satellite not primarily intended for Earth observations. The second stage placed it into a high-Earth elliptical orbit, after which the satellite's own booster will perform complex maneuvers including a lunar flyby, and over the course of two months, reach a stable, 2:1 resonant orbit with the Moon. In January 2018, SpaceX received NASA's Launch Services Program Category 2 certification of its Falcon 9 'Full Thrust', certification which is required for launching medium risk missions like TESS. It was the last launch of a new Block 4 booster, and marked the 24th successful recovery of the booster. An experimental water landing was performed in order to attempt fairing recovery.",
    "upcoming": false,
    "static_fire_date_utc": "2018-04-11T18:30:00.000Z",
    "static_fire_date_unix": 1523471400,
    "timeline": {
      "webcast_liftoff": 1195,
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
      "maxq": 76,
      "meco": 149,
      "stage_sep": 152,
      "second_stage_ignition": 159,
      "fairing_deploy": 181,
      "first_stage_entry_burn": 389,
      "first_stage_landing": 476,
      "seco-1": 500,
      "second_stage_restart": 2590,
      "seco-2": 2643,
      "payload_deploy": 2975
    }
  },
  {
    "flight_number": 61,
    "mission_name": "Bangabandhu-1",
    "mission_id": [],
    "launch_year": "2018",
    "launch_date_unix": 1526069640,
    "launch_date_utc": "2018-05-11T20:14:00.000Z",
    "launch_date_local": "2018-05-11T16:14:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 7620,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1046",
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
            "payload_id": "Bangabandhu-1",
            "norad_id": [
              43463
            ],
            "reused": false,
            "customers": [
              "Bangladesh Gov"
            ],
            "nationality": "Bangladesh",
            "manufacturer": "Thales Alenia Space",
            "payload_type": "Satellite",
            "payload_mass_kg": 3750,
            "payload_mass_lbs": 8270,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": 119.1,
              "semi_major_axis_km": 42164.941,
              "eccentricity": 0.0001292,
              "periapsis_km": 35781.359,
              "apoapsis_km": 35792.254,
              "inclination_deg": 0.0098,
              "period_min": 1436.107,
              "lifespan_years": 15,
              "epoch": "2019-02-04T07:06:55.000Z",
              "mean_motion": 1.00271036,
              "raan": 108.5648,
              "arg_of_pericenter": 229.424,
              "mean_anomaly": 21.975
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
      "OCISLY",
      "RACHEL"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/result?code=BNG1"
    },
    "launch_site": {
      "site_id": "ksc_lc_39a",
      "site_name": "KSC LC 39A",
      "site_name_long": "Kennedy Space Center Historic Launch Complex 39A"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/df/cf/wlysigUT_o.png",
      "mission_patch_small": "https://images2.imgbox.com/94/3a/eavaQRYD_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/8624iq/bangabandhu1_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/8ia091/rspacex_bangabandhu1_official_launch_discussion",
      "reddit_recovery": "https://www.reddit.com/r/spacex/comments/8j6moa/bangabandhu1_block_5_recovery_thread/",
      "reddit_media": "https://www.reddit.com/r/spacex/comments/8ia5bu/rspacex_bangabandhu1_media_thread_videos_images/",
      "presskit": "http://www.spacex.com/sites/spacex/files/bangabandhupresskit51118.pdf",
      "article_link": "https://spaceflightnow.com/2018/05/11/spacex-debuts-an-improved-human-rated-model-of-the-falcon-9-rocket/",
      "wikipedia": "https://en.wikipedia.org/wiki/Bangabandhu-1",
      "video_link": "https://www.youtube.com/watch?v=rQEqKZ7CJlk",
      "youtube_id": "rQEqKZ7CJlk",
      "flickr_images": [
        "https://farm1.staticflickr.com/903/28197547888_dd697d8147_o.jpg",
        "https://farm1.staticflickr.com/823/42025498712_8ec531950f_o.jpg",
        "https://farm1.staticflickr.com/975/28197546158_880e466fb6_o.jpg",
        "https://farm1.staticflickr.com/823/27200014957_940f3720bb_o.jpg",
        "https://farm1.staticflickr.com/945/42025498442_0b7b91d561_o.jpg",
        "https://farm1.staticflickr.com/967/42025498972_8720104d8a_o.jpg",
        "https://farm1.staticflickr.com/954/42025499162_8a0ef7feaa_o.jpg",
        "https://farm1.staticflickr.com/911/42025499722_47d3433d65_o.jpg"
      ]
    },
    "details": "First launch of a Block V first stage.",
    "upcoming": false,
    "static_fire_date_utc": "2018-05-04T23:25:00.000Z",
    "static_fire_date_unix": 1525476300,
    "timeline": {
      "webcast_liftoff": 1077,
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
      "maxq": 74,
      "meco": 151,
      "stage_sep": 153,
      "second_stage_ignition": 156,
      "fairing_deploy": 217,
      "first_stage_entry_burn": 375,
      "first_stage_landing": 490,
      "seco-1": 499,
      "second_stage_restart": 1658,
      "seco-2": 1717,
      "payload_deploy": 2018
    }
  },
  {
    "flight_number": 62,
    "mission_name": "Iridium NEXT Mission 6",
    "mission_id": [
      "F3364BF"
    ],
    "launch_year": "2018",
    "launch_date_unix": 1527018478,
    "launch_date_utc": "2018-05-22T19:47:58.000Z",
    "launch_date_local": "2018-05-22T12:47:58-08:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1043",
            "flight": 2,
            "block": 4,
            "gridfins": true,
            "legs": false,
            "reused": true,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 4,
        "payloads": [
          {
            "payload_id": "Iridium NEXT 6",
            "norad_id": [
              43478,
              43479,
              43480,
              43481,
              43482
            ],
            "reused": false,
            "customers": [
              "Iridium Communications"
            ],
            "nationality": "United States",
            "manufacturer": "Thales Alenia Space",
            "payload_type": "Satellite",
            "payload_mass_kg": 4300,
            "payload_mass_lbs": 9479.9,
            "orbit": "PO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 7125.817,
              "eccentricity": 0.0002221,
              "periapsis_km": 746.099,
              "apoapsis_km": 749.265,
              "inclination_deg": 86.4521,
              "period_min": 99.772,
              "lifespan_years": 15,
              "epoch": "2019-02-05T07:27:58.000Z",
              "mean_motion": 14.43280451,
              "raan": 132.235,
              "arg_of_pericenter": 106.2635,
              "mean_anomaly": 253.881
            }
          },
          {
            "payload_id": "GRACE-FO 1-2",
            "norad_id": [
              43476,
              43477
            ],
            "reused": false,
            "customers": [
              "NASA",
              "DLR"
            ],
            "payload_type": "Satellite",
            "payload_mass_kg": 1160,
            "payload_mass_lbs": 2557.4,
            "orbit": "PO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "sun-synchronous",
              "longitude": null,
              "semi_major_axis_km": 6872.503,
              "eccentricity": 0.0018199,
              "periapsis_km": 481.861,
              "apoapsis_km": 506.875,
              "inclination_deg": 88.998,
              "period_min": 94.5,
              "lifespan_years": 5,
              "epoch": "2019-02-05T13:20:55.000Z",
              "mean_motion": 15.23808165,
              "raan": 204.4278,
              "arg_of_pericenter": 18.5817,
              "mean_anomaly": 341.6091
            }
          }
        ]
      },
      "fairings": {
        "reused": false,
        "recovery_attempt": true,
        "recovered": false,
        "ship": "MR STEVEN"
      }
    },
    "ships": [
      "MRSTEVEN"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/result?code=IRD6"
    },
    "launch_site": {
      "site_id": "vafb_slc_4e",
      "site_name": "VAFB SLC 4E",
      "site_name_long": "Vandenberg Air Force Base Space Launch Complex 4E"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/3d/f9/IHjBUE1f_o.png",
      "mission_patch_small": "https://images2.imgbox.com/f5/da/hz3r2Lni_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/8ffsgl/iridium6_gracefo_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/8kyk5a/rspacex_iridium_next_6_official_launch_discussion/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/8l9tfz/rspacex_iridium6gracefo_media_thread_videos/",
      "presskit": "http://www.spacex.com/sites/spacex/files/iridium6presskit2018521.pdf",
      "article_link": "https://spaceflightnow.com/2018/05/22/rideshare-launch-by-spacex-serves-commercial-and-scientific-customers/",
      "wikipedia": "https://en.wikipedia.org/wiki/Gravity_Recovery_and_Climate_Experiment",
      "video_link": "https://www.youtube.com/watch?v=I_0GgKfwCSk",
      "youtube_id": "I_0GgKfwCSk",
      "flickr_images": [
        "https://farm1.staticflickr.com/897/42290934301_4c6ac431c8_o.jpg",
        "https://farm1.staticflickr.com/831/42290933051_510176c9da_o.jpg",
        "https://farm1.staticflickr.com/882/42290932011_a522b43015_o.jpg",
        "https://farm1.staticflickr.com/947/42290930761_4bf7b607b1_o.jpg",
        "https://farm1.staticflickr.com/982/42290930181_0117ab0dfb_o.jpg",
        "https://farm1.staticflickr.com/955/42244412292_e787538fc5_o.jpg"
      ]
    },
    "details": "GFZ arranged a rideshare of GRACE-FO on a Falcon 9 with Iridium following the cancellation of their Dnepr launch contract in 2015. Iridium CEO Matt Desch disclosed in September 2017 that GRACE-FO would be launched on the sixth Iridium NEXT mission. The booster reuse turnaround was a record 4.5 months between flights.",
    "upcoming": false,
    "static_fire_date_utc": "2018-05-18T20:16:00.000Z",
    "static_fire_date_unix": 1526674560,
    "timeline": {
      "webcast_liftoff": 960,
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
      "maxq": 79,
      "meco": 165,
      "stage_sep": 168,
      "second_stage_ignition": 177,
      "fairing_deploy": 192,
      "seco-1": 613,
      "payload_deploy_1": 693,
      "second_stage_restart": 3415,
      "seco-2": 3423,
      "payload_deploy_2": 3948
    }
  },
  {
    "flight_number": 63,
    "mission_name": "SES-12",
    "mission_id": [
      "6C42550"
    ],
    "launch_year": "2018",
    "launch_date_unix": 1528087500,
    "launch_date_utc": "2018-06-04T04:45:00.000Z",
    "launch_date_local": "2018-06-04T00:45:00-04:00",
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
            "core_serial": "B1040",
            "flight": 2,
            "block": 4,
            "gridfins": false,
            "legs": false,
            "reused": true,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 5,
        "payloads": [
          {
            "payload_id": "SES-12",
            "norad_id": [
              43488
            ],
            "reused": false,
            "customers": [
              "SES"
            ],
            "nationality": "Luxembourg",
            "manufacturer": "Airbus Defence and Space",
            "payload_type": "Satellite",
            "payload_mass_kg": 5383.85,
            "payload_mass_lbs": 11869.4,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": 95,
              "semi_major_axis_km": 42230.611,
              "eccentricity": 0.000283,
              "periapsis_km": 35840.525,
              "apoapsis_km": 35864.428,
              "inclination_deg": 0.0635,
              "period_min": 1439.463,
              "lifespan_years": 15,
              "epoch": "2019-02-04T19:25:17.000Z",
              "mean_motion": 1.0003724,
              "raan": 286.7739,
              "arg_of_pericenter": 270.8841,
              "mean_anomaly": 341.1133
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
      "GOPURSUIT"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/result?code=SES12"
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/44/ba/fvMeODet_o.png",
      "mission_patch_small": "https://images2.imgbox.com/4b/b9/oS8ezl6V_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/8jv0ed/ses12_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/8o9woj/rspacex_ses12_official_launch_discussion_updates/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/8oa3k4/rspacex_ses12_media_thread_videos_images_gifs/",
      "presskit": "http://www.spacex.com/sites/spacex/files/ses-12missionpress_kit_6.2.18.pdf",
      "article_link": "https://spaceflightnow.com/2018/06/04/multi-mission-telecom-craft-launched-by-spacex-for-ses/",
      "wikipedia": "https://en.wikipedia.org/wiki/SES-12",
      "video_link": "https://www.youtube.com/watch?v=2hcM5hqQ45s",
      "youtube_id": "2hcM5hqQ45s",
      "flickr_images": [
        "https://farm2.staticflickr.com/1752/41664024035_14c81a25e3_o.jpg",
        "https://farm2.staticflickr.com/1731/27695627527_d9d5bca0ae_o.jpg",
        "https://farm2.staticflickr.com/1735/27695627327_ed66c7282c_o.jpg",
        "https://farm2.staticflickr.com/1752/27695627417_38ea7d7acf_o.jpg",
        "https://farm2.staticflickr.com/1733/41664023935_e9e8120690_o.jpg"
      ]
    },
    "details": "SES-12, the replacement satellite for NSS-6, was successfully launched and deployed on June 4th, completing SpaceX's eleventh flight of 2018. According to SES Luxembourg, The SES-12 satellite will expand SES’s capabilities to provide direct-to-home (DTH) broadcasting, VSAT, Mobility and High Throughput Satellite (HTS) data connectivity services in the Middle East and the Asia-Pacific region, including rapidly growing markets such as India and Indonesia. [SES-12] will be co-located with SES-8",
    "upcoming": false,
    "static_fire_date_utc": "2018-05-25T01:48:00.000Z",
    "static_fire_date_unix": 1527212880,
    "timeline": {
      "webcast_liftoff": 780,
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
      "maxq": 81,
      "meco": 164,
      "stage_sep": 168,
      "second_stage_ignition": 175,
      "fairing_deploy": 207,
      "seco-1": 505,
      "second_stage_restart": 1566,
      "seco-2": 1633,
      "payload_deploy": 1934
    }
  },
  {
    "flight_number": 64,
    "mission_name": "CRS-15",
    "mission_id": [
      "EE86F74"
    ],
    "launch_year": "2018",
    "launch_date_unix": 1530265320,
    "launch_date_utc": "2018-06-29T09:42:00.000Z",
    "launch_date_local": "2018-06-29T05:42:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1045",
            "flight": 2,
            "block": 4,
            "gridfins": false,
            "legs": false,
            "reused": true,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 4,
        "payloads": [
          {
            "payload_id": "CRS-15",
            "norad_id": [
              43522
            ],
            "cap_serial": "C111",
            "reused": true,
            "customers": [
              "NASA (CRS)"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Dragon 1.1",
            "payload_mass_kg": 2410,
            "payload_mass_lbs": 5313,
            "orbit": "ISS",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 6685.069,
              "eccentricity": 0.0119429,
              "periapsis_km": 227.094,
              "apoapsis_km": 386.773,
              "inclination_deg": 51.6352,
              "period_min": 90.66,
              "lifespan_years": null,
              "epoch": "2018-06-29T11:28:11.000Z",
              "mean_motion": 15.88341598,
              "raan": 317.9412,
              "arg_of_pericenter": 52.1513,
              "mean_anomaly": 25.5794
            },
            "mass_returned_kg": 1700,
            "mass_returned_lbs": 3747.9,
            "flight_time_sec": 3069300,
            "cargo_manifest": "https://www.nasa.gov/sites/default/files/atoms/files/spacex_crs-15_mision_overview_rev2_high_res7.pdf"
          }
        ]
      },
      "fairings": null
    },
    "ships": [
      "NRCQUEST"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/results/?code=CR15"
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/43/35/0QW7yRsB_o.png",
      "mission_patch_small": "https://images2.imgbox.com/11/ec/xng5hAXN_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/8pua1m/crs15_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/8ugo3l/rspacex_crs15_official_launch_discussion_updates",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/8ujcwo/rspacex_crs15_media_thread_videos_images_gifs/",
      "presskit": "http://www.spacex.com/sites/spacex/files/crs15presskit.pdf",
      "article_link": "https://spaceflightnow.com/2018/06/29/spacex-launches-ai-enabled-robot-companion-vegetation-monitor-to-space-station/",
      "wikipedia": "https://en.wikipedia.org/wiki/SpaceX_CRS-15",
      "video_link": "https://www.youtube.com/watch?v=ycMagB1s8XM",
      "youtube_id": "ycMagB1s8XM",
      "flickr_images": [
        "https://farm1.staticflickr.com/836/42374725204_dae09db889_o.jpg",
        "https://farm2.staticflickr.com/1781/41281636860_71dca92ab4_o.jpg",
        "https://farm2.staticflickr.com/1829/42374725534_325e676d19_o.jpg",
        "https://farm2.staticflickr.com/1810/42374724974_e50b050403_o.jpg",
        "https://farm1.staticflickr.com/843/41281636620_437528bd1f_o.jpg",
        "https://farm2.staticflickr.com/1790/41281637670_f6a6a2cf6c_o.jpg"
      ]
    },
    "details": "Payload included MISSE-FF 2, ECOSTRESS, and a Latching End Effector. The refurbished booster featured a record 2.5 months period turnaround from its original launch of the TESS satellite — the fastest previous was 4.5 months. This was the last commercial flight of a Block 4 booster, which was expended into the Atlantic without landing legs and grid fins.",
    "upcoming": false,
    "static_fire_date_utc": "2018-06-23T21:30:00.000Z",
    "static_fire_date_unix": 1529789400,
    "timeline": {
      "webcast_liftoff": 1139,
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
      "maxq": 79,
      "meco": 165,
      "stage_sep": 168,
      "second_stage_ignition": 176,
      "seco-1": 511,
      "dragon_separation": 571,
      "dragon_solar_deploy": 660,
      "dragon_bay_door_deploy": 8400
    }
  },
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
  },
  {
    "flight_number": 66,
    "mission_name": "Iridium NEXT Mission 7",
    "mission_id": [
      "F3364BF"
    ],
    "launch_year": "2018",
    "launch_date_unix": 1532518766,
    "launch_date_utc": "2018-07-25T11:39:26.000Z",
    "launch_date_local": "2018-07-25T04:39:26-07:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1048",
            "flight": 1,
            "block": 5,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "ASDS",
            "landing_vehicle": "JRTI"
          }
        ]
      },
      "second_stage": {
        "block": null,
        "payloads": [
          {
            "payload_id": "Iridium NEXT 7",
            "norad_id": [
              43569,
              43570,
              43571,
              43572,
              43573,
              43574,
              43575,
              43576,
              43577,
              43578
            ],
            "reused": false,
            "customers": [
              "Iridium Communications"
            ],
            "nationality": "United States",
            "manufacturer": "Thales Alenia Space",
            "payload_type": "Satellite",
            "payload_mass_kg": 9600,
            "payload_mass_lbs": 21164.38,
            "orbit": "PO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 7155.805,
              "eccentricity": 0.0001945,
              "periapsis_km": 776.278,
              "apoapsis_km": 779.062,
              "inclination_deg": 86.396,
              "period_min": 100.403,
              "lifespan_years": 15,
              "epoch": "2019-02-05T06:02:02.000Z",
              "mean_motion": 14.34217326,
              "raan": 100.4836,
              "arg_of_pericenter": 93.1246,
              "mean_anomaly": 267.0172
            }
          }
        ]
      },
      "fairings": {
        "reused": false,
        "recovery_attempt": true,
        "recovered": false,
        "ship": "MR STEVEN"
      }
    },
    "ships": [
      "JRTI-2",
      "MRSTEVEN",
      "NRCQUEST",
      "PACIFICFREEDOM"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/result?code=IRD7"
    },
    "launch_site": {
      "site_id": "vafb_slc_4e",
      "site_name": "VAFB SLC 4E",
      "site_name_long": "Vandenberg Air Force Base Space Launch Complex 4E"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/90/b5/fS6LMNGd_o.png",
      "mission_patch_small": "https://images2.imgbox.com/37/63/NE4EISfK_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/8v4wcm/iridium_next_constellation_mission_7_launch/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/91i1ru/rspacex_iridium_next_7_official_launch_discussion/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/91gx44/rspacex_iridium_next_constellation_mission_7/",
      "presskit": "http://www.spacex.com/sites/spacex/files/iridium7_press_kit_7_24.pdf",
      "article_link": "https://spaceflightnow.com/2018/07/25/spacexs-second-launch-in-three-days-lofts-10-more-iridium-satellites/",
      "wikipedia": "https://en.wikipedia.org/wiki/Iridium_satellite_constellation#Next-generation_constellation",
      "video_link": "https://www.youtube.com/watch?v=vsDknmK30C0",
      "youtube_id": "vsDknmK30C0",
      "flickr_images": [
        "https://farm1.staticflickr.com/934/41868222930_0a850d30dc_o.jpg",
        "https://farm1.staticflickr.com/852/41868222500_2ff5f6e5f9_o.jpg",
        "https://farm1.staticflickr.com/929/28787338307_7c0cfce99a_o.jpg",
        "https://farm1.staticflickr.com/928/28787338507_3be74590d2_o.jpg"
      ]
    },
    "details": "SpaceX's fourteenth flight of 2018 and seventh of eight launches in a half-a-billion-dollar contract with Iridium. Will use a Block 5 first stage, to be recovered in the Pacific Ocean. Only one mission will be left for Iridium, with 10 more satellites. First attempt to recover a Fairing with the upgraded net. Fairing recovery was not successful.",
    "upcoming": false,
    "static_fire_date_utc": "2018-07-20T21:08:00.000Z",
    "static_fire_date_unix": 1532120880,
    "timeline": {
      "webcast_liftoff": 1318,
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
      "meco": 144,
      "stage_sep": 147,
      "second_stage_ignition": 149,
      "fairing_deploy": 191,
      "first_stage_entry_burn": 339,
      "first_stage_landing": 437,
      "seco-1": 513,
      "second_stage_restart": 3088,
      "seco-2": 3097,
      "payload_deploy": 3398
    }
  },
  {
    "flight_number": 67,
    "mission_name": "Merah Putih",
    "mission_id": [],
    "launch_year": "2018",
    "launch_date_unix": 1533619080,
    "launch_date_utc": "2018-08-07T05:18:00.000Z",
    "launch_date_local": "2018-08-07T01:18:00-04:00",
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
            "core_serial": "B1046",
            "flight": 2,
            "block": 5,
            "gridfins": true,
            "legs": true,
            "reused": true,
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
            "payload_id": "Telkom-4",
            "norad_id": [
              43587
            ],
            "reused": false,
            "customers": [
              "Telkom"
            ],
            "nationality": "Indonesia",
            "manufacturer": "SSL",
            "payload_type": "Satellite",
            "payload_mass_kg": 5800,
            "payload_mass_lbs": 12786.81,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": -108,
              "semi_major_axis_km": 42164.98,
              "eccentricity": 0.0001879,
              "periapsis_km": 35778.922,
              "apoapsis_km": 35794.768,
              "inclination_deg": 0.0134,
              "period_min": 1436.109,
              "lifespan_years": 15,
              "epoch": "2019-02-04T07:51:13.000Z",
              "mean_motion": 1.00270898,
              "raan": 80.4236,
              "arg_of_pericenter": 294.5712,
              "mean_anomaly": 344.9802
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
      "HAWK",
      "OCISLY"
    ],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/a8/f5/ZgdsrbqW_o.png",
      "mission_patch_small": "https://images2.imgbox.com/a7/ec/sbwePzVD_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/91gwfg/merah_putih_telkom4_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/9539nr/rspacex_merah_putih_telkom4_official_launch/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/94zr0b/rspacex_merah_putih_media_thread_videos_images/",
      "presskit": "https://www.spacex.com/sites/spacex/files/merahputihpresskit.pdf",
      "article_link": "https://spaceflightnow.com/2018/08/07/indonesian-communications-satellite-deployed-in-orbit-by-spacex/",
      "wikipedia": "https://en.wikipedia.org/wiki/Telkom_Indonesia",
      "video_link": "https://www.youtube.com/watch?v=FjfQNBYv2IY",
      "youtube_id": "FjfQNBYv2IY",
      "flickr_images": [
        "https://farm2.staticflickr.com/1798/43862495212_8fe1688c4b_o.jpg",
        "https://farm1.staticflickr.com/935/43006330655_f1623a3fa1_o.jpg",
        "https://farm1.staticflickr.com/938/28974313177_d16381ff5f_o.jpg",
        "https://farm2.staticflickr.com/1780/43006334045_fb7b4a8714_o.jpg",
        "https://farm1.staticflickr.com/929/28974335747_ffd87ff274_o.jpg",
        "https://farm1.staticflickr.com/930/30041972208_f735b9690b_o.jpg"
      ]
    },
    "details": "SpaceX's fifteenth flight of 2018 launched the Merah Putih (also known as Telkom-4) geostationary communications satellite for Telkom Indonesia. It marked the first reuse of any Block 5 first stage; the booster B1046 had previously launched Bangabandhu-1. The stage was recovered and is expected to become the first Falcon 9 booster to fly three missions.",
    "upcoming": false,
    "static_fire_date_utc": "2018-08-02T15:53:00.000Z",
    "static_fire_date_unix": 1533225180,
    "timeline": {
      "webcast_liftoff": 1316,
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
      "maxq": 79,
      "meco": 150,
      "stage_sep": 154,
      "second_stage_ignition": 156,
      "fairing_deploy": 208,
      "first_stage_entry_burn": 373,
      "seco-1": 486,
      "first_stage_landing": 488,
      "second_stage_restart": 1575,
      "seco-2": 1633,
      "payload_deploy": 1913
    }
  },
  {
    "flight_number": 68,
    "mission_name": "Telstar 18V",
    "mission_id": [
      "F4F83DE"
    ],
    "launch_year": "2018",
    "launch_date_unix": 1536554700,
    "launch_date_utc": "2018-09-10T04:45:00.000Z",
    "launch_date_local": "2018-09-10T00:45:00-04:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 14400,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1049",
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
            "payload_id": "Telstar 18V",
            "norad_id": [
              43611
            ],
            "reused": false,
            "customers": [
              "Telesat"
            ],
            "nationality": "Canada",
            "manufacturer": "SSL",
            "payload_type": "Satellite",
            "payload_mass_kg": 7060,
            "payload_mass_lbs": 15564.64,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": 138,
              "semi_major_axis_km": 42165.002,
              "eccentricity": 0.0003172,
              "periapsis_km": 35773.493,
              "apoapsis_km": 35800.242,
              "inclination_deg": 0.0164,
              "period_min": 1436.11,
              "lifespan_years": 15,
              "epoch": "2019-02-05T05:47:34.000Z",
              "mean_motion": 1.00270819,
              "raan": 71.1476,
              "arg_of_pericenter": 269.2943,
              "mean_anomaly": 19.5161
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
      "OCISLY",
      "HAWK",
      "GOQUEST"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/result/2d?code=T18V"
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/ba/db/3plcm5IB_o.png",
      "mission_patch_small": "https://images2.imgbox.com/2d/d2/jStsqeLC_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/95cte4/telstar_18v_apstar_5c_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/9e7bmq/rspacex_telstar_18v_official_launch_discussion/",
      "reddit_recovery": "https://www.reddit.com/r/spacex/comments/9erxlh/telstar_18_vantage_recovery_thread/",
      "reddit_media": "https://www.reddit.com/r/spacex/comments/9ebkqw/rspacex_telstar_18v_media_thread_videos_images/",
      "presskit": "https://www.spacex.com/sites/spacex/files/telstar18vantagepresskit.pdf",
      "article_link": "https://spaceflightnow.com/2018/09/10/spacex-telesat-achieve-repeat-success-with-midnight-hour-launch/",
      "wikipedia": "https://en.wikipedia.org/wiki/Telstar_18V",
      "video_link": "https://www.youtube.com/watch?v=Apw3xqwsG1U",
      "youtube_id": "Apw3xqwsG1U",
      "flickr_images": [
        "https://farm2.staticflickr.com/1878/43690848045_492ef182dd_o.jpg",
        "https://farm2.staticflickr.com/1856/43881229604_6d42e838b6_o.jpg",
        "https://farm2.staticflickr.com/1852/43881223704_93777e34af_o.jpg",
        "https://farm2.staticflickr.com/1841/43881217094_558b7b214e_o.jpg",
        "https://farm2.staticflickr.com/1869/43881193934_423eff8c86_o.jpg"
      ]
    },
    "details": "SpaceX's sixteenth flight of 2018 launched the Telstar 18v GEO communication satellite for Telesat, the second launch for the canadian company in a few months. The first stage was a new Falcon 9 V1.2 Block 5 which was successfully recovered on OCISLY.",
    "upcoming": false,
    "static_fire_date_utc": "2018-09-05T07:21:00.000Z",
    "static_fire_date_unix": 1536132060,
    "timeline": {
      "webcast_liftoff": 840,
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
      "maxq": 67,
      "meco": 153,
      "stage_sep": 157,
      "second_stage_ignition": 165,
      "fairing_deploy": 209,
      "first_stage_entry_burn": 377,
      "seco-1": 494,
      "first_stage_landing": 512,
      "second_stage_restart": 1577,
      "seco-2": 1620,
      "payload_deploy": 1921
    }
  },
  {
    "flight_number": 69,
    "mission_name": "SAOCOM 1A",
    "mission_id": [],
    "launch_year": "2018",
    "launch_date_unix": 1538965320,
    "launch_date_utc": "2018-10-08T02:22:00.000Z",
    "launch_date_local": "2018-10-07T19:22:00-07:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1048",
            "flight": 2,
            "block": 5,
            "gridfins": true,
            "legs": true,
            "reused": true,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "RTLS",
            "landing_vehicle": "LZ-4"
          }
        ]
      },
      "second_stage": {
        "block": 5,
        "payloads": [
          {
            "payload_id": "SAOCOM 1A",
            "norad_id": [
              43641
            ],
            "reused": false,
            "customers": [
              "CONAE"
            ],
            "nationality": "Argentina",
            "manufacturer": "INVAP",
            "payload_type": "Satellite",
            "payload_mass_kg": 2800,
            "payload_mass_lbs": 6172.94,
            "orbit": "SSO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "sun-synchronous",
              "longitude": null,
              "semi_major_axis_km": 7000.677,
              "eccentricity": 0.0001467,
              "periapsis_km": 621.515,
              "apoapsis_km": 623.569,
              "inclination_deg": 97.8911,
              "period_min": 97.156,
              "lifespan_years": 5,
              "epoch": "2019-02-05T12:40:30.000Z",
              "mean_motion": 14.82151559,
              "raan": 224.7337,
              "arg_of_pericenter": 81.5906,
              "mean_anomaly": 278.5483
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
    "ships": [],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/result/2d?code=SAOCOM1A"
    },
    "launch_site": {
      "site_id": "vafb_slc_4e",
      "site_name": "VAFB SLC 4E",
      "site_name_long": "Vandenberg Air Force Base Space Launch Complex 4E"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/66/d2/oVB1ofaZ_o.png",
      "mission_patch_small": "https://images2.imgbox.com/ae/11/H85gskPQ_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/9fwj9o/saocom_1a_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/9lazvr/rspacex_saocom_1a_official_launch_discussion/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/9m3ly5/rspacex_saocom_1a_media_thread_videos_images_gifs/",
      "presskit": "https://www.spacex.com/sites/spacex/files/saocom1apresskit.pdf",
      "article_link": "https://spaceflightnow.com/2018/10/08/spacex-aces-first-rocket-landing-in-california-after-launching-argentine-satellite/",
      "wikipedia": "https://en.wikipedia.org/wiki/SAOCOM",
      "video_link": "https://www.youtube.com/watch?v=vr_C6LQ7mHc",
      "youtube_id": "vr_C6LQ7mHc",
      "flickr_images": [
        "https://farm2.staticflickr.com/1940/44262177535_9582184d3f_o.jpg",
        "https://farm2.staticflickr.com/1917/30234800687_fd94fde151_o.jpg",
        "https://farm2.staticflickr.com/1951/30234801997_b5a65426ca_o.jpg",
        "https://farm2.staticflickr.com/1910/44262169525_e4c6b27299_o.jpg",
        "https://farm2.staticflickr.com/1923/44451125454_8d26929d0b_o.jpg",
        "https://farm2.staticflickr.com/1914/44262170545_22fe55d4bb_o.jpg",
        "https://farm2.staticflickr.com/1934/44262166295_3f84597f09_o.jpg"
      ]
    },
    "details": "SpaceX's seventeenth flight of 2018 was the first launch of the Saocom Earth observation satellite constellation of the Argentine Space Agency CONAE. The second launch of Saocom 1B will happen in 2019. This flight marked the first RTLS launch out of Vandenberg, with a landing on the concrete pad at SLC-4W, very close to the launch pad.",
    "upcoming": false,
    "static_fire_date_utc": "2018-10-02T21:00:00.000Z",
    "static_fire_date_unix": 1538514000,
    "timeline": {
      "webcast_liftoff": 1019,
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
      "maxq": 59,
      "meco": 140,
      "stage_sep": 144,
      "second_stage_ignition": 151,
      "first_stage_boostback_burn": 156,
      "fairing_deploy": 168,
      "first_stage_entry_burn": 357,
      "first_stage_landing": 466,
      "seco-1": 607,
      "payload_deploy": 757
    }
  },
  {
    "flight_number": 70,
    "mission_name": "Es’hail 2",
    "mission_id": [],
    "launch_year": "2018",
    "launch_date_unix": 1542314760,
    "launch_date_utc": "2018-11-15T20:46:00.000Z",
    "launch_date_local": "2018-11-15T15:46:00-05:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 6180,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1047",
            "flight": 2,
            "block": 5,
            "gridfins": true,
            "legs": true,
            "reused": true,
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
            "payload_id": "Es’hail 2",
            "norad_id": [
              43700
            ],
            "reused": false,
            "customers": [
              "Es’hailSat"
            ],
            "nationality": "Qatar",
            "manufacturer": "Mitsubishi Electric",
            "payload_type": "Satellite",
            "payload_mass_kg": 3000,
            "payload_mass_lbs": 6613.868,
            "orbit": "GTO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "geostationary",
              "longitude": 25.5,
              "semi_major_axis_km": 42165.599,
              "eccentricity": 0.0000865,
              "periapsis_km": 35783.817,
              "apoapsis_km": 35791.111,
              "inclination_deg": 0.0156,
              "period_min": 1436.141,
              "lifespan_years": 15,
              "epoch": "2019-02-04T13:19:01.000Z",
              "mean_motion": 1.0026869,
              "raan": 98.0986,
              "arg_of_pericenter": 238.463,
              "mean_anomaly": 23.4344
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
      "HAWK",
      "OCISLY"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/result/2d?code=ESL2"
    },
    "launch_site": {
      "site_id": "ksc_lc_39a",
      "site_name": "KSC LC 39A",
      "site_name_long": "Kennedy Space Center Historic Launch Complex 39A"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/59/c8/HPYpMlux_o.png",
      "mission_patch_small": "https://images2.imgbox.com/a3/96/WvJsBXuE_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/9p82jt/eshail_2_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/9x9w9v/rspacex_eshail_2_official_launch_discussion/",
      "reddit_recovery": "https://www.reddit.com/r/spacex/comments/9xmpa7/eshail_2_recovery_thread/",
      "reddit_media": "https://www.reddit.com/r/spacex/comments/9xaa76/rspacex_eshail_2_media_thread_videos_images_gifs/",
      "presskit": "https://www.spacex.com/sites/spacex/files/eshail-2_mission_press_kit_11_14_2018.pdf",
      "article_link": "https://spaceflightnow.com/2018/11/15/spacex-launches-qatars-eshail-2-communications-satellite/",
      "wikipedia": "https://en.wikipedia.org/wiki/Es%27hailSat",
      "video_link": "https://www.youtube.com/watch?v=PhTbzc-BqKs&feature=youtu.be",
      "youtube_id": "PhTbzc-BqKs",
      "flickr_images": [
        "https://farm5.staticflickr.com/4834/32040174268_b71d703417_o.jpg",
        "https://farm5.staticflickr.com/4810/32040174058_a65fa64e85_o.jpg",
        "https://farm5.staticflickr.com/4814/32040173268_0ab571e7bc_o.jpg",
        "https://farm5.staticflickr.com/4899/32040173568_bb5c991565_o.jpg",
        "https://farm5.staticflickr.com/4875/32040173278_b5578ba6be_o.jpg",
        "https://farm5.staticflickr.com/4862/32040173928_afdfb09939_o.jpg",
        "https://farm5.staticflickr.com/4888/32040173048_b2b29c020f_o.jpg",
        "https://farm5.staticflickr.com/4808/32248947038_dd1cf9e8c3_o.jpg",
        "https://farm5.staticflickr.com/4887/31180979107_da6a935c20_o.jpg"
      ]
    },
    "details": "SpaceX's eighteenth flight of 2018 was its first for Es'hailSat. Es'hail-2 is a communications satellite delivering television and internet to Qatar and the surrounding region. It was launched into a geostationary transfer orbit from LC-39A at Kennedy Space Center. The booster landed on OCISLY.",
    "upcoming": false,
    "static_fire_date_utc": "2018-11-12T18:13:00.000Z",
    "static_fire_date_unix": 1542046380,
    "timeline": {
      "webcast_liftoff": 900,
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
      "maxq": 66,
      "meco": 155,
      "stage_sep": 159,
      "second_stage_ignition": 166,
      "fairing_deploy": 227,
      "first_stage_entry_burn": 382,
      "seco-1": 487,
      "first_stage_landing": 496,
      "second_stage_restart": 1594,
      "seco-2": 1649,
      "payload_deploy": 1969
    }
  },
  {
    "flight_number": 71,
    "mission_name": "SSO-A",
    "mission_id": [],
    "launch_year": "2018",
    "launch_date_unix": 1543861920,
    "launch_date_utc": "2018-12-03T18:34:00.000Z",
    "launch_date_local": "2018-12-03T10:34:00-08:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 1680,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1046",
            "flight": 3,
            "block": 5,
            "gridfins": true,
            "legs": true,
            "reused": true,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "ASDS",
            "landing_vehicle": "JRTI"
          }
        ]
      },
      "second_stage": {
        "block": 5,
        "payloads": [
          {
            "payload_id": "SSO-A",
            "norad_id": [
              43775,
              43776,
              43774,
              43763,
              43760,
              43759
            ],
            "reused": false,
            "customers": [
              "Spaceflight Industries, Inc"
            ],
            "nationality": "United States",
            "manufacturer": "Spaceflight Industries, Inc",
            "payload_type": "Satellite",
            "payload_mass_kg": 4000,
            "payload_mass_lbs": 8818.49,
            "orbit": "SSO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "sun-synchronous",
              "longitude": null,
              "semi_major_axis_km": 6960.936,
              "eccentricity": 0.001585,
              "periapsis_km": 571.768,
              "apoapsis_km": 593.834,
              "inclination_deg": 97.7615,
              "period_min": 96.329,
              "lifespan_years": null,
              "epoch": "2019-02-04T20:58:17.000Z",
              "mean_motion": 14.94862457,
              "raan": 109.395,
              "arg_of_pericenter": 55.5658,
              "mean_anomaly": 304.7057
            }
          }
        ]
      },
      "fairings": {
        "reused": false,
        "recovery_attempt": true,
        "recovered": false,
        "ship": "MR STEVEN"
      }
    },
    "ships": [
      "JRTI-2",
      "NRCQUEST",
      "PACIFICFREEDOM",
      "MRSTEVEN"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/result/2d?code=SSOA"
    },
    "launch_site": {
      "site_id": "vafb_slc_4e",
      "site_name": "VAFB SLC 4E",
      "site_name_long": "Vandenberg Air Force Base Space Launch Complex 4E"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/c3/88/YprVKOBk_o.png",
      "mission_patch_small": "https://images2.imgbox.com/07/ff/s2SD7HuJ_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/9raysi/ssoa_launch_campaign_thread",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/a0vjff/rspacex_ssoa_official_launch_discussion_updates/",
      "reddit_recovery": "https://www.reddit.com/r/spacex/comments/a2tjoe/ssoa_recovery_thread/",
      "reddit_media": "https://old.reddit.com/r/spacex/comments/a0wylf/rspacex_ssoa_media_thread_videos_images_gifs/",
      "presskit": "https://www.spacex.com/sites/spacex/files/ssoa_press_kit.pdf",
      "article_link": "https://spaceflightnow.com/2018/12/03/spacex-launches-swarm-of-satellites-re-flies-rocket-for-third-time/",
      "wikipedia": "https://en.wikipedia.org/wiki/Spaceflight_Industries",
      "video_link": "https://www.youtube.com/watch?v=Wq8kS6UoOrQ",
      "youtube_id": "Wq8kS6UoOrQ",
      "flickr_images": [
        "https://farm5.staticflickr.com/4875/45257565145_d53757e0b2_o.jpg",
        "https://farm5.staticflickr.com/4839/45257565835_4fd6f3e895_o.jpg",
        "https://farm5.staticflickr.com/4822/45257566865_9c9d34a7ca_o.jpg",
        "https://farm5.staticflickr.com/4821/45257568225_186c8431cf_o.jpg",
        "https://farm5.staticflickr.com/4885/45257569445_1d74a601df_o.jpg",
        "https://farm5.staticflickr.com/4869/45257570925_8eae9a0888_o.jpg",
        "https://farm5.staticflickr.com/4842/31338804427_2e4dcda6e7_o.jpg",
        "https://farm5.staticflickr.com/4894/46227271292_2eee9af3eb_o.jpg",
        "https://farm5.staticflickr.com/4870/44460659210_de634098ac_o.jpg"
      ]
    },
    "details": "SpaceX's nineteenth flight of 2018 will fly SSO-A: SmallSat Express out of Vandenberg SLC-4E for Spaceflight. SSO-A is a rideshare to sun synchronus low earth orbit consisting of 64 individual microsatellites and cubesats. It is also likely to be the third flight of core B1046 which previously flew Bangabandhu-1 and Merah Putih. If this happens it will be the first time a Falcon 9 has flown more than two missions. ",
    "upcoming": false,
    "static_fire_date_utc": "2018-11-15T21:55:00.000Z",
    "static_fire_date_unix": 1542318900,
    "timeline": {
      "webcast_liftoff": 1196,
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
      "maxq": 59,
      "meco": 141,
      "stage_sep": 144,
      "second_stage_ignition": 152,
      "fairing_deploy": 163,
      "first_stage_entry_burn": 358,
      "first_stage_landing": 465,
      "seco-1": 601,
      "payload_deploy": 827
    }
  },
  {
    "flight_number": 72,
    "mission_name": "CRS-16",
    "mission_id": [
      "EE86F74"
    ],
    "launch_year": "2018",
    "launch_date_unix": 1544033760,
    "launch_date_utc": "2018-12-05T18:16:00.000Z",
    "launch_date_local": "2018-12-05T13:16:00-05:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1050",
            "flight": 1,
            "block": 5,
            "gridfins": true,
            "legs": true,
            "reused": false,
            "land_success": false,
            "landing_intent": true,
            "landing_type": "RTLS",
            "landing_vehicle": "LZ-1"
          }
        ]
      },
      "second_stage": {
        "block": 5,
        "payloads": [
          {
            "payload_id": "CRS-16",
            "norad_id": [
              43827
            ],
            "cap_serial": "C112",
            "reused": true,
            "customers": [
              "NASA (CRS)"
            ],
            "nationality": "United States",
            "manufacturer": "SpaceX",
            "payload_type": "Dragon 1.1",
            "payload_mass_kg": 2573,
            "payload_mass_lbs": 5672.494,
            "orbit": "ISS",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 6783.903,
              "eccentricity": 0.0002416,
              "periapsis_km": 404.129,
              "apoapsis_km": 407.407,
              "inclination_deg": 51.6425,
              "period_min": 92.678,
              "lifespan_years": null,
              "epoch": "2019-01-13T14:04:57.000Z",
              "mean_motion": 15.53757701,
              "raan": 50.2106,
              "arg_of_pericenter": 284.1251,
              "mean_anomaly": 212.8292
            },
            "mass_returned_kg": 2500,
            "mass_returned_lbs": 5512,
            "flight_time_sec": 3408840,
            "cargo_manifest": "https://www.nasa.gov/sites/default/files/atoms/files/spacex_crs-16_mision_overview_high_res_rev2.pdf"
          }
        ]
      },
      "fairings": null
    },
    "ships": [
      "GOQUEST"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/result/2d?code=CR16"
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/b6/15/tLQrmwcl_o.png",
      "mission_patch_small": "https://images2.imgbox.com/de/47/liJzNMRP_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/9z7i4j/crs16_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/a2oubw/rspacex_crs16_official_launch_discussion_updates/",
      "reddit_recovery": "https://www.reddit.com/r/spacex/comments/a3n3vm/crs16_emergency_recovery_thread/",
      "reddit_media": "https://www.reddit.com/r/spacex/comments/a2uojp/rspacex_crs16_media_thread_videos_images_gifs/",
      "presskit": "https://www.spacex.com/sites/spacex/files/crs16_press_kit_12_4.pdf",
      "article_link": "https://spaceflightnow.com/2018/12/05/spacex-falcon-9-boosts-dragon-cargo-ship-to-orbit-first-stage-misses-landing-target/",
      "wikipedia": "https://en.wikipedia.org/wiki/SpaceX_CRS-16",
      "video_link": "https://www.youtube.com/watch?v=Esh1jHT9oTA",
      "youtube_id": "Esh1jHT9oTA",
      "flickr_images": [
        "https://farm5.staticflickr.com/4835/45473442624_69ee8bee45_o.jpg",
        "https://farm5.staticflickr.com/4903/45473443604_0d668c31da_o.jpg",
        "https://farm5.staticflickr.com/4858/45473444314_413a344dcb_o.jpg",
        "https://farm5.staticflickr.com/4856/45473445134_d9384878f8_o.jpg",
        "https://farm5.staticflickr.com/4840/45473446114_7d5e5d6fe2_o.jpg"
      ]
    },
    "details": "SpaceX's 16th Crew Resupply Mission on behalf of NASA, with a total of 20 contracted flights. This will bring essential supplies to the International Space Station using SpaceX's reusable Dragon spacecraft. The Falcon 9 will launch from SLC-40 at Cape Canaveral Air Force Station. During the landing of the first stage, a grid fin hydraulic pump stalled, causing the core to enter an uncontrolled roll, and resulting in a (succesful) water landing.",
    "upcoming": false,
    "static_fire_date_utc": "2018-11-30T19:57:00.000Z",
    "static_fire_date_unix": 1543607820,
    "timeline": {
      "webcast_liftoff": 900,
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
      "maxq": 58,
      "meco": 143,
      "stage_sep": 146,
      "second_stage_ignition": 153,
      "first_stage_boostback_burn": 159,
      "first_stage_entry_burn": 395,
      "first_stage_landing": 497,
      "seco-1": 526,
      "dragon_separation": 591,
      "dragon_solar_deploy": 660,
      "dragon_bay_door_deploy": 8400
    }
  },
  {
    "flight_number": 73,
    "mission_name": "GPS III SV01",
    "mission_id": [],
    "launch_year": "2018",
    "launch_date_unix": 1545573060,
    "launch_date_utc": "2018-12-23T13:51:00.000Z",
    "launch_date_local": "2018-12-23T08:51:00-05:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 1560,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1054",
            "flight": 1,
            "block": 5,
            "gridfins": false,
            "legs": false,
            "reused": false,
            "land_success": null,
            "landing_intent": false,
            "landing_type": null,
            "landing_vehicle": null
          }
        ]
      },
      "second_stage": {
        "block": 5,
        "payloads": [
          {
            "payload_id": "GPS III SV01",
            "norad_id": [
              43873
            ],
            "reused": false,
            "customers": [
              "USAF"
            ],
            "nationality": "United States",
            "manufacturer": "Lockheed Martin",
            "payload_type": "Satellite",
            "payload_mass_kg": 4400,
            "payload_mass_lbs": 9700.34,
            "orbit": "MEO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "semi-synchronous",
              "longitude": null,
              "semi_major_axis_km": 26559.551,
              "eccentricity": 0.0005338,
              "periapsis_km": 20167.239,
              "apoapsis_km": 20195.594,
              "inclination_deg": 55.0018,
              "period_min": 717.944,
              "lifespan_years": 15,
              "epoch": "2019-02-04T17:47:41.000Z",
              "mean_motion": 2.00572622,
              "raan": 198.4281,
              "arg_of_pericenter": 271.2434,
              "mean_anomaly": 88.6636
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
    "ships": [],
    "telemetry": {
      "flight_club": null
    },
    "launch_site": {
      "site_id": "ccafs_slc_40",
      "site_name": "CCAFS SLC 40",
      "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/e1/cb/cvLgCm0d_o.png",
      "mission_patch_small": "https://images2.imgbox.com/b3/24/vKUtLIu9_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/a4516o/gps_iii2_launch_campaign_thread/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/a71wyn/rspacex_gps_iii2_official_launch_discussion/",
      "reddit_recovery": null,
      "reddit_media": "https://www.reddit.com/r/spacex/comments/a73kz5/rspacex_gps_iii2_media_thread_videos_images_gifs/",
      "presskit": "https://www.spacex.com/sites/spacex/files/gps_iii_press_kit.pdf",
      "article_link": "https://spaceflightnow.com/2018/12/23/spacex-closes-out-year-with-successful-gps-satellite-launch/",
      "wikipedia": "https://en.wikipedia.org/wiki/GPS_Block_IIIA",
      "video_link": "https://youtu.be/yRiLPoy_Mzc",
      "youtube_id": "yRiLPoy_Mzc",
      "flickr_images": [
        "https://farm5.staticflickr.com/4864/45715171884_f1dd88c058_o.jpg",
        "https://farm8.staticflickr.com/7926/45525648155_32fdab17a5_o.jpg",
        "https://farm8.staticflickr.com/7876/45525649035_ba60162fe0_o.jpg",
        "https://farm8.staticflickr.com/7853/45525649825_e6d35415e1_o.jpg",
        "https://farm5.staticflickr.com/4893/45525650685_02b408c385_o.jpg"
      ]
    },
    "details": "SpaceX's twenty-first flight of 2018 launched the first of the new GPS III satellites (Block IIIA) for the United States Air Force and was SpaceX's first EELV mission. The spacecraft was delivered to a MEO transfer orbit from SLC-40 at Cape Canaveral Air Force Station. This mission was the first to fly with the redesigned COPV on the first stage (B1054) as well as the second. The booster was expended.",
    "upcoming": false,
    "static_fire_date_utc": "2018-12-13T21:24:00.000Z",
    "static_fire_date_unix": 1544736240,
    "timeline": {
      "webcast_liftoff": 420,
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
      "maxq": 64,
      "meco": 164,
      "stage_sep": 168,
      "second_stage_ignition": 170,
      "fairing_deploy": 202,
      "seco-1": 496,
      "second_stage_restart": 4131,
      "seco-2": 4177,
      "payload_deploy": 6977
    }
  },
  {
    "flight_number": 74,
    "mission_name": "Iridium NEXT Mission 8",
    "mission_id": [
      "F3364BF"
    ],
    "launch_year": "2019",
    "launch_date_unix": 1547220660,
    "launch_date_utc": "2019-01-11T15:31:00.000Z",
    "launch_date_local": "2019-01-11T07:31:00-08:00",
    "is_tentative": false,
    "tentative_max_precision": "hour",
    "tbd": false,
    "launch_window": 0,
    "rocket": {
      "rocket_id": "falcon9",
      "rocket_name": "Falcon 9",
      "rocket_type": "FT",
      "first_stage": {
        "cores": [
          {
            "core_serial": "B1049",
            "flight": 2,
            "block": 5,
            "gridfins": true,
            "legs": true,
            "reused": true,
            "land_success": true,
            "landing_intent": true,
            "landing_type": "ASDS",
            "landing_vehicle": "JRTI"
          }
        ]
      },
      "second_stage": {
        "block": 5,
        "payloads": [
          {
            "payload_id": "Iridium NEXT 8",
            "norad_id": [
              43922,
              43923,
              43924,
              43925,
              43926,
              43927,
              43928,
              43929,
              43930,
              43931
            ],
            "reused": false,
            "customers": [
              "Iridium Communications"
            ],
            "nationality": "United States",
            "manufacturer": "Thales Alenia Space",
            "payload_type": "Satellite",
            "payload_mass_kg": 9600,
            "payload_mass_lbs": 21164.38,
            "orbit": "PO",
            "orbit_params": {
              "reference_system": "geocentric",
              "regime": "low-earth",
              "longitude": null,
              "semi_major_axis_km": 7155.799,
              "eccentricity": 0.0001578,
              "periapsis_km": 776.534,
              "apoapsis_km": 778.793,
              "inclination_deg": 86.3952,
              "period_min": 100.403,
              "lifespan_years": 15,
              "epoch": "2019-02-04T11:45:18.000Z",
              "mean_motion": 14.34219278,
              "raan": 37.5829,
              "arg_of_pericenter": 49.2066,
              "mean_anomaly": 310.9266
            }
          }
        ]
      },
      "fairings": {
        "reused": false,
        "recovery_attempt": false,
        "recovered": null,
        "ship": null
      }
    },
    "ships": [
      "JRTI-2",
      "NRCQUEST",
      "PACIFICFREEDOM"
    ],
    "telemetry": {
      "flight_club": "https://www.flightclub.io/result?code=IRD8"
    },
    "launch_site": {
      "site_id": "vafb_slc_4e",
      "site_name": "VAFB SLC 4E",
      "site_name_long": "Vandenberg Air Force Base Space Launch Complex 4E"
    },
    "launch_success": true,
    "links": {
      "mission_patch": "https://images2.imgbox.com/80/ae/1JL1ZzXD_o.png",
      "mission_patch_small": "https://images2.imgbox.com/11/f0/xPDcIpmS_o.png",
      "reddit_campaign": "https://www.reddit.com/r/spacex/comments/a699fh/iridium_next_constellation_mission_8_launch/",
      "reddit_launch": "https://www.reddit.com/r/spacex/comments/aemq2i/rspacex_iridium_next_8_official_launch_discussion/",
      "reddit_recovery": "https://www.reddit.com/r/spacex/comments/aewp4r/iridium_8_recovery_thread/",
      "reddit_media": "https://www.reddit.com/r/spacex/comments/aeoxve/rspacex_iridium_next_8_media_thread_videos_images/",
      "presskit": "https://www.spacex.com/sites/spacex/files/iridium8presskit.pdf",
      "article_link": "https://spaceflightnow.com/2019/01/11/spacex-begins-2019-with-eighth-and-final-for-upgraded-iridium-network/",
      "wikipedia": "https://en.wikipedia.org/wiki/Iridium_satellite_constellation#Next-generation_constellation",
      "video_link": "https://youtu.be/VshdafZvwrg",
      "youtube_id": "VshdafZvwrg",
      "flickr_images": [
        "https://farm5.staticflickr.com/4866/39745612523_14270b4b9d_o.jpg",
        "https://farm8.staticflickr.com/7833/39745612923_21aa442350_o.jpg",
        "https://farm5.staticflickr.com/4881/39745613173_e99b09c000_o.jpg",
        "https://farm8.staticflickr.com/7882/39745613513_6cdd4581af_o.jpg",
        "https://farm8.staticflickr.com/7807/39745613733_1a7b70e54a_o.jpg",
        "https://farm5.staticflickr.com/4891/39745614053_43855205bc_o.jpg"
      ]
    },
    "details": "SpaceX's first flight of 2019 will be the eighth and final launch of its planned Iridium flights. Delivering 10 satellites to low earth orbit, this brings the total up to 75 and completes the Iridium NEXT constellation. This mission launches from SLC-4E at Vandenberg AFB. The booster is expected to land on JRTI.",
    "upcoming": false,
    "static_fire_date_utc": "2019-01-06T13:51:00.000Z",
    "static_fire_date_unix": 1546782660,
    "timeline": {
      "webcast_liftoff": 960,
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
      "maxq": 61,
      "meco": 147,
      "stage_sep": 150,
      "second_stage_ignition": 158,
      "fairing_deploy": 193,
      "first_stage_boostback_burn": 193,
      "first_stage_entry_burn": 330,
      "first_stage_landing": 434,
      "seco-1": 526,
      "second_stage_restart": 3108,
      "seco-2": 3111,
      "payload_deploy": 3412
    }
  }
]
"""
        
        guard let jsonData = json.data(using: .utf8) else {
            XCTFail("Failed to encode")
            return
        }
        
        guard let companyInfo = try? JSONDecoder().decode([LaunchInfo].self, from: jsonData) else {
            XCTFail("Failed to decode")
            return
        }
        debugPrint(companyInfo.first?.flight_number)
        
//        do {
//            // make sure this JSON is in the format we expect
//            if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
//                // try to read out a string array
//                print(json)
////                if let names = json["names"] as? [String] {
////                    print(names)
////                }
//            }
//        } catch let error as NSError {
//            print("Failed to load: \(error.localizedDescription)")
//        }
//
//          do {
//            let decodedResponse = try JSONDecoder().decode([LaunchInfo].self, from: jsonData)
//            DispatchQueue.main.async {
//                print("JSON decode success: \(decodedResponse.first?.flight_number)")
//             }
//          } catch {
////            print("JSON decode failed: \(jsonError.localizedDescription)")
//              print(String(describing: error))
//          }
        
        XCTAssertNotNil(companyInfo)
    }
}
