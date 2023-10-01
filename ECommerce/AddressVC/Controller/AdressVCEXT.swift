//
//  AdressVCEXT.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 02/07/1402 AP.
//

import Foundation
import UIKit
import MapKit
import CoreLocation
extension AddressVC: CLLocationManagerDelegate, MKMapViewDelegate{
    
    // Check Authentication and if updated
    
    func checkAuthization(){
        switch locationManager.authorizationStatus{
        case .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            mapKit.showsUserLocation = true
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
            break
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            mapKit.showsUserLocation = true
            break
        case .denied:
            showAlert(message: "Please give access to location")
            break
        case .restricted:
            showAlert(message: "Authorized restericted")
            break
        default:
            print("default")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status{
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
            break
        case .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            mapKit.showsUserLocation = true
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            mapKit.showsUserLocation = true
            break
        case .denied:
            showAlert(message: "Please give access to location")
            break
        default:
            print("Unknown case location permission")
        }
    }
  
    // Handle movment on map
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            print("Location:\(location.coordinate)")
            let region = mapManager.startRegion(location: location, distance: 500)
            self.firebaseManger.addLocation(location: location, documentName: "location")
            let annotations = mapKit.annotations
            mapKit.removeAnnotations(annotations)
            mapKit.setRegion(region, animated: true)
          CraeteAnnotion(location: location,title: "write location")
        }
    }
    
    // draw Path and directions
    
    func drawDirections(startLocation: CLLocationCoordinate2D, destinationLoc: CLLocationCoordinate2D){
        let startingPlace = MKPlacemark(coordinate: startLocation)
        let destinationPlace = MKPlacemark(coordinate: destinationLoc)
        
        let startringItem = MKMapItem(placemark: startingPlace)
        let destinationItem = MKMapItem(placemark: destinationPlace)
        
        let request = MKDirections.Request()
        request.source = startringItem
        request.destination = destinationItem
        request.transportType = .automobile
      //  request.requestsAlternateRoutes = true
        
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard let response = response else {
                if let error = error{
                    print("directions Error : \(error.localizedDescription)")
                }
                return
            }
            for route in response.routes{
                self.mapKit.addOverlay(route.polyline)
                self.mapKit.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let render = MKPolygonRenderer(overlay: overlay as! MKPolyline)
        render.strokeColor = .darkBlue
        return render
    }
}
