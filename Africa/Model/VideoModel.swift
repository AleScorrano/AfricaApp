//
//  VideoModel.swift
//  Africa
//
//  Created by Alessandro Sc on 29/05/23.
//

import Foundation

struct Video : Identifiable, Codable {
    let id : String
    let name : String
    let headline : String
    
    // Computed Property
    var thumbnail : String {
        "video-\(id)"
    }
}
