//
//  UltraVisualLayout.swift
//  UIMagic
//
//  Created by Victor Lee on 12/7/17.
//  Copyright © 2017 VictorLee. All rights reserved.
//

import UIKit


/* The heights are declared as constants outside of the class so they can be easily referenced elsewhere */
struct UltravisualLayoutConstants {
    struct Cell {
        /* The height of the non-featured cell */
        static let standardHeight: CGFloat = 100
        /* The height of the first visible cell */
        static let featuredHeight: CGFloat = 280
    }
}

class UltravisualLayout: UICollectionViewLayout {
    
    
    // MARK: Properties and Variables
    
    /* The amount the user needs to scroll before the featured cell changes */
    let dragOffset: CGFloat = 180.0
    
    var cache = [UICollectionViewLayoutAttributes]()
    
    /* Returns the item index of the currently featured cell */
    var featuredItemIndex: Int {
        get {
            /* Use max to make sure the featureItemIndex is never < 0 */
            return max(0, Int(collectionView!.contentOffset.y / dragOffset))
        }
    }
    
    /* Returns a value between 0 and 1 that represents how close the next cell is to becoming the featured cell */
    var nextItemPercentageOffset: CGFloat {
        get {
            return (collectionView!.contentOffset.y / dragOffset) - CGFloat(featuredItemIndex)
        }
    }
    
    /* Returns the width of the collection view */
    var width: CGFloat {
        get {
            return collectionView!.bounds.width
        }
    }
    
    /* Returns the height of the collection view */
    var height: CGFloat {
        get {
            return collectionView!.bounds.height
        }
    }
    
    /* Returns the number of items in the collection view */
    var numberOfItems: Int {
        get {
            return collectionView!.numberOfItems(inSection: 0)
        }
    }
    
    // MARK: UICollectionViewLayout
    
    /* Return the size of all the content in the collection view */
    override var collectionViewContentSize : CGSize {
        let contentHeight = (CGFloat(numberOfItems) * dragOffset) + (height - dragOffset)
        return CGSize(width: width, height: contentHeight)
    }
    
    override func prepare() {
        cache.removeAll(keepingCapacity: false)
        
        let standardHeight = UltravisualLayoutConstants.Cell.standardHeight
        let featuredHeight = UltravisualLayoutConstants.Cell.featuredHeight
        
        var frame = CGRect.zero
        var y: CGFloat = 0
        
        //1
        for item in 0..<numberOfItems {
            let indexPath = IndexPath(item: item, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        //2
            attributes.zIndex = item
            var height = standardHeight

        //3
            if indexPath.item == featuredItemIndex {
        //4
                let yOffset = standardHeight * nextItemPercentageOffset
                y = collectionView!.contentOffset.y - yOffset
                height = featuredHeight
            } else if indexPath.item == (featuredItemIndex + 1) && indexPath.item != numberOfItems {
        // 5
                let maxY = y + standardHeight
                height = standardHeight + max((featuredHeight - standardHeight) * nextItemPercentageOffset, 0)
                y = maxY - height
            }
        // 6
            frame = CGRect(x: 0, y: y, width: width, height: height)
            attributes.frame = frame
            cache.append(attributes)
            y = frame.maxY
            
        }
        
        
    }
    
    // Method to apply timbre layout
//    func degressToRadians(degrees: Float) -> CGFloat {
//        return  CGFloat(.pi * (degrees / 180.0))
//    }
    
    
    /* Return all attributes in the cache whose frame intersects with the rect passed to the method */
    
    // This method snaps the featured cell right to the top of the screen without scrolling with too much effort. Also needs to speed up deceleration in View Controller
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        let itemIndex = round(proposedContentOffset.y / dragOffset)
        let yOffset = itemIndex * dragOffset
        return CGPoint(x: 0, y: yOffset)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                attributes.frame.insetBy(dx: 12, dy: 0)
//                attributes.frame.offsetBy(dx: 8, dy: 8)
                attributes.transform = CGAffineTransform(rotationAngle: 270)
                
                layoutAttributes.append(attributes)
            }
            
//            for attributes in layoutAttributes {
//                attributes.frame.insetBy(dx: 12, dy: 0)
//                attributes.transform = CGAffineTransform(rotationAngle: 270)
//            }
        }
        return layoutAttributes
    }
    
    /* Return true so that the layout is continuously invalidated as the user scrolls */
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        return cache.first {
            attributes -> Bool in
            return attributes.indexPath == indexPath
        }
    }
    
}
