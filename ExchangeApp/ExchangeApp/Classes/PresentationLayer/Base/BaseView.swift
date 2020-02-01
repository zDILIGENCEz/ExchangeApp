//
//  BaseView.swift
//  ExchangeApp
//
//  Created by Kusyumov Nikita on 29.01.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import UIKit

class BaseView: UIView {
    
    let contentView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeDefaultConstraints(in viewController: UIViewController) {
        contentView.translatesAutoresizingMaskIntoConstraints = false

        contentView.topAnchor
            .constraint(equalTo: viewController.view.topAnchor)
            .isActive = true
        contentView.bottomAnchor
            .constraint(equalTo: viewController.view.bottomAnchor)
            .isActive = true
        contentView.leadingAnchor
            .constraint(equalTo: viewController.view.leadingAnchor)
            .isActive = true
        contentView.trailingAnchor
            .constraint(equalTo: viewController.view.trailingAnchor)
            .isActive = true
    }
    
}
