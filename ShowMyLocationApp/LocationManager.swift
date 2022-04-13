//
//  LocationManager.swift
//  ShowMyLocationApp
//
//  Created by Ayesha Ilyas on 4/13/22.
//

import Foundation
import MapKit

class LocationManager: NSObject, ObservableObject {
    // cl is for current location
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation? = nil 
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone // a constant indicating that all movement should be indicated
        
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        self.location = location
    }
}
