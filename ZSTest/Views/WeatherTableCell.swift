//
//  WeatherTableCell.swift
//  ZSTest
//
//  Created by Rajanikant shukla on 10/11/19.
//  Copyright © 2019 Rajanikant shukla. All rights reserved.
//

import UIKit

class WeatherTableCell: UITableViewCell {
    
    private let cityAndTempView: DetailView = {
        let view = DetailView()
        return view
    }()
    
    private let windDetailView: DetailView = {
        let view = DetailView()
        return view
    }()
    
    private let pressureDetailView: DetailView = {
        let view = DetailView()
        return view
    }()
    
    private let humidityDetailView: DetailView = {
        let view = DetailView()
        return view
    }()

    
    private lazy var containerStack: UIStackView = {
        let stackView = UIStackView.init(arrangedSubviews: [cityAndTempView,
                                                            windDetailView,
                                                            pressureDetailView,
                                                            humidityDetailView])
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        setupViews()
        setupConstraints()
    }
}

private extension WeatherTableCell {
    
    func setupViews() {
        contentView.addSubview(containerStack)
    }
    
    func setupConstraints() {
        containerStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            containerStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            containerStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            containerStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}

extension WeatherTableCell {

    //SORRY - I DON'T LIKE FORCED UNWRAPPING BUT DUE TO TIME CONSTRAINT I HAVE USED IT!!
    
    func configureCell(detail: WeatherDetail) {
        let info = detail.weatherDetail
        cityAndTempView.configView(header: detail.cityName, detail: info.temperature)
        windDetailView.configView(header: "Wind", detail: info.windSpeed)
        pressureDetailView.configView(header: "Pressure", detail: info.pressure)
        humidityDetailView.configView(header: "Humidity", detail: info.humidity)
    }
}
