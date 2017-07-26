//
//  InspirationsViewController.swift
//  UIMagic
//
//  Created by Victor Lee on 12/7/17.
//  Copyright © 2017 VictorLee. All rights reserved.
//

import UIKit
import AVFoundation

class InspirationsController: UICollectionViewController  {
    

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    let inspirations = Inspiration.LoadAllInspirations()
    let colors = UIColor.palette()
    
//    private let cellId = "cellId"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .clear
        collectionView?.decelerationRate = UIScrollViewDecelerationRateFast
        collectionView?.contentInset = UIEdgeInsets(top: 60, left: 15, bottom: 50, right: 80)

        //        collectionView?.register(InspirationsCell.self, forCellWithReuseIdentifier: cellId)
        
//        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { return }
//        layout.itemSize = CGSize(width: view.frame.width, height: 100)
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        layout.minimumLineSpacing = 0
        

    }
    
    
    
    // Normal collectionView Cells
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inspirations.count
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "inspirationsCell", for: indexPath) as! InspirationsCell
        
        cell.inspirations = inspirations[indexPath.item]
//        cell.contentView.backgroundColor = colors[indexPath.item]
//        cell.imageView.backgroundColor = colors[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("123 123")
        let layout = collectionViewLayout as! UltravisualLayout
        let offset = layout.dragOffset * CGFloat(indexPath.item)
        if collectionView.contentOffset.y != offset {
            collectionView.setContentOffset(CGPoint(x: 0,y: offset), animated: true)
        }
    }
    
}


