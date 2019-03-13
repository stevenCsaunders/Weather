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

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var currentTempLable: UILabel!
    @IBOutlet weak var currentCityLabel: UILabel!
    @IBOutlet weak var currentDayLabel: UILabel!
    @IBOutlet weak var currentDateLabel: UILabel!
    
    //Constants
    let WEATHER_URL = "api.openweathermap.org/data/2.5/weather"
    let API_KEY = "377d1530c1b46819e9c975e44fd191a0"
    
    //Instance Variables
    let locationManager = CLLocationManager()
    
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
                print("Success, got the data")
                
            }
            else {
                print("Error \(String(describing: response.result.error))")
                self.currentCityLabel.text = "Connection Issues"
                
            }
        }
        
    }




//MARK: – JSON Parsing
/*************************************************/




//MARK: – UI Update
/*************************************************/





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
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        currentCityLabel.text = "Location Unavailable"
    }

    
    


//MARK: – Change City Delegate Methods
/*************************************************/



    }
