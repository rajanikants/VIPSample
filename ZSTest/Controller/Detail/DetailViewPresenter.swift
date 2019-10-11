//
//  DetailViewPresenter.swift
//  ZSTest
//
//  Created by Rajanikant shukla on 10/11/19.
//  Copyright © 2019 Rajanikant shukla. All rights reserved.
//

import Foundation

class DetailViewPresenterImplementation: DetailViewPresenter {
    
    let outPut: DetailViewOutput
    init(outPut: DetailViewOutput) {
        self.outPut = outPut
    }
    
    func showWeatherInfo(detail: [WeatherDetail]) {
        outPut.presentWeatherDetail(list: detail)
    }
    
}
