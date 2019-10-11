//
//  WeatherDetail.swift
//  ZSTest
//
//  Created by Rajanikant shukla on 10/11/19.
//  Copyright © 2019 Rajanikant shukla. All rights reserved.
//

import UIKit

typealias MyDictionary = [String: AnyObject]

struct WeatherDetail {
    let cityName: String
    let weatherDetail: Detail
}

struct Detail {
    let temperature: String
    let humidity: String
    let pressure: String
    let windSpeed: String
}

extension WeatherDetail {
   static func initilize(info: MyDictionary, city: String) -> WeatherDetail?{
        let cityName = city
        guard let detail = Detail.initilize(detail: info) else {
            return nil
        }
        return WeatherDetail.init(cityName: cityName, weatherDetail: detail)
    }
}

extension Detail {
    static func initilize(detail: MyDictionary) -> Detail? {
        guard let array = detail["list"] as? [AnyObject],
            let firstObj = array.first as? [String: Any],
            let main = firstObj["main"] as? [String: Any],
            let wind = firstObj["wind"] as? [String: Any] else {
                return nil
        }
        
        let temperature = "\(main["temp"] ?? "")"
        let humidity = "\(main["humidity"] ?? "")"
        let pressure = "\(main["pressure"] ?? "")"
        let windSpeed = "\(wind["speed"] ?? "")"
        
        return Detail(temperature: temperature, humidity: humidity, pressure: pressure, windSpeed: windSpeed)
    }
}
