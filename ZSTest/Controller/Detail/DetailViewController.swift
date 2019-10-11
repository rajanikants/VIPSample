//
//  DetailViewController.swift
//  ZSTest
//
//  Created by Rajanikant shukla on 10/11/19.
//  Copyright © 2019 Rajanikant shukla. All rights reserved.
//

import UIKit

struct DetailViewConfiguration {
    let cities: [String]
}

class DetailViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.estimatedRowHeight = 100
        table.tableFooterView = UIView()
        return table
    }()
    
    private lazy var activityIndi: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.hidesWhenStopped = true
        return activity
    }()
    
    private var dataSource: DetailViewDataSource
    var interactor: DetailViewInteractor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        getWeatherData()
        
    }
    
    init(configuration: DetailViewConfiguration) {
        dataSource = DetailViewDataSource(configuration: configuration)
        super.init(nibName: nil, bundle: nil)
        dataSource.registerTableCell(tableView: tableView)
        dataSource.delegate = self
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DetailViewController: DetailViewOutput {
    
    func presentWeatherDetail(list: [WeatherDetail]) {
        dataSource.weatherDetail = list
        activityIndi.stopAnimating()
    }
    
    func errorOnAPI() {
        print("API failed")
        activityIndi.stopAnimating()
    }
}

extension DetailViewController {
    
    func setupTableView() {
        view.addSubview(tableView)
        view.addSubview(activityIndi)
        setupConstraint()
    }
    
    func setupConstraint()  {
        activityIndi.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            activityIndi.topAnchor.constraint(equalTo: view.topAnchor),
            activityIndi.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            activityIndi.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            activityIndi.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension DetailViewController: DetailViewDataSourceProtocol {
    func reloadData() {
        tableView.reloadData()
    }
}

extension DetailViewController {
    func getWeatherData() {
        activityIndi.startAnimating()
        interactor?.getWeatherInfo(cities: dataSource.configuration.cities)
    }
}
