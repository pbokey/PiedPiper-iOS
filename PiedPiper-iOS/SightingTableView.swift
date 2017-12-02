//
//  SightingTableView.swift
//  PiedPiper-iOS
//
//  Created by Pranav Bokey on 12/2/17.
//  Copyright © 2017 Pranav Bokey. All rights reserved.
//

import UIKit

class SightingTableView: UIViewController {
    
    var sighting : RatSighting? = nil
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var enterBorough: UILabel!
    @IBOutlet weak var enterLocation: UILabel!
    @IBOutlet weak var enterZip: UILabel!
    @IBOutlet weak var enterDate: UILabel!
    @IBOutlet weak var enterLatitude: UILabel!
    @IBOutlet weak var enterLongitude: UILabel!
    @IBOutlet weak var enterUnique: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let sight = sighting {
            cityLabel.text = sight.city
            enterBorough.text = sight.borough
            enterLocation.text = sight.locationType
            enterZip.text = sight.incidentZip
            enterDate.text = sight.createdDate
            enterLatitude.text = sight.latitude
            enterLongitude.text = sight.longitude
            enterUnique.text = sight.uniqueKey
        } else {
            print("Sighting was nil")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
