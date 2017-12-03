//
//  CreateRatSightingController.swift
//  PiedPiper-iOS
//
//  Created by Pranav Bokey on 12/2/17.
//  Copyright © 2017 Pranav Bokey. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CreateRatSightingController: UIViewController {

    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var borough: UITextField!
    @IBOutlet weak var locationType: UITextField!
    @IBOutlet weak var zip: UITextField!
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var longitude: UITextField!
    @IBOutlet weak var incidentAddress: UITextField!
    
    
    @IBAction func addButton(_ sender: Any) {
        let status = verify()
        if (!status) {
            let alertController = UIAlertController(title: "Error", message: "Please enter at least a city and a date", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        var ref = Database.database().reference().child("sightings")
        fixNilErrors()
        let newSighting = RatSighting(uniqueKey: "", createdDate: date.text!, locationType: locationType.text!, incidentZip: zip.text!, incidentAddress: incidentAddress.text!, city: city.text!, borough: borough.text!, latitude: latitude.text!, longitude: longitude.text!)
        ref = ref.childByAutoId()
        newSighting.setKey(key: ref.key)
        print(newSighting.uniqueKey)
        let sightingDict = ["Borough" : newSighting.borough, "City" : newSighting.city, "Created Date" : newSighting.createdDate, "Incident Address" : newSighting.incidentAddress, "Incident Zip" : newSighting.incidentZip, "Latitude" : newSighting.latitude, "Location Type" : newSighting.locationType, "Longitude" : newSighting.longitude, "Unique Key" : newSighting.uniqueKey]
        ref.setValue(sightingDict)
        performSegue(withIdentifier: "createBackToMain", sender: sender)
    }
    
    func verify() -> Bool {
        if (city.text?.count == 0 || city.text == " ") {
            return false
        }
        if (date.text?.count == 0 || date.text == " ") {
            return false
        }
        return true
    }
    
    func fixNilErrors() {
        if let _ = borough.text {
            
        } else {
            borough.text = ""
        }
        if let _ = zip.text {
            
        } else {
            zip.text = ""
        }
        if let _ = latitude.text {
            
        } else {
            latitude.text = ""
        }
        if let _ = longitude.text {
            
        } else {
            longitude.text = ""
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
