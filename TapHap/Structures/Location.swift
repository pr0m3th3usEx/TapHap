//
//  Location.swift
//  TapHap
//
//  Created by pr0m3th3usEx on 03/05/2023.
//

import Foundation
import MapKit

struct Location: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var subTitle: String
    
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
