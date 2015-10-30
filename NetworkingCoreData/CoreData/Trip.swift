//
//  Trip.swift
//  NetworkingCoreData
//
//  Created by Benjamin Encz on 10/30/15.
//  Copyright © 2015 Make School. All rights reserved.
//

import Foundation
import CoreData


class Trip: NSManagedObject {

  convenience init(context: NSManagedObjectContext) {
    let entityDescription = NSEntityDescription.entityForName("Trip", inManagedObjectContext:
    context)!
    self.init(entity: entityDescription, insertIntoManagedObjectContext: context)
  }
  
  convenience init(context: NSManagedObjectContext, jsonTrip: JSONTrip) {
    let entityDescription = NSEntityDescription.entityForName("Trip", inManagedObjectContext:
    context)!
    self.init(entity: entityDescription, insertIntoManagedObjectContext: context)
      
    name = jsonTrip.tripName
  }

}
