//
//  RatSighting.swift
//  PiedPiper-iOS
//
//  Created by Pranav Bokey on 11/30/17.
//  Copyright © 2017 Pranav Bokey. All rights reserved.
//

import Foundation

class RatSighting {
    var uniqueKey: String;
    var createdDate: String;
    var locationType: String;
    var incidentZip: String;
    var incidentAddress: String;
    var city: String;
    var borough: String;
    var latitude: String;
    var longitude: String;
    
    init(uniqueKey: String, createdDate: String, locationType: String, incidentZip: String, incidentAddress: String, city: String, borough: String, latitude: String, longitude: String) {
        self.uniqueKey = uniqueKey
        self.createdDate = createdDate
        self.locationType = locationType
        self.incidentZip = incidentZip
        self.incidentAddress = incidentAddress
        self.city = city
        self.borough = borough
        self.latitude = latitude
        self.longitude = longitude
    }
    
    public func setKey(key: String) -> Void {
        self.uniqueKey = key
    }
}
