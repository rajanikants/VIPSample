//
//  DetailView.swift
//  ZSTest
//
//  Created by Rajanikant shukla on 10/11/19.
//  Copyright © 2019 Rajanikant shukla. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.textAlignment = .left
        return label
    }()
    
    private let containerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        commonInit()
    }
    
    func commonInit() {
        setupViews()
        setupConstraints()
    }
}

private extension DetailView {
    
    func setupViews() {
        containerStack.addArrangedSubview(headerLabel)
        containerStack.addArrangedSubview(detailLabel)
        addSubview(containerStack)
    }
    
    func setupConstraints() {
        
        containerStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerStack.topAnchor.constraint(equalTo: self.topAnchor),
            containerStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerStack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}

extension DetailView {
    func configView(header: String, detail: String) {
        headerLabel.text = header
        detailLabel.text = detail
    }
}
