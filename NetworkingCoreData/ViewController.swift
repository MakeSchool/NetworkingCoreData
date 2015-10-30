//
//  ViewController.swift
//  NetworkingCoreData
//
//  Created by Benjamin Encz on 10/30/15.
//  Copyright © 2015 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var tableView: UITableView!
  
  var trips: [JSONTrip] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
  }
  
  override func viewWillAppear(animated: Bool) {
    APIClient().fetchTrips { result in
      if let result = result {
        self.trips = result
        
        dispatch_async(dispatch_get_main_queue()) {
            self.tableView.reloadData()
        }
        
      }
    }
  }

}

extension ViewController: UITableViewDataSource {
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("TripCell")!
    
    cell.textLabel?.text = trips[indexPath.row].tripName ?? ""
    
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return trips.count
  }
  
}