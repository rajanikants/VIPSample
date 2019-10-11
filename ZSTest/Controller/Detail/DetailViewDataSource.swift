//
//  DetailViewDataSource.swift
//  ZSTest
//
//  Created by Rajanikant shukla on 10/11/19.
//  Copyright © 2019 Rajanikant shukla. All rights reserved.
//

import UIKit

protocol DetailViewDataSourceProtocol: class {
    func reloadData()
}

class DetailViewDataSource: NSObject {

    let configuration: DetailViewConfiguration
    weak var delegate: DetailViewDataSourceProtocol?
    
    init(configuration: DetailViewConfiguration) {
        self.configuration = configuration
    }
    
    var weatherDetail: [WeatherDetail] = [] {
        didSet {
            delegate?.reloadData()
        }
    }
    
}

extension DetailViewDataSource {
    
    func registerTableCell(tableView: UITableView) {
        tableView.register(WeatherTableCell.self, forCellReuseIdentifier: "WeatherCell")
    }
}

extension DetailViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as? WeatherTableCell else {
            return UITableViewCell()
        }
        cell.configureCell(detail: weatherDetail[indexPath.row])
        return cell
    }

}

extension DetailViewDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200 //UITableView.automaticDimension
    }

}

