//
//  DetailView.swift
//  ZSTest
//
//  Created by Rajanikant shukla on 10/11/19.
//  Copyright © 2019 Rajanikant shukla. All rights reserved.
//

import UIKit

class DetailView: UIStackView {
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        setupViews()
    }
}

private extension DetailView {
    
    func setupViews() {
        alignment = .leading
        distribution = .fill
        axis = .horizontal
        spacing = 30
        
        addArrangedSubview(headerLabel)
        addArrangedSubview(detailLabel)
    }
    
}

extension DetailView {
    func configView(header: String, detail: String) {
        headerLabel.text = header
        detailLabel.text = detail
    }
}
