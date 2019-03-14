//
//  WeatherViewController.swift
//  Weather
//
//  Created by Steve on 3/12/19.
//  Copyright © 2019 Steve Saunders. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class WeatherViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var weatherBackground: UIImageView!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var currentTempLable: UILabel!
    @IBOutlet weak var currentCityLabel: UILabel!
    @IBOutlet weak var currentDayLabel: UILabel!
    @IBOutlet weak var currentDateLabel: UILabel!
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?"
    let API_KEY = "377d1530c1b46819e9c975e44fd191a0"
    
    //Instance Variables
    let locationManager = CLLocationManager()
    let weatherDataModel = WeatherDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //TO DO: – Add Location Manager Here
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

    }
    
    

    
    





//MARK: – Networking
/*************************************************/
    func getWeatherData (url : String, parameters : [String : String]) {
        
        Alamofire.request (url, method : .get, parameters : parameters).responseJSON {
            response in
            if response.result.isSuccess {
                
                let weatherJSON : JSON = JSON(response.result.value!)
                self.updateUserWeatherData(JSON : weatherJSON)
                
            }
            else {
                
                print("Error \(String(describing: response.result.error))")
                self.currentCityLabel.text = "Connection Issues"
                
            }
        }
        
    }




//MARK: – JSON Parsing
/*************************************************/

    func updateUserWeatherData (JSON : JSON) {
        
        if let tempResult = JSON["main"]["temp"].double {
        
        weatherDataModel.temperature = Int((tempResult - 273.15) * (9/5) + 32)
        weatherDataModel.city = JSON["name"].stringValue
        weatherDataModel.condition = JSON["weather"][0]["id"].intValue
        weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)
        weatherDataModel.weatherBackgroundName = weatherDataModel.updateWeatherBackground(temperature: weatherDataModel.temperature)
            
        updateUIWithWeatherData()
            
        }
        else {
            currentCityLabel.text = "Weather Unavailable"
        }
    }

//MARK: – UI Update
/*************************************************/

    func updateUIWithWeatherData () {
        currentCityLabel.text = weatherDataModel.city
        currentTempLable.text = String(weatherDataModel.temperature)
        weatherIcon.image = UIImage(named: weatherDataModel.weatherIconName)
        weatherBackground.image = UIImage(named: weatherDataModel.weatherBackgroundName)
    }



//MARK: – Location Manager Methods
/*************************************************/

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            let params = ["lat" : latitude, "lon" : longitude, "appid" : API_KEY]
            
            getWeatherData(url : WEATHER_URL, parameters : params)
            
            print("\(latitude), \(longitude)")
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        currentCityLabel.text = "Location Unavailable"
    }

    
    


//MARK: – Change City Delegate Methods
/*************************************************/



    }
