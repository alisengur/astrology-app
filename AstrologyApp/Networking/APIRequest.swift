
//
//  APIRequest.swift
//  AstrologyApp
//
//  Created by Ali Şengür on 5.11.2020.
//  Copyright © 2020 Ali Şengür. All rights reserved.
//

import Foundation



enum AstroError: Error {
    case noDataAvailable
    case canNotProcessData
}



//MARK: - api requests
final class APIRequest {

    //MARK: - properties
    static let shared = APIRequest()
    
    let url = URL(string: "https://json.astrologyapi.com/v1/astro_details")
    let userId = "614652"
    let apiKey = "9ad0591ddb1c4a7778b9f2b4d2c69f87"
    
    
    
    //MARK: - get details from API
    func getAstroDetails(day: Int, month: Int, year: Int, hour: Int, min: Int, lat: Double, lon: Double, tzone: Double, completion: @escaping(Result<AstroDetail,  AstroError>) -> Void) {
        guard let requestUrl = url else { fatalError() }
        
        let loginString = String(format: "%@:%@", userId, apiKey)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        
        // prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        // Set HTTP Request Header
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        // Set HTTP Request Body
        let parameters = ["day": day, "month": month, "year": year, "hour": hour, "min": min, "lat": lat, "lon": lon, "tzone": tzone] as [String : Any]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
            // Check for Error
            if let error = error {
                print("Error took place \(error)")
                return
            }
     
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(AstroDetail.self, from: jsonData)
                completion(.success(result))
            } catch {
                completion(.failure(.canNotProcessData))
            }

        }
        task.resume()
    }
    
    
    

}
