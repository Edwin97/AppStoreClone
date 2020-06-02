//
//  AppCell.swift
//  AppStoreClone
//
//  Created by edwin on 01/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class AppCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            appImageView.image = UIImage(named: (app?.imageName)!)
            nameLabel.text = app!.name
            categoryLabel.text = app!.category
            
            if let price = app?.price {
                purchaseButton.setTitle(String(price), for: .normal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let appImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "angrybirdsspace")
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Archero"
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.text = "Entertainemnt"
        return label
    }()
    
    let purchaseButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.textColor = .systemBlue
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 70).isActive = true
        return button
    }()
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    func setupViews() {
        
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(categoryLabel)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        horizontalStackView.addArrangedSubview(appImageView)
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(purchaseButton)
        
        addSubview(horizontalStackView)
        
        NSLayoutConstraint.activate([
            
            horizontalStackView.topAnchor.constraint(equalTo: topAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            horizontalStackView.leftAnchor.constraint(equalTo: leftAnchor),
            horizontalStackView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
}
