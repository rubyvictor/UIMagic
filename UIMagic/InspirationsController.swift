//
//  InspirationsViewController.swift
//  UIMagic
//
//  Created by Victor Lee on 12/7/17.
//  Copyright © 2017 VictorLee. All rights reserved.
//

import UIKit

class InspirationsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let inspirations = Inspiration.LoadAllInspirations()
    let colors = UIColor.palette()
    
    private let cellId = "cellId"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .clear
        collectionView?.register(InspirationsCell.self, forCellWithReuseIdentifier: cellId)
        
        
        if let layout = collectionView?.collectionViewLayout as? UltravisualLayout {
            layout.delegate = self
        }

        
    }
    
    
    
    // Normal collectionViewFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inspirations.count
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! InspirationsCell
        
        
        cell.inspirations = inspirations[indexPath.item]
//        cell.contentView.backgroundColor = colors[indexPath.item]
//        cell.imageView.backgroundColor = colors[indexPath.item]
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: 150)
//    }
    
}

extension InspirationsController: UltraVisualDelegate {
    func collectionView(collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: NSIndexPath, withWidth: CGFloat) -> CGFloat {
        return 100
        
    }
}


