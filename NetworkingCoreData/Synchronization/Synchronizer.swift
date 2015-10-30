//
//  Synchronizer.swift
//  NetworkingCoreData
//
//  Created by Benjamin Encz on 10/30/15.
//  Copyright © 2015 Make School. All rights reserved.
//

import Foundation
import CoreData

typealias SynchronizerCallback = ([Trip]) -> Void

class Synchronizer {
  
  var managedObjectContext: NSManagedObjectContext
  
  init(managedObjectContext: NSManagedObjectContext) {
    self.managedObjectContext = managedObjectContext
  }
  
  func sync(callback: SynchronizerCallback) {
    let coreDataClient = CoreDataClient(managedObjectContext: self.managedObjectContext)
    
    APIClient().fetchTrips { trips in
      let coreDataTripIds = coreDataClient.allTrips().map { $0.serverID! }
      let newServerTrips = trips?.filter {
        !coreDataTripIds.contains($0.serverID!)
      }
      
      newServerTrips?.forEach {
        let trip = Trip(context: self.managedObjectContext, jsonTrip: $0)
        
        $0.waypoints?.forEach {
          let waypoint = Waypoint(context: self.managedObjectContext, jsonWaypoint: $0)
          waypoint.trip = trip
        }
      }
      
      try! self.managedObjectContext.save()
      
      let trips = coreDataClient.allTrips()
      callback(trips)
    }
  }
  
}