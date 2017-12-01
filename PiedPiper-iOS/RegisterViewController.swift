//
//  RegisterViewController.swift
//  PiedPiper-iOS
//
//  Created by Pranav Bokey on 11/29/17.
//  Copyright © 2017 Pranav Bokey. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func register(_ sender: Any) {
        if (emailTextField.text == "") {
            let alertController = UIAlertController(title: "Invalid Email", message: "Please Enter a Valid Email Address", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        } else if (passwordTextField.text == "") {
            let alertController = UIAlertController(title: "Invalid Password", message: "Please Enter your Password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                if (error == nil) {
                    print("You have Registered")
//                    let alertController = UIAlertController(title: "Success", message: "Successfuly Registered", preferredStyle: .alert)
//                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                    alertController.addAction(defaultAction)
//                    self.present(alertController, animated: true, completion: nil)
                    self.performSegue(withIdentifier: "registerMain", sender: nil)
                    //main menu seque here
                } else {
                    let alertController = UIAlertController(title: "Error", message: error.debugDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func goToSplash(_ sender: Any) {
        performSegue(withIdentifier: "registerSplash", sender: sender)
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
