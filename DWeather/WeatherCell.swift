//
//  WeatherCell.swift
//  DWeather
//
//  Created by Fabio Dantas on 22/10/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(forecast: Forecast) {
        lowTemp.text = "\(forecast.lowTemperature.cleanValue)°"
        highTemp.text = "\(forecast.highTemperature.cleanValue)°"
        weatherType.text = forecast.weatherType
        weatherIcon.image = UIImage(named: forecast.weatherType)
        dayLabel.text = forecast.date
        
    }
    override func prepareForReuse() {
        weatherIcon.image = nil
        weatherType.text = nil
        dayLabel.text = nil
        highTemp.text = nil
        lowTemp.text = nil
    }

}
