//
//  DoubleExtensions.swift
//  ExchangeApp
//
//  Created by Kusyumov Nikita on 31.01.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import Foundation

extension Double {
    
    var calculatedCurrency: String {
        let currency = 1 / self
        return String(format: "%.3f", currency)
    }
    
}
