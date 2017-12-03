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
    
//    public var sightingList: [RatSighting] = []
    @IBAction func mapButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        present(MapController(), animated: true, completion: nil)
    }
    
    @IBAction func logout(_ sender: Any) {
        if let _ = try? Auth.auth().signOut() {
            performSegue(withIdentifier: "logout", sender: sender)
        } else {
            
        }
    }

//    @IBAction func showMap(_sender: Any) {
//        dismiss(animated: true, completion: nil)
//        present(MapController, true, nil)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
