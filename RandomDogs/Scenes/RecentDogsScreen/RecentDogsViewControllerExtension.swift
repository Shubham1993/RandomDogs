//
//  RecentDogsViewControllerExtension.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/29/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import Foundation
import UIKit

extension RecentDogsViewController: RecentDogsView {
  
}

extension RecentDogsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cache.getCurrentSize()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RecentDogsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "dogCell", for: indexPath) as! RecentDogsCollectionViewCell
        let images: [Data] = presenter.getImagesFromCache()
        cell.dogImageView.contentMode = .scaleToFill
        cell.dogImageView.image = UIImage(data: images[indexPath.row])
        return cell
    }
}


extension RecentDogsViewController: UICollectionViewDelegate {
    
}


extension RecentDogsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
