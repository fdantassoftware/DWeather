//
//  Forecast.swift
//  DWeather
//
//  Created by Fabio Dantas on 21/10/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//
import Foundation


class Forecast {
    var _date: String!
    var _weatherType: String!
    var _highTemperature: Double!
    var _lowTemperature: Double!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemperature: Double {
        if _highTemperature == nil {
            _highTemperature = 0.0
        }
        return _highTemperature
    }
    
    var lowTemperature: Double {
        if _lowTemperature == nil {
            _lowTemperature = 0.0
        }
        return _lowTemperature
    }


    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            if let min = temp["min"] as? Double {
                self._lowTemperature = min
            }
            if let max = temp["max"] as? Double {
                self._highTemperature = max
            }
            
        }
        
        if let weather = weatherDict["weather"] as? Array<Dictionary<String, AnyObject>> {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
  
    }

}

