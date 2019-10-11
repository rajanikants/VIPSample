//
//  ServiceCall.swift
//  ZSTest
//
//  Created by Rajanikant shukla on 10/11/19.
//  Copyright © 2019 Rajanikant shukla. All rights reserved.
//

import UIKit

let ServerURL = "https://api.openweathermap.org/data/2.5/forecast"

typealias successHandler = ([String: AnyObject]) -> Void
typealias falureHandler = (NSError, String) -> Void

class ServiceCall: NSObject {

    class var sharedInstance: ServiceCall {
        struct Singleton {
            static let instance = ServiceCall()
        }
        return Singleton.instance
    }
    
    func getRequest(parameters:[String: String], success:@escaping successHandler, falure:@escaping falureHandler )
    {
        guard var components = URLComponents(string: ServerURL)else {
            print("Error: cannot create URL")
            return
        }
    
        components.queryItems = parameters.map { (arg) -> URLQueryItem in
            return URLQueryItem(name: arg.key, value: arg.value)
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        
        guard let url = components.url else {
            print("Error: cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)

        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        session.dataTask(with: urlRequest, completionHandler:
         { (data, response, error) in
            
            guard error == nil else {
                falure(error! as NSError, (error?.localizedDescription)!)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                falure(NSError(), "did not received data")
                return
            }
            // parse the result as JSON, since that's what the API provides
            do {
                guard let response = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject] else {
                    print("error trying to convert data to JSON")
                    falure(NSError(), "did not received data")
                    return
                }
              success(response)
                
            } catch  {
                falure(NSError(), "did not received data")
                return
            }
            
         }).resume()
    }
}
