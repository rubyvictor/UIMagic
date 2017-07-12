//
//  InspirationsCell.swift
//  UIMagic
//
//  Created by Victor Lee on 12/7/17.
//  Copyright © 2017 VictorLee. All rights reserved.
//

import UIKit

class InspirationsCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .red
        imageView.layer.masksToBounds = true
      return imageView
    }()
    
//    let imageCoverView: UIView = {
//       let icv = UIView()
//        return icv
//    }()
    
    
    var inspirations: Inspiration? {
        didSet {
//            if let inspirations = inspirations {
//                imageView.image = inspirations.backgroundImage
//            }
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        
        addSubview(imageView)
//        addSubview(imageCoverView)
        
        imageView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
