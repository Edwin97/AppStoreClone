//
//  ViewController.swift
//  AppStoreClone
//
//  Created by edwin on 01/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

extension Array {
    mutating func rearrange(from: Int, to: Int) {
        insert(remove(at: from), at: to)
    }
}

class FeaturedAppController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let baseCollectionCell = "baseCollectionCell"
    let bannerCollectionCell = "bannerCollectionCell"
    let featuredCollectionCell = "featuredCollectionCell"
    
    var featureApp: FeaturedApp?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FeaturedApp.fetchFeaturedApp { (result) in
            switch result {
            case .success(let featuredApp):
                self.featureApp = featuredApp
                self.featureApp?.categories?.swapAt(2, 0)
                self.featureApp?.categories?.swapAt(1, 3)
                
                 DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
        
        collectionView.backgroundColor = .white
        
        featureApp?.categories?.swapAt(2, 3)
        
        registerCell()
        
        navigationItem.title = "Apps"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func registerCell() {
        collectionView.register(BaseCollectionCell.self, forCellWithReuseIdentifier: baseCollectionCell)
         collectionView.register(BannerCollectionCell.self, forCellWithReuseIdentifier: bannerCollectionCell)
         collectionView.register(FeaturedCollectionCell.self, forCellWithReuseIdentifier: featuredCollectionCell)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = featureApp?.categories?.count {
            return count// Header
        }
        
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item ==  0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bannerCollectionCell, for: indexPath) as! BannerCollectionCell
            cell.bannerApps = featureApp?.bannerCategory
            return cell
        }else if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: featuredCollectionCell, for: indexPath) as! FeaturedCollectionCell
               cell.category = featureApp?.bannerCategory
               return cell
        }
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: baseCollectionCell, for: indexPath) as! BaseCollectionCell
        cell.appCategory = featureApp?.categories?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0 {
             return CGSize(width: collectionView.frame.width, height: 300)
        }
        
         return CGSize(width: collectionView.frame.width, height: 210)
    }
    
}

