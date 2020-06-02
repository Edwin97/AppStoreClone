//
//  FeaturedCollectionCell.swift
//  AppStoreClone
//
//  Created by edwin on 02/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class FeaturedCollectionCell: BaseCollectionCell{
    
    let featuredCell = "featuredCell"
    
    var category: AppCategory?
    
    override func setupViews() {
        
        super.setupViews()
        collectionView.register(FeaturedCell.self, forCellWithReuseIdentifier: featuredCell)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category?.apps?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 1.1, height: frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: featuredCell, for: indexPath) as! FeaturedCell
        cell.app = category?.apps?[indexPath.row]
        return cell
    }
}
