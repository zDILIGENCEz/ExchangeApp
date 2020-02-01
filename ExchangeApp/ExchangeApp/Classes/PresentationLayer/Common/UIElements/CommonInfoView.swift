//
//  CommonInfoView.swift
//  ExchangeApp
//
//  Created by Kusyumov Nikita on 31.01.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import Foundation
import UIKit

enum Currency {
    case euro
    case dollar
    
    var text: String {
        switch self {
        case .euro: return "Euro"
        case .dollar: return "Dollar"
        }
    }
    
    var sign: String {
        switch self {
        case .euro: return "€"
        case .dollar: return "$"
        }
    }
    
    
    var abbreviation: String {
        switch self {
        case .euro: return "EUR"
        case .dollar: return "USD"
        }
    }
    
    var color: UIColor {
        switch self {
        case .euro: return UIColor.orange
        case .dollar: return UIColor.systemPink
        }
    }
    
}


class CommonInfoView: UIView {
    
    // MARK: - Internal properties
    
    private struct Appearance: Grid { }
    private let appearance = Appearance()
    
    // MARK: - UI elements
    
    lazy var coloredView = UIView()
    
    lazy var courseTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        return label
    }()
    
    lazy var courseValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
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
        
    }
    
    private func addSubviews() {
        addSubview(coloredView)
        addSubview(courseTitleLabel)
        addSubview(courseValueLabel)
    }
    
    private func makeConstraints() {
        makeColoredViewConstraints()
        makeCourseTitleLabelConstraints()
        makeCourseValueLabelConstraints()
    }
    
    private func makeColoredViewConstraints() {
        coloredView.translatesAutoresizingMaskIntoConstraints = false
        
        coloredView.topAnchor
            .constraint(equalTo: topAnchor, constant: appearance.zero)
            .isActive = true
        coloredView.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: appearance.zero)
            .isActive = true
        coloredView.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: appearance.zero)
            .isActive = true
        coloredView.heightAnchor
            .constraint(equalToConstant: appearance.xxxsSpace)
            .isActive = true
    }
    
    private func makeCourseTitleLabelConstraints() {
        courseTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        courseTitleLabel.topAnchor
            .constraint(equalTo: coloredView.bottomAnchor, constant: appearance.sSpace)
            .isActive = true
        courseTitleLabel.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: appearance.zero)
            .isActive = true
        courseTitleLabel.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: appearance.zero)
            .isActive = true
        courseTitleLabel.heightAnchor
            .constraint(equalToConstant: appearance.mSpace)
            .isActive = true
    }
    
    private func makeCourseValueLabelConstraints() {
        courseValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        courseValueLabel.topAnchor
            .constraint(equalTo: courseTitleLabel.bottomAnchor, constant: appearance.sSpace)
            .isActive = true
        courseValueLabel.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: appearance.zero)
            .isActive = true
        courseValueLabel.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: appearance.zero)
            .isActive = true
        courseValueLabel.heightAnchor
            .constraint(equalToConstant: appearance.mSpace)
            .isActive = true
    }
    
}

extension CommonInfoView: Configurable {
    
    func configure(with viewModel: CurrencyInfoViewModel) {
        coloredView.backgroundColor = viewModel.type.color
        courseTitleLabel.text = viewModel.type.text
        courseValueLabel.text = "\(viewModel.type.sign) \(viewModel.rate.calculatedCurrency)"
    }
    
}
