//
//  MainViewController.swift
//  AstrologyApp
//
//  Created by Ali Şengür on 5.11.2020.
//  Copyright © 2020 Ali Şengür. All rights reserved.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {

    
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var timezoneTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let day = dayTextField.text, let month = monthTextField.text, let year = yearTextField.text, let address = locationTextField.text, let timeZone = timezoneTextField.text else {
            return
        }

        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location
            else {
                debugPrint("No location found")
                return
            }

            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            
            print("day: \(day)\nmonth: \(month)\nyear: \(year)\nlocation: \(address)\nlatitude: \(latitude)\nlongitude: \(longitude)\ntimezone: \(timeZone)\n")
        }
    }
    
    
    
}
