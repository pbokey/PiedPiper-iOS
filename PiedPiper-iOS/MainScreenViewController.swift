//
//  MainScreenViewController.swift
//  PiedPiper-iOS
//
//  Created by Pranav Bokey on 11/29/17.
//  Copyright © 2017 Pranav Bokey. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class MainScreenViewController: UIViewController {
    
    public var sightingList = [RatSighting]()
    
    @IBAction func logout(_ sender: Any) {
        if let _ = try? Auth.auth().signOut() {
            performSegue(withIdentifier: "logout", sender: sender)
        } else {
            
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let database = RatSightingList()
//        database.databaseListUpdate { (arr) in
//            print(arr.count)
//            self.sightingList = arr
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
