//
//  FeaturedCell.swift
//  AppStoreClone
//
//  Created by edwin on 02/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class FeaturedCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            if let imageName = app?.imageName {
                bannerImageView.image = UIImage(named: imageName)
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
    
    let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.layer.borderWidth = 0.5
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    func setupViews() {
        
        addSubview(bannerImageView)
        
        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bannerImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            bannerImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
    
}



