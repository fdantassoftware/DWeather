//
//  Weather.swift
//  DWeather
//
//  Created by Fabio Dantas on 21/10/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import Alamofire
import UIKit

class Weather {
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
            
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    
    func downloadData(completed: @escaping DownloadComplete) {
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            
            if let dic = result.value as? Dictionary<String, AnyObject> {
                if let cityName = dic["name"] as? String {
                    self._cityName = cityName
                }
                if let dicTemp = dic["main"] as? Dictionary<String, AnyObject> {
                    if let temperature = dicTemp["temp"] as? Double {
                        self._currentTemp = temperature
                    }
                }
                if let arrayWeather = dic["weather"] as? [Dictionary<String, AnyObject>], arrayWeather.count > 0 {
                    let dicWeather = arrayWeather[0]
                    if let weather = dicWeather["main"] as? String {
                        self._weatherType = weather
                        print(weather)
                    }
                }
                
            }
         
        completed()
        }
        
    }
    
    
    
    
}
