//
//  MainDateListViewController.swift
//  ExchangeApp
//
//  Created by Kusyumov Nikita on 29.01.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import UIKit

extension MainDateListViewController {

    struct Constants {

        let paginationDatesCount: Int = 50
        let prepareHeight: CGFloat = 1000
        let secoundsInDay: Double = 86_400

    }

}

class MainDateListViewController: BaseViewController {
    
    // MARK: - Private properties
    
    private let mainDateListView = MainDateListView()
    private var mainDateListViewModel = MainDateListViewModel()
    
    // MARK: - Override properties
    
    override var customView: UIView {
        return mainDateListView
    }
    
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCurrentExchanceRate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupDates()
        setupDelegates()
    }
    
    // MARK: - Private methods
    
    private func setupTitle() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.dayWithMonthYear
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        title = "Rate for \(dateFormatter.string(from: Date()))"
    }
    
    private func getCurrentExchanceRate() {
        let getExchangeRatesHelper = GetExchangeRatesHelper()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.yearWithMonthDay
        let stringDate = dateFormatter.string(from: Date())
        
        getExchangeRatesHelper.getExchangeRetes(date: stringDate, { response in
            DispatchQueue.main.async {
                let euroCourseViewModel = CurrencyInfoViewModel(
                    type: .euro,
                    rate: self.getRate(with: .euro, response: response)
                )
                self.mainDateListView.onboardingView.euroCourseView
                    .configure(with: euroCourseViewModel)
                
                let dollarCourseViewModel = CurrencyInfoViewModel(
                    type: .dollar,
                    rate: self.getRate(with: .dollar, response: response)
                )
                self.mainDateListView.onboardingView.dollarCourseView
                    .configure(with: dollarCourseViewModel)
            }
        })
    }
    
    private func getRate(with type: Currency, response: ExchangeResponse) -> Double {
        for item in response.rates {
            if item.key == type.abbreviation {
                return item.value
            }
        }
        return 0
    }
    
    private func setupDelegates() {
        mainDateListView.dateCollectionView.delegate = self
        mainDateListView.dateCollectionView.dataSource = self
    }
    
    private func setupDates() {
        for _ in 0..<Constants().paginationDatesCount {
            if mainDateListViewModel.dateList.isEmpty {
                mainDateListViewModel.dateList.append(Date().timeIntervalSince1970)
            } else {
                guard let date = mainDateListViewModel.dateList.last else { return }
                mainDateListViewModel.dateList.append(date - Constants().secoundsInDay)
            }
        }
        mainDateListView.dateCollectionView.reloadData()
    }
    
}

extension MainDateListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainDateListViewModel.dateList.count
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MainDateCell.Constants.cellReuseIdentifier,
            for: indexPath
            )
            as? MainDateCell else {
                return UICollectionViewCell()
        }
        cell.configure(with: MainDateCellViewModel(date: mainDateListViewModel.dateList[indexPath.row]))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = DetailExchangeController()
        controller.date = mainDateListViewModel.dateList[indexPath.row]
        show(controller, sender: self)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView.frame.size.height + scrollView.contentOffset.y >= scrollView.contentSize.height - scrollView.frame.size.height - Constants().prepareHeight else { return }
        setupDates()
    }
    
}
