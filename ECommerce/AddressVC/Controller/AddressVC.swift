//
//  AdressVC.swift
//  ECommerce
//
//  Created by Asmaa_Abdelfattah on 01/07/1402 AP.
//

import UIKit
import MapKit
import CoreLocation
class AddressVC: UIViewController{
    
    @IBOutlet weak var mapKit: MKMapView!
    var mapManager = MapManager()
    var firebaseManger = FireStoreManager()
    var locationManager = CLLocationManager()
    var startLocation = CLLocation(latitude: 30.011680, longitude: 31.206560)
    var endLocation = CLLocation(latitude: 24.693719, longitude: 46.723596)
    var isTracked = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        mapKit.delegate = self
        mapKit.showsUserLocation = true
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.allowsBackgroundLocationUpdates = true
        if mapManager.isLocationServiceEnabled(){
            checkAuthization()
        }else{
            showAlert(message: "Please Enable Location Service")
        }
    }
    
    @IBAction func startTrack(_ sender: Any) {
        isTracked = !isTracked
        if isTracked{
            locationManager.startUpdatingLocation()
            readLoacation()
            
        }
        
        //        if let userLoc = locationManager.location{
        //            drawDirections(startLocation: userLoc.coordinate, destinationLoc: mapKit.centerCoordinate)
        //        }
    }

    @IBAction func stopTrack(_ sender: Any) {
        isTracked = false
        locationManager.stopUpdatingLocation()
    }
    
    func CraeteAnnotion(location : CLLocation , title: String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = location.coordinate
        annotation.title = title
        mapKit.addAnnotation(annotation)
    }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default))
        alert.addAction(UIAlertAction(title: "Settings", style: .default,handler: { action in
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        }))
        present(alert, animated: true)
    }
    
    func readLoacation(){
        firebaseManger.getLocations { response, error in
            if let error = error {
                print(error.localizedDescription)
            }
            if let location = response?.first{
                let Location = CLLocation(latitude: Double(location.latitude)!, longitude: Double(location.longtitude)!)
                let region =  self.mapManager.startRegion(location: Location, distance: 500)
                let annotations = self.mapKit.annotations
//                self.mapKit.removeAnnotations(annotations)
//                self.mapKit.setRegion(region, animated: true)
                self.CraeteAnnotion(location: Location,title: "Read Firebase")
            }
        }
    }
}
