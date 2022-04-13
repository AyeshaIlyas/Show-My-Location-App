//
//  ContentView.swift
//  ShowMyLocationApp
//
//  Created by Ayesha Ilyas on 4/13/22.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var locationManager = CLLocationManager()
    func setupManager() {
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
}

struct ContentView: View {
    @ObservedObject private var locationManager = LocationManager()
    
    var body: some View {
        let coordinate = self.locationManager.location != nil ? self.locationManager.location!.coordinate : CLLocationCoordinate2D()
        
        VStack {
            Text("Show my location")
                .fontWeight(.bold)
                .font(.largeTitle)
            
            MapView()
            
            Text("Your coordinates")
                .font(.title)
                .padding(.top, 10)
            
            Text("Latitude: \(coordinate.latitude)")
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
            
            Text("Longitude: \(coordinate.longitude)")
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 10)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
