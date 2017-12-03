//
//  RatSightingList.swift
//  PiedPiper-iOS
//
//  Created by Pranav Bokey on 11/30/17.
//  Copyright © 2017 Pranav Bokey. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class RatSightingList {
    var sightingList = [RatSighting]()
    
    public func databaseListUpdate(callback: @escaping ((_ data: [RatSighting]) -> Void)) {
        let ref: DatabaseReference = Database.database().reference().child("sightings")
        ref.queryLimited(toLast: 500).observeSingleEvent(of: .value, with:     { (snapshot) in
            print(snapshot.childrenCount)
            var result = [RatSighting]()
            let enumerator = snapshot.children
            while let sighting = enumerator.nextObject() as? DataSnapshot {
                let sightingDict = sighting.value as! NSDictionary
                let borough = sightingDict["Borough"] as! String
                let city = sightingDict["City"] as! String
                let createdDate = sightingDict["Created Date"] as! String
                let incidentAddress = sightingDict["Incident Address"] as! String
                let incidentZip = sightingDict["Incident Zip"] as! String
                let latitude = sightingDict["Latitude"] as! String
                let locationType = sightingDict["Location Type"] as! String
                let longitude = sightingDict["Longitude"] as! String
                let uniqueKey = sightingDict["Unique Key"] as! String
                result.append(RatSighting(uniqueKey: uniqueKey, createdDate: createdDate, locationType: locationType, incidentZip: incidentZip, incidentAddress: incidentAddress, city: city, borough: borough, latitude: latitude, longitude: longitude))
            }
            callback(result)
        })
    }
}
