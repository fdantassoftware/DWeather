//
//  Constants.swift
//  DWeather
//
//  Created by Fabio Dantas on 21/10/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import Foundation
let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let UNIT = "&units=metric"
let API_KEY = "&appid=3b88cf4680b282f52bfcd762938750b7"
let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)135\(UNIT)\(API_KEY)"
typealias DownloadComplete = () -> ()
