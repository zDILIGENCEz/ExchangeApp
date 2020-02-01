//
//  MainDateCell.swift
//  ExchangeApp
//
//  Created by Kusyumov Nikita on 29.01.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import UIKit

class MainDateCell: UICollectionViewCell {

    // MARK: - Internal properties

    private struct Appearance: Grid { }

    private let appearance = Appearance()

    // MARK: - UI elements

    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .exSeaBlue
        return label
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .exLightGray
        return view
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
        addSubviews()
        makeConstraints()
        setupStyle()
    }

    private func setupStyle() {
        backgroundColor = .white
        contentView.addLightGrayShadow()
    }

    private func addSubviews() {
        addSubview(dateLabel)
        addSubview(lineView)
    }

    private func makeConstraints() {
        makeDateLabelConstraints()
        makeLineViewConstraints()
    }
    
    private func makeDateLabelConstraints() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.topAnchor
            .constraint(equalTo: topAnchor, constant: 0)
            .isActive = true
        dateLabel.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: 0)
            .isActive = true
        dateLabel.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: 0)
            .isActive = true
        dateLabel.bottomAnchor
            .constraint(equalTo: bottomAnchor, constant: 0)
            .isActive = true
    }
    
    private func makeLineViewConstraints() {
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
        lineView.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: 30)
            .isActive = true
        lineView.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: -30)
            .isActive = true
        lineView.bottomAnchor
            .constraint(equalTo: bottomAnchor, constant: 0)
            .isActive = true
        lineView.heightAnchor
            .constraint(equalToConstant: 1)
            .isActive = true
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
      
        let featuredHeight = MainDateCellLayoutConstants.Constants.featuredHeight
        let standardHeight = MainDateCellLayoutConstants.Constants.standardHeight
      
        let delta = 1 - ((featuredHeight - frame.height) / (featuredHeight - standardHeight))
      
        let scale = max(delta, 0.5)
        dateLabel.transform = CGAffineTransform(scaleX: scale, y: scale)
    }

}

extension MainDateCell: Configurable {
    
    func configure(with viewModel: MainDateCellViewModel) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.dayWithMonthYear
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateLabel.text = "\(dateFormatter.string(from: Date(timeIntervalSince1970: viewModel.date)))"
    }
    
}

extension MainDateCell {

    struct Constants {
        
        static let cellReuseIdentifier = "mainDateCellIdentifier"
        
    }

}
