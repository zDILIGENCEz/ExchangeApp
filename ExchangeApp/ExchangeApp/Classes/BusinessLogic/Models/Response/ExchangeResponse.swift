//
//  ExchangeResponse.swift
//  ExchangeApp
//
//  Created by Kusyumov Nikita on 31.01.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import Foundation

struct ExchangeResponse: Codable {
    let base: String
    let date: String
    let rates: [String: Double]

    enum CodingKeys: String, CodingKey {
        case base
        case date
        case rates
    }
}
