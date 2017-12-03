//
//  GraphViewController.swift
//  PiedPiper-iOS
//
//  Created by Pranav Bokey on 12/3/17.
//  Copyright © 2017 Pranav Bokey. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController {
    var sightingList = [RatSighting]()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let list = RatSightingList()
        list.databaseListUpdate { (arr) in
            self.sightingList = arr
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
