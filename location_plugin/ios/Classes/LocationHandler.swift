//
//  LocationHandler.swift
//  location_plugin
//
//  Created by Mario Gorki on 4/1/22.
//

import Foundation
import CoreLocation

enum LocationResultType{
    case received(latitude: Double, longitude: Double)
    case unavailable
}

typealias LocationResultCallback = (LocationResultType) -> Void

class LocationHandler: NSObject, CLLocationManagerDelegate{
    
    var locationManager: CLLocationManager
    var callback: LocationResultCallback?
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        
        locationManager.delegate = self
    }
    
    deinit {
        locationManager.delegate = nil
    }
    
    func requestLocation(callback: @escaping LocationResultCallback){
        //clear old callbacks
        result(res: .unavailable)
        
        self.callback = callback
        
        checkForPermissionsAndRequestLocation()
    }
    
    private func checkForPermissionsAndRequestLocation() {
        let status: CLAuthorizationStatus
        
        if #available(iOS 14.0, *) {
           status = locationManager.authorizationStatus
        } else {
            status = CLLocationManager.authorizationStatus()
        }
        
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            result(res: .unavailable)
        case .authorizedAlways, .authorizedWhenInUse, .authorized:
            locationManager.requestLocation()
        @unknown default:
            result(res: .unavailable)
        }
    }
    
    
    private func result(res: LocationResultType) {
        if let cb = callback {
            cb(res)
            callback = nil
        }
    }
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        result(res: .received(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
    }
    
    internal func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
         if let cb = callback {
          checkForPermissionsAndRequestLocation()
         }

    }
    
    internal func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        result(res: .unavailable)
    }
}
