//
//  InspirationsCell.swift
//  UIMagic
//
//  Created by Victor Lee on 12/7/17.
//  Copyright © 2017 VictorLee. All rights reserved.
//

import UIKit

class InspirationsCell: UICollectionViewCell {
    

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var imageCoverView: UIView!
    
//    let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        imageView.backgroundColor = .red
//        imageView.layer.masksToBounds = true
//      return imageView
//    }()
//    
//    let imageCoverView: UIView = {
//       let icv = UIView()
//        icv.backgroundColor = .black
//        return icv
//    }()
    
    
    var inspirations: Inspiration? {
        didSet {
            if let inspirations = inspirations {
                imageView.image = inspirations.backgroundImage
                imageView.contentMode = .scaleAspectFill
            }
        }
        
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        backgroundColor = .yellow
//        
//        addSubview(imageView)
//        addSubview(imageCoverView)
//        
//        imageView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
//        imageCoverView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        // 1
        let standardHeight = UltravisualLayoutConstants.Cell.standardHeight
        let featuredHeight = UltravisualLayoutConstants.Cell.featuredHeight
        
        // 2
        let delta = 1 - ((featuredHeight - frame.height) / (featuredHeight - standardHeight))
        
        // 3
        let minAlpha: CGFloat = 0.3
        let maxAlpha: CGFloat = 0.75
        imageCoverView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
        
        // 4
        imageCoverView.backgroundColor = .black
    }
    
    
}
