//
//  SpashScreenViewController.swift
//  PiedPiper-iOS
//
//  Created by Pranav Bokey on 11/29/17.
//  Copyright © 2017 Pranav Bokey. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class SplashScreenViewController: UIViewController {
    
    
    @IBAction func loginButton(_ sender: Any) {
        print("login button pressed")
        performSegue(withIdentifier: "login", sender: sender)
    }
    
    @IBAction func registerButton(_ sender: Any) {
        print("register button pressed")
        performSegue(withIdentifier: "registerTest", sender: sender)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (Auth.auth().currentUser != nil) {
            //User is signed in
            //Seque to home screen
            print("User is logged in")
            performSegue(withIdentifier: "splashMain", sender: nil)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
