//
//  WeatherViewController.swift
//  Weather
//
//  Created by Steve on 3/12/19.
//  Copyright © 2019 Steve Saunders. All rights reserved.
//

import UIKit
import CoreLocation

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
    let locationManager = CLLocationManagerDelegate()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //TO DO: – Add Location Manager Here
        locationManager.delegate = 
    }
    
    

    
    
}




//MARK: – Networking
/*************************************************/





//MARK: – JSON Parsing
/*************************************************/




//MARK: – UI Update
/*************************************************/





//MARK: – Location Manager Methods
/*************************************************/






//MARK: – Change City Delegate Methods
/*************************************************/
