//
//  DetailExchangeView.swift
//  ExchangeApp
//
//  Created by Kusyumov Nikita on 29.01.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import Foundation
import UIKit

class DetailExchangeView: UIView {
    
    // MARK: - Internal properties
    
    private struct Appearance: Grid {
        let cardViewHeight: CGFloat = 130
    }
    private let appearance = Appearance()
    
    // MARK: - UI elements
    
    lazy var euroCardView: CommonCardView = {
        let view = CommonCardView()
        return view
    }()
    
    lazy var dollarCardView: CommonCardView = {
        let view = CommonCardView()
        return view
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
        addSubview(euroCardView)
        addSubview(dollarCardView)
    }
    
    private func makeConstraints() {
        makeEuroCardViewConstraints()
        makeDollarCardViewConstraints()
    }
    
    private func makeEuroCardViewConstraints() {
        euroCardView.translatesAutoresizingMaskIntoConstraints = false
        
        euroCardView.topAnchor
            .constraint(equalTo: topAnchor, constant: appearance.sSpace)
            .isActive = true
        euroCardView.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: appearance.sSpace)
            .isActive = true
        euroCardView.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: -appearance.sSpace)
            .isActive = true
        euroCardView.heightAnchor
            .constraint(equalToConstant: appearance.cardViewHeight)
            .isActive = true
    }
    
    private func makeDollarCardViewConstraints() {
        dollarCardView.translatesAutoresizingMaskIntoConstraints = false
        
        dollarCardView.topAnchor
            .constraint(equalTo: euroCardView.bottomAnchor, constant: appearance.sSpace)
            .isActive = true
        dollarCardView.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: appearance.sSpace)
            .isActive = true
        dollarCardView.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: -appearance.sSpace)
            .isActive = true
        dollarCardView.heightAnchor
            .constraint(equalToConstant: appearance.cardViewHeight)
            .isActive = true
    }
    
}
