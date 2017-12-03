//
//  MapController.swift
//  PiedPiper-iOS
//
//  Created by Rahul Ajmera on 12/2/17.
//  Copyright © 2017 Pranav Bokey. All rights reserved.
//

import UIKit
import GoogleMaps

class MapController: UIViewController {
    var sightingList = [RatSighting]()
    
    override func loadView() {
        super.loadView()
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        // var mapView = MapView(frame: <#T##CGRect#>(x: 0, y: 0))
        let list = RatSightingList()
        list.databaseListUpdate { (arr) in
            self.sightingList = arr
            let camera = GMSCameraPosition.camera(withLatitude: Double(self.sightingList[0].latitude)!, longitude: Double(self.sightingList[0].longitude)!, zoom: 10.0)
            let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
            self.view = mapView
            for item in self.sightingList {
                print(item.latitude)
                print(item.longitude)
                let lat = Double(item.latitude)
                let lon = Double(item.longitude)
                if (lat != nil && lon != nil) {
                    let marker = GMSMarker()
                    marker.position = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)
                    marker.title = item.uniqueKey
                    marker.snippet = item.createdDate
                    marker.map = mapView
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
