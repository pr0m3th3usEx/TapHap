//
//  Location.swift
//  TapHap
//
//  Created by pr0m3th3usEx on 03/05/2023.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let id = UUID()
    var city: String
    var address: String
    var postalCode: String
    
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
