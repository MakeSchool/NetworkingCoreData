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
  let latitude: Double?
  let longitude: Double?
  let name: String?
  
  init?(json: JSON) {
    self.latitude = "latitude" <~~ json
    self.longitude = "longitude" <~~ json
    self.name = "name" <~~ json
  }
}