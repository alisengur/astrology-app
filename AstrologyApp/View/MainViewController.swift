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

    
    //MARK: - outlets
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var timezoneTextField: UITextField!
    @IBOutlet weak var hourTextField: UITextField!
    @IBOutlet weak var minuteTextField: UITextField!
    
    
    
    //MARK: - properties
    let astroViewModel = AstroViewModel()
    
    
    
    //MARK: - lyfe cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearUI()
    }
    
    
    private func clearUI() {
        // clear all text fields
        self.dayTextField.text = ""
        self.monthTextField.text = ""
        self.yearTextField.text = ""
        self.locationTextField.text = ""
        self.timezoneTextField.text = ""
        self.hourTextField.text = ""
        self.minuteTextField.text = ""
        dayTextField.becomeFirstResponder()
    }
    

    
    //MARK: - OK button tapped
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let day = dayTextField.text, let month = monthTextField.text, let year = yearTextField.text, let hour = hourTextField.text, let minute = minuteTextField.text, let address = locationTextField.text, let timeZone = timezoneTextField.text else {
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

            // get latitude and longitude from address
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            
            // get details from viewmodel
            self.astroViewModel.getAstroDetails(day: Int(day) ?? 0, month: Int(month) ?? 0, year: Int(year) ?? 0, hour: Int(hour) ?? 0, minute: Int(minute) ?? 0, lat: latitude, lon: longitude, tzone: Double(timeZone) ?? 0.0)
            self.astroViewModel.loadData = {
                guard let astroDetails = self.astroViewModel.astroDetails else {
                    return
                }
                
                // go to detail page
                DispatchQueue.main.async {
                    if let detailsVC = self.storyboard?.instantiateViewController(identifier: "AstroDetailsViewController") as? AstroDetailsViewController {
                        detailsVC.setupUI(with: astroDetails)
                        self.navigationController?.pushViewController(detailsVC, animated: true)
                    }
                }
                
            }
            
        }
        
    }
    
}
