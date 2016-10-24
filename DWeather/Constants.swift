//
//  Constants.swift
//  DWeather
//
//  Created by Fabio Dantas on 21/10/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import Foundation

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&units=metric&appid=3b88cf4680b282f52bfcd762938750b7"

let FORECAST_WEATHER_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&units=metric&cnt=10&mode=json&appid=3b88cf4680b282f52bfcd762938750b7"
typealias DownloadComplete = () -> ()

