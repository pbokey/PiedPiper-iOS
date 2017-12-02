//
//  ViewController.swift
//  PiedPiper-iOS
//
//  Created by Pranav Bokey on 11/29/17.
//  Copyright © 2017 Pranav Bokey. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
        if (emailTextField.text == "") {
            let alertController = UIAlertController(title: "Invalid Email", message: "Please Enter an Email", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        } else if (passwordTextField.text == "") {
            let alertController = UIAlertController(title: "Empty Password", message: "Please Enter Your Password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        } else {
            Auth.auth().signIn(withEmail: self.emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                let ref: DatabaseReference = Database.database().reference()
                ref.child("Log").removeValue()
                let today = DateTime.getTodayString()
                let username = self.emailTextField.text!.components(separatedBy: "@")[0]
                if (error == nil) {
                    print("You have logged in")
                    ref.child("Log").child("\(today)").setValue("\(username): log in successful")
                    self.performSegue(withIdentifier: "loginMain", sender: nil)
                } else {
                    ref.child("Log").child("\(today)").setValue("\(username): login failed")
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        performSegue(withIdentifier: "loginCancel", sender: sender)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ref: DatabaseReference = Database.database().reference()
        ref.child("log").removeValue()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

