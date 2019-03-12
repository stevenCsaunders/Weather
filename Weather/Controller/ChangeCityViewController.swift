//
//  ChangeCityViewController.swift
//  Weather
//
//  Created by Steve on 3/12/19.
//  Copyright © 2019 Steve Saunders. All rights reserved.
//

import UIKit

class ChangeCityViewController: UIViewController {
    
    @IBOutlet weak var changeCityTextField: UITextField!
    
    
    
    @IBAction func changeCityButtonPressed(_ sender: Any) {
    }
    
    
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

