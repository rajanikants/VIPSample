//
//  DetailViewInterface.swift
//  ZSTest
//
//  Created by Rajanikant shukla on 10/11/19.
//  Copyright © 2019 Rajanikant shukla. All rights reserved.
//

import Foundation

protocol DetailViewInteractor {
    func getWeatherInfo(cities: [String])
}

protocol DetailViewPresenter {
    func showWeatherInfo(detail: [WeatherDetail])
}

protocol DetailViewOutput {
    func presentWeatherDetail(list: [WeatherDetail])
    func errorOnAPI()
}

extension DetailViewController {
    static func buildController(configuration: DetailViewConfiguration) -> DetailViewController {
        let detailView = DetailViewController(configuration: configuration)
        let presenter = DetailViewPresenterImplementation(outPut: detailView)
        let interactor = DetailViewInteractorImplementation.init(presenter: presenter, serviceCall: ServiceCall.sharedInstance)
        detailView.interactor = interactor
        return detailView
    }
}
