//
//  MainDateListView.swift
//  ExchangeApp
//
//  Created by Kusyumov Nikita on 29.01.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import UIKit

class MainDateListView: UIView {
    
    // MARK: - Internal properties
    
    private struct Appearance: Grid {
        let onboardingViewHeight: CGFloat = 150
    }
    private let appearance = Appearance()
    
    // MARK: - UI elements
    
    lazy var backgroundImageView = UIImageView(image: UIImage(named: "backgroundImage"))
    
    lazy var onboardingView = MainDateUpperView()
    
    lazy var dateCollectionView: UICollectionView = {
        let layout = MainDateCellLayout()
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.register(
            MainDateCell.self,
            forCellWithReuseIdentifier: MainDateCell.Constants.cellReuseIdentifier
        )
        collectionView.showsVerticalScrollIndicator = true
        collectionView.decelerationRate = .normal
        collectionView.backgroundColor = .clear
        return collectionView
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
        addSubview(backgroundImageView)
        addSubview(dateCollectionView)
        addSubview(onboardingView)
        
    }
    
    private func makeConstraints() {
        makeBackgroundImageViewConstraints()
        makeOnboardingViewConstraints()
        makeLabelConsraints()
    }
    
    private func makeBackgroundImageViewConstraints() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleToFill
        
        backgroundImageView.topAnchor
            .constraint(equalTo: topAnchor, constant: appearance.zero)
            .isActive = true
        backgroundImageView.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: appearance.zero)
            .isActive = true
        backgroundImageView.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: appearance.zero)
            .isActive = true
        backgroundImageView.bottomAnchor
            .constraint(equalTo: bottomAnchor, constant: appearance.zero)
            .isActive = true
    }
    
    private func makeOnboardingViewConstraints() {
        onboardingView.translatesAutoresizingMaskIntoConstraints = false
        
        onboardingView.topAnchor
            .constraint(equalTo: topAnchor, constant: appearance.zero)
            .isActive = true
        onboardingView.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: appearance.zero)
            .isActive = true
        onboardingView.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: appearance.zero)
            .isActive = true
        onboardingView.heightAnchor
            .constraint(equalToConstant: appearance.onboardingViewHeight)
            .isActive = true
    }
    
    private func makeLabelConsraints() {
        dateCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        dateCollectionView.topAnchor
            .constraint(equalTo: onboardingView.bottomAnchor, constant: -50)
            .isActive = true
        dateCollectionView.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: appearance.zero)
            .isActive = true
        dateCollectionView.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: appearance.zero)
            .isActive = true
        dateCollectionView.bottomAnchor
            .constraint(equalTo: bottomAnchor, constant: appearance.zero)
            .isActive = true
    }
    
}
