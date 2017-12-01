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
    var ref: DatabaseReference = Database.database().reference()
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
                if (error == nil) {
                    print("You have logged in")
                    self.ref.child("logging").child("success").child(Auth.auth().currentUser!.uid).childByAutoId().setValue("LOGIN SUCCESSFUL: \(self.getTodayString())")
                    self.performSegue(withIdentifier: "loginMain", sender: nil)
                } else {
                    self.ref.child("logging").child("failure").child(self.emailTextField.text!).childByAutoId().setValue("LOGIN FAILED: \(self.getTodayString())")
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    func getTodayString() -> String{
        
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        let year = components.year
        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        let second = components.second
        
        let today_string = String(year!) + "-" + String(month!) + "-" + String(day!) + " " + String(hour!)  + ":" + String(minute!) + ":" +  String(second!)
        
        return today_string
        
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        performSegue(withIdentifier: "loginCancel", sender: sender)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

