//
//  BaseViewModel.swift
//  ExchangeApp
//
//  Created by Kusyumov Nikita on 29.01.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Internal properties
    
    private let baseView = BaseView()

    // MARK: - UI elements
    
    var customView: UIView {
        return UIView()
    }
    
    var prefersNavigationBarHidden: Bool {
        return false
    }
    
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationItem(for: super.navigationItem)
        navigationController?.setNavigationBarHidden(prefersNavigationBarHidden, animated: animated)
    }
    
    override func loadView() {
        view = baseView
        view.backgroundColor = .white
        baseView.makeDefaultConstraints(in: self)
        
        baseView.contentView.addSubview(customView)
        customView.bindFrameToSuperviewBounds()
    }
    
}

extension UIViewController {

    func configureNavigationItem(for navigationItem: UINavigationItem) {
        setupStyle()
    }

    func setupStyle() {
        let textAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17),
        ]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back")

        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        backItem.tintColor = .white
        navigationItem.backBarButtonItem = backItem

        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = .exSeaBlue
        navigationController?.navigationBar.isTranslucent = false
    }

}
