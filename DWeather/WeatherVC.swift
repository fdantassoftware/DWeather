//
//  ViewController.swift
//  DWeather
//
//  Created by Fabio Dantas on 20/10/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentWeatherIMG: UIImageView!
    
    var weather: Weather!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        weather = Weather()
        weather.downloadData {
            self.updateUI()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
}

