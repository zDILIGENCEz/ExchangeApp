//
//  MainDateUpperView.swift
//  ExchangeApp
//
//  Created by Kusyumov Nikita on 31.01.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import UIKit

class MainDateUpperView: UIView {
    
    // MARK: - Internal properties
    
    private struct Appearance: Grid {
        let trailingBorder: CGFloat = 150
        let containerViewCornerRadius: CGFloat = 50
    }
    private let appearance = Appearance()
    
    // MARK: - UI elements
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .exSeaBlue
        view.roundBottom(radius: appearance.containerViewCornerRadius)
        return view
    }()
    
    lazy var rateTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var euroCourseView = CommonInfoView()
    
    lazy var dollarCourseView = CommonInfoView()
    
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
        addBlueShadow()
        backgroundColor = .clear
    }
    
    private func addSubviews() {
        addSubview(containerView)
        
        containerView.addSubview(rateTitleLabel)
        containerView.addSubview(euroCourseView)
        containerView.addSubview(dollarCourseView)
    }
    
    private func makeConstraints() {
        makeContainerViewConstraints()
        makeRateTitleLabelConstraints()
        makeEuroCourseViewConstraints()
        makeDollarCourseViewConstraints()
    }
    
    private func makeContainerViewConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.topAnchor
            .constraint(equalTo: topAnchor, constant: appearance.zero)
            .isActive = true
        containerView.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: appearance.zero)
            .isActive = true
        containerView.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: appearance.zero)
            .isActive = true
        containerView.bottomAnchor
            .constraint(equalTo: bottomAnchor, constant: appearance.zero)
            .isActive = true
    }
    
    private func makeRateTitleLabelConstraints() {
        rateTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        rateTitleLabel.topAnchor
            .constraint(equalTo: topAnchor, constant: appearance.xxsSpace)
            .isActive = true
        rateTitleLabel.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: appearance.zero)
            .isActive = true
        rateTitleLabel.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: appearance.zero)
            .isActive = true
        rateTitleLabel.heightAnchor
            .constraint(equalToConstant: appearance.mSpace)
            .isActive = true
    }
    
    private func makeEuroCourseViewConstraints() {
        euroCourseView.translatesAutoresizingMaskIntoConstraints = false
        
        euroCourseView.topAnchor
            .constraint(equalTo: rateTitleLabel.topAnchor, constant: appearance.mSpace)
            .isActive = true
        euroCourseView.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: appearance.mSpace)
            .isActive = true
        euroCourseView.trailingAnchor
            .constraint(equalTo: centerXAnchor, constant: -appearance.mSpace)
            .isActive = true
        euroCourseView.bottomAnchor
            .constraint(equalTo: bottomAnchor, constant: appearance.mSpace)
            .isActive = true
    }
    
    private func makeDollarCourseViewConstraints() {
        dollarCourseView.translatesAutoresizingMaskIntoConstraints = false
        
        dollarCourseView.topAnchor
            .constraint(equalTo: rateTitleLabel.topAnchor, constant: appearance.mSpace)
            .isActive = true
        dollarCourseView.leadingAnchor
            .constraint(equalTo: centerXAnchor, constant: appearance.mSpace)
            .isActive = true
        dollarCourseView.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: -appearance.mSpace)
            .isActive = true
        dollarCourseView.bottomAnchor
            .constraint(equalTo: bottomAnchor, constant: appearance.mSpace)
            .isActive = true
    }
    
}
