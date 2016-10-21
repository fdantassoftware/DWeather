//
//  Double Formatter.swift
//  DWeather
//
//  Created by Fabio Dantas on 21/10/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import Foundation
extension Double {
    var cleanValue: String {
       return String(format: "%.0f", self)
    }
}
