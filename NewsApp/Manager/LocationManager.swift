//
//  LocationManager.swift
//  NewsApp
//
//  Created by Olanrewaju Olakunle  on 18/03/2025.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    @Published var countryCode: String?
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization() // Request permission
        self.locationManager.startUpdatingLocation() // Start getting location
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        fetchCountry(from: location)
        locationManager.stopUpdatingLocation() // Stop updating once we get location
    }
    
    func fetchCountry(from location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let country = placemarks?.first?.isoCountryCode {
                DispatchQueue.main.async {
                    self.countryCode = country.lowercased() // Example: "us", "gb", "ng"
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location: \(error.localizedDescription)")
    }
}

