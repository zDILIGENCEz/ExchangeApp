//
//  DetailExchangeController.swift
//  ExchangeApp
//
//  Created by Kusyumov Nikita on 29.01.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import Foundation
import UIKit

class DetailExchangeController: BaseViewController {
    
    // MARK: - Private properties
    
    private let detailExchangeView = DetailExchangeView()
    
    // MARK: - Public properties
    
    var date = Timestamp()
    
    // MARK: - Override properties
    
    override var customView: UIView {
        return detailExchangeView
    }
    
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getExchangeRate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
    }
    
    // MARK: - Private methods
    
    private func setupTitle() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.dayWithMonthYear
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        title = "\(dateFormatter.string(from: Date(timeIntervalSince1970: date)))"
    }
    
    private func getRate(with type: Currency, response: ExchangeResponse) -> Double {
        for item in response.rates {
            if item.key == type.abbreviation {
                return item.value
            }
        }
        return 0
    }
    
    private func getExchangeRate() {
        let getExchangeRatesHelper = GetExchangeRatesHelper()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.yearWithMonthDay
        let stringDate = dateFormatter.string(from: Date(timeIntervalSince1970: date))
        
        getExchangeRatesHelper.getExchangeRetes(date: stringDate, { response in
            DispatchQueue.main.async {
                let euroCourseViewModel = CurrencyInfoViewModel(
                    type: .euro,
                    rate: self.getRate(with: .euro, response: response)
                )
                self.detailExchangeView.euroCardView
                    .configure(with: euroCourseViewModel)
                
                let dollarCourseViewModel = CurrencyInfoViewModel(
                    type: .dollar,
                    rate: self.getRate(with: .dollar, response: response)
                )
                self.detailExchangeView.dollarCardView
                    .configure(with: dollarCourseViewModel)
            }
        })
    }
    
}
