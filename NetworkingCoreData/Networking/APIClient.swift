//
//  APIClient.swift
//  NetworkingCoreData
//
//  Created by Benjamin Encz on 10/30/15.
//  Copyright © 2015 Make School. All rights reserved.
//

import Foundation
import Gloss

class APIClient {
  
  typealias FetchTripsCallback = ([JSONTrip]?) -> Void
  
  func fetchTrips(callback: FetchTripsCallback) {
    let session = NSURLSession.sharedSession()
    
    let maybeURL = NSURL(string: "https://bit.ly/mstrips")
    
    guard let url = maybeURL else {
      print("Invalid Endpoint URL")
      callback(nil)
      return
    }
    
    let urlRequest = NSURLRequest(URL: url)
    let dataTask = session.dataTaskWithRequest(urlRequest) { data, response, error in
      if let data = data {
        let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0)) as! [JSON]
        let trips = JSONTrip.modelsFromJSONArray(json)
        
        callback(trips)
      } else {
        callback(nil)
      }
    }
    
    dataTask.resume()
  }
  
}