//
//  JSONWaypoint.swift
//  NetworkingCoreData
//
//  Created by Benjamin Encz on 10/30/15.
//  Copyright © 2015 Make School. All rights reserved.
//

import Foundation
import Gloss

struct JSONWaypoint: Decodable {
  var name: String?
  var longitude: Double?
  var latitude: Double?
  
  init?(json: JSON) {
    name = "name" <~~ json
    longitude = "longitude" <~~ json
    latitude = "latitude" <~~ json
  }
}