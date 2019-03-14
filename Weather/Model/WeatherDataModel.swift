//
//  WeatherDataModel.swift
//  Weather
//
//  Created by Steve on 3/12/19.
//  Copyright © 2019 Steve Saunders. All rights reserved.
//

import UIKit

class WeatherDataModel {

    var temperature = 0
    var condition = 0
    var city = ""
    var weatherIconName = ""
    var weatherBackgroundName = ""


//Update Weather Icon
    
    func updateWeatherIcon (condition : Int) -> String{
        switch condition {
        case 200 ... 232:
            return "ThunderStorm"
        case 300 ... 532:
            return "Rain"
        case 600 ... 622:
            return "Snow"
        case 700 ... 782, 804:
            return "Cloudy"
        case 800:
            return "Sunny"
        case 801 ... 803:
            return "PartlyCloudy"
        default:
            return "Weather Data Unavailable"
        }
    }
    
    
// Update Weather Background
    
    func updateWeatherBackground (temperature : Int) -> String {
        switch temperature {
        case -100 ... 32:
            return "ColdBG"
        case 33 ... 42:
            return "Cool3BG"
        case 43 ... 52:
            return "Cool2BG"
        case 53 ... 63:
            return "Cool1BG"
        case 64 ... 80:
            return "WarmBG"
        case 81 ... 400:
            return "HotBG"
        default:
            return "WarmBG"
        }
    }
    



}
