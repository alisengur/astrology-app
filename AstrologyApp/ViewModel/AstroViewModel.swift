//
//  AstroViewModel.swift
//  AstrologyApp
//
//  Created by Ali Şengür on 6.11.2020.
//  Copyright © 2020 Ali Şengür. All rights reserved.
//

import Foundation



final class AstroViewModel {
    
    
    var astroDetails: AstroDetail?
    var loadData: (() -> Void)?
    
    
    func getAstroDetails(day: Int, month: Int, year: Int, hour: Int, minute: Int, lat: Double, lon: Double, tzone: Double) {
        APIRequest.shared.getAstroDetails(day: day, month: month, year: year, hour: hour, min: minute, lat: lat, lon: lon, tzone: tzone) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let astroDetails):
                self?.astroDetails = astroDetails
                self?.loadData!()
            }
        }
    }
    
}
