//
//  UIViewExtensions.swift
//  ExchangeApp
//
//  Created by Kusyumov Nikita on 29.01.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//
import UIKit

extension UIView {

    func bindFrameToSuperviewBounds() {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
            return
        }

        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: 0).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0).isActive = true

    }

    func roundBottom(radius: CGFloat = 5){
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    func addBlueShadow() {
        let shadowColor = UIColor.exSeaBlue.withAlphaComponent(0.4)
        
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 20)
        layer.shadowRadius = 14
        layer.shadowOpacity = 1
        layer.masksToBounds = false
    }
    
    func addLightGrayShadow() {
        let shadowColor = UIColor.exLightGray.withAlphaComponent(0.4)
        
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowRadius = 14
        layer.shadowOpacity = 1
        layer.masksToBounds = false
    }
    
}
