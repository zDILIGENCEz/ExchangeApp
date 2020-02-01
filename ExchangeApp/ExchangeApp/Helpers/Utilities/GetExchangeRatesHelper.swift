//
//  GetExchangeRatesHelper.swift
//  ExchangeApp
//
//  Created by Kusyumov Nikita on 31.01.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import Foundation
import UIKit

class GetExchangeRatesHelper {
    
    func getExchangeRetes(date: String, _ callback: @escaping (ExchangeResponse) -> Void
        ) {
        guard let url = URL(string: "\(NetworkConstants.url)\(date)?base=RUB") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let _ = data, error == nil else {
                print("Ошибка при выгрузке данных")
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                let responseCode = httpResponse.statusCode
                if responseCode >= 200 && responseCode < 300 {
                    do {
                        guard let responseData = data else {
                            print("Ошибка при выгрузке данных")
                            return
                        }
                        let decoder = JSONDecoder()
                        let responseWithLink = try decoder.decode(ExchangeResponse.self, from: responseData)
                        callback(responseWithLink)
                    } catch {
                        print("Ошибка при выгрузке данных")
                    }
                } else {
                    print("Ошибка при выгрузке данных")
                }
            }
        }
        task.resume()
    }
    
}
