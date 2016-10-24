//
//  Date Formatter.swift
//  DWeather
//
//  Created by Fabio Dantas on 21/10/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import Foundation
extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
  
    }
}
