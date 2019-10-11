//
//  DetailViewInteractor.swift
//  ZSTest
//
//  Created by Rajanikant shukla on 10/11/19.
//  Copyright © 2019 Rajanikant shukla. All rights reserved.
//

import Foundation

class DetailViewInteractorImplementation: DetailViewInteractor {

    let serviceCall: ServiceCall
    var objects: [WeatherDetail] = []
    let APIKEY = "de28d9fa26177a18c4a80a3acb8edc35"
    
    let presenter: DetailViewPresenter
    init(presenter: DetailViewPresenter, serviceCall: ServiceCall) {
        self.presenter = presenter
        self.serviceCall = serviceCall
    }
    
    func getWeatherInfo(cities: [String]) {
        let dispatchGroup = DispatchGroup()
        for city in cities {
            dispatchGroup.enter()
            serviceCall.getRequest(parameters: ["q": city, "APPID" : APIKEY], success: { (object) in
                DispatchQueue.main.async {
                    //add every object in global array
                    if let weatherDetail = WeatherDetail.initilize(info: object, city: city) {
                        self.objects.append(weatherDetail)
                    }
                    dispatchGroup.leave()
                }
            }) { (error, message) in
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                    dispatchGroup.leave()   // <<----
                }
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            self.presenter.showWeatherInfo(detail: self.objects)
        }
    }
}

