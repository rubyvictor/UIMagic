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
    @IBOutlet var inspirationLabel: UILabel!
    @IBOutlet var timeAndRoomLabel: UILabel!
    
    @IBOutlet weak var speakerLabel: UILabel!
    @IBOutlet weak var imageViewCenterYLayoutConstraint: NSLayoutConstraint!
    
    var parallaxOffset: CGFloat = 0 {
        didSet {
            imageViewCenterYLayoutConstraint.constant = parallaxOffset
        }
    }
    
    var inspirations: Inspiration? {
        didSet {
            if let inspirations = inspirations {
                imageView.image = inspirations.backgroundImage
                imageView.contentMode = .scaleAspectFill
    
                inspirationLabel.textAlignment = .center
                if let font = UIFont(name: "Avenir Next Demi Bold", size: 38) {
                    let string = inspirations.title
                    let attributedText = NSAttributedString(string: string, attributes: [NSFontAttributeName: font])
                    inspirationLabel.attributedText = attributedText
                }
                inspirationLabel.textColor = .white
                
                if let font = UIFont(name: "Avenir Next Medium", size: 17) {
                    let string = inspirations.roomAndTime
                    let attributedText = NSAttributedString(string: string, attributes: [NSFontAttributeName: font])
                    timeAndRoomLabel.attributedText = attributedText
                }
                timeAndRoomLabel.textColor = .white
                timeAndRoomLabel.textAlignment = .center
                
                if let font = UIFont(name: "Avenir Next Medium", size: 17) {
                    let string = inspirations.speaker
                    let attributedText = NSAttributedString(string: string, attributes: [NSFontAttributeName: font])
                    speakerLabel.attributedText = attributedText
                    speakerLabel.textColor = .white
                    speakerLabel.textAlignment = .center
                }
            }
        }
        
    }
    
    
    
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
        
        // 5
        let scale = max(delta, 0.5)
        inspirationLabel.transform = CGAffineTransform(scaleX: scale, y: scale)
        
        // 6
        timeAndRoomLabel.alpha = delta
        speakerLabel.alpha = delta
    }
    
    func updateParallaxOffset(collectionViewBounds bounds: CGRect) {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let offsetFromCenter = CGPoint(x: center.x - self.center.x, y: center.y - self.center.y)
        let maxVerticalOffset = (bounds.height / 2) + (self.bounds.height / 2)
        let scaleFactor = 40 - maxVerticalOffset
        parallaxOffset = -offsetFromCenter.y * scaleFactor
        
    }
    
}
