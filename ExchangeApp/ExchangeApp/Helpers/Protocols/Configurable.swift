//
//  Configurable.swift
//  ExchangeApp
//
//  Created by Kusyumov Nikita on 30.01.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import UIKit

protocol Configurable where Self: UIView {
    
    associatedtype ViewModel

    func configure(with viewModel: ViewModel)
    
}
