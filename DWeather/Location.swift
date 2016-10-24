//
//  Location.swift
//  DWeather
//
//  Created by Fabio Dantas on 22/10/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    var latitude: Double!
    var longitude: Double!
    
}
