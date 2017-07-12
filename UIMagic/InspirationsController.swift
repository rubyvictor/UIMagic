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
    let color = UIColor.palette()
    
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .clear
        collectionView?.register(InspirationsCell.self, forCellWithReuseIdentifier: cellId)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return color.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! InspirationsCell
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
    
}
