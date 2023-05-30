//
//  LocationModel.swift
//  Africa
//
//  Created by Alessandro Sc on 29/05/23.
//

import Foundation
import MapKit

struct NationalParkLocation: Identifiable, Codable {
    var id : String
    var name : String
    var image : String
    var latitude : Double
    var longitude : Double
    
    // Computed properties
    
    var location : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
