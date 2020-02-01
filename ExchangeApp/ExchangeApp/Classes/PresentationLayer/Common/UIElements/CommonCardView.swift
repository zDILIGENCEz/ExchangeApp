//
//  CommonCardView.swift
//  ExchangeApp
//
//  Created by Kusyumov Nikita on 31.01.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import Foundation
import UIKit

class CommonCardView: UIView {
    
    // MARK: - Internal properties
    
    private struct Appearance: Grid { }
    private let appearance = Appearance()
    
    // MARK: - UI elements
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    lazy var signLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var rateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        setupStyle()
        addSubviews()
        makeConstraints()
    }
    
    private func setupStyle() {
        layer.cornerRadius = appearance.lSpace
    }
    
    private func addSubviews() {
        addSubview(nameLabel)
        addSubview(signLabel)
        addSubview(rateLabel)
    }
    
    private func makeConstraints() {
        makeNameLabelConstraints()
        makeSignLabelConstraints()
        makeRateLabelConstraints()
    }
    
    private func makeNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.bottomAnchor
            .constraint(equalTo: centerYAnchor, constant: -appearance.xsSpace)
            .isActive = true
        nameLabel.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: appearance.mSpace)
            .isActive = true
        nameLabel.trailingAnchor
            .constraint(equalTo: rateLabel.leadingAnchor, constant: -appearance.xsSpace)
            .isActive = true
    }
    
    private func makeSignLabelConstraints() {
        signLabel.translatesAutoresizingMaskIntoConstraints = false
        
        signLabel.topAnchor
            .constraint(equalTo: centerYAnchor, constant: appearance.xsSpace)
            .isActive = true
        signLabel.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: appearance.mSpace)
            .isActive = true
        signLabel.trailingAnchor
            .constraint(equalTo: rateLabel.leadingAnchor, constant: -appearance.xsSpace)
            .isActive = true
    }
    
    private func makeRateLabelConstraints() {
        rateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        rateLabel.topAnchor
            .constraint(equalTo: topAnchor, constant: appearance.mSpace)
            .isActive = true
        rateLabel.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: -appearance.mSpace)
            .isActive = true
        rateLabel.bottomAnchor
            .constraint(equalTo: bottomAnchor, constant: -appearance.mSpace)
            .isActive = true
    }
    
}

extension CommonCardView: Configurable {
    
    func configure(with viewModel: CurrencyInfoViewModel) {
        nameLabel.text = "Name: \(viewModel.type.text)"
        signLabel.text = "National sign: \(viewModel.type.sign)"
        rateLabel.text = "\(viewModel.rate.calculatedCurrency)"
        backgroundColor = viewModel.type.color
    }
    
}
