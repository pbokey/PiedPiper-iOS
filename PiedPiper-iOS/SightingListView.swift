//
//  SightingList.swift
//  PiedPiper-iOS
//
//  Created by Pranav Bokey on 12/2/17.
//  Copyright © 2017 Pranav Bokey. All rights reserved.
//

import UIKit

class SightingListView: UITableViewController {
    var sightingList = [RatSighting]()
    @IBOutlet var tableViewStoryboard: UITableView!
    var valueToPass : RatSighting? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Sighting List Loaded")
        let sightingListClassRef = RatSightingList()
        sightingListClassRef.databaseListUpdate { (data) in
            print(data)
            self.sightingList = data
            self.tableViewStoryboard.reloadData()
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sightingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RatSightingCell", for: indexPath) as! RatSightingCellView
        cell.idLabel?.text = sightingList[indexPath.row].uniqueKey
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sighting = sightingList[indexPath.row]
        valueToPass = sighting
        performSegue(withIdentifier: "detailView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailView") {
            let sightingDetailView = segue.destination as! SightingTableView
            sightingDetailView.sighting = valueToPass
        }
    }
    
    

}
