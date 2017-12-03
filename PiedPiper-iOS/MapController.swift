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
    
    override func loadView() {
        super.loadView()
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        //var mapView = MapView(frame: <#T##CGRect#>(x: 0, y: 0))
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
