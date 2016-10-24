//
//  ViewController.swift
//  DWeather
//
//  Created by Fabio Dantas on 20/10/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentWeatherIMG: UIImageView!
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    var weather: Weather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startMonitoringSignificantLocationChanges()
        tableView.delegate = self
        tableView.dataSource = self
        weather = Weather()
     
    }
    
    override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(animated)
        locationAuth()
       
    }
  
    func locationAuth() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            weather.downloadData {
                self.downloadData {
                    self.updateUI()
                }
                
            }
            
         
        } else {
            switch CLLocationManager.authorizationStatus() {
            
            case .denied, .restricted:
                locationManager.requestWhenInUseAuthorization()
            
            case.notDetermined:
                locationManager.requestWhenInUseAuthorization()
            
            default:
                break
            }
           
        }
    }

    
    func updateUI() {
        weatherType.text = self.weather.weatherType
        currentTempLabel.text = "\(self.weather.currentTemp.cleanValue)°"
        cityLabel.text = self.weather.cityName
        dateLabel.text = self.weather.date
        currentWeatherIMG.image = UIImage(named: self.weather.weatherType)
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell {
            let forecast = forecasts[indexPath.row]
            
            cell.configureCell(forecast: forecast)
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func downloadData(completed: @escaping DownloadComplete) {
        Alamofire.request(FORECAST_WEATHER_URL).responseJSON { response in
            let result = response.result
            if let dic = result.value as? Dictionary<String, AnyObject> {
                if let list = dic["list"] as? [Dictionary<String, AnyObject>] {
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        
                      
                    }
                
                }
            }
            completed()
            if self.tableView.visibleCells.count == 0 {
                self.forecasts.remove(at: 0)
                
                self.tableView.reloadData()
            }
        
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationAuth()
        
    }

}

