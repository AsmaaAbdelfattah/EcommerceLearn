//
//  MapManager.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 01/07/1402 AP.
//

import Foundation
import MapKit
//import CoreLocation
class MapManager{
    
    func startRegion(location : CLLocation , distance: CLLocationDistance) -> MKCoordinateRegion{
        MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distance, longitudinalMeters: distance)
    }
    // Check Location Enable
    func isLocationServiceEnabled() -> Bool{
        return CLLocationManager.locationServicesEnabled()
    }
    //Check Autherization
    
}
