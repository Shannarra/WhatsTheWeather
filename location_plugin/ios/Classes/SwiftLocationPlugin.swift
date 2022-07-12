import Flutter
import UIKit

public class SwiftLocationPlugin: NSObject, FlutterPlugin, LocationApi {
    
    var handler: LocationHandler
    
    public override init() {
        self.handler = LocationHandler()
        super.init()
    }
    
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let api : LocationApi & NSObjectProtocol = SwiftLocationPlugin.init()
        LocationApiSetup(registrar.messenger(), api)
    }
    
    public func getCurrentLocation(completion: @escaping (LocationResult?, FlutterError?) -> Void) {
        handler.requestLocation() {
            status in
            
            switch status {
            case .received(latitude: let latitude, longitude: let longitude):
                completion(LocationResult.make(withLatitude: NSNumber(value: latitude), longitude: NSNumber(value: longitude)), nil)
            case .unavailable:
                completion(nil, nil)
            }
        }
    }
    
    
}
