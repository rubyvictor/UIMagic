//
//  UIColor+palette.swift
//  UIMagic
//
//  Created by Victor Lee on 12/7/17.
//  Copyright © 2017 VictorLee. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static func palette() -> [UIColor] {
        let palette = [
            UIColor.rgb(r: 85, g: 0, b: 255),
            UIColor.rgb(r: 170, g: 0, b: 170),
            UIColor.rgb(r: 85, g: 170, b: 85),
            UIColor.rgb(r: 0, g: 85, b: 0),
            UIColor.rgb(r: 255, g: 170, b: 0),
            UIColor.rgb(r: 255, g: 255, b: 0),
            UIColor.rgb(r: 255, g: 85, b: 0),
            UIColor.rgb(r: 0, g: 85, b: 85),
            UIColor.rgb(r: 0, g: 85, b: 255),
            UIColor.rgb(r: 170, g: 170, b: 255),
            UIColor.rgb(r: 85, g: 0, b: 0),
            UIColor.rgb(r: 170, g: 85, b: 85),
            UIColor.rgb(r: 170, g: 255, b: 0),
            UIColor.rgb(r: 85, g: 170, b: 255),
            UIColor.rgb(r: 0, g: 170, b: 170)
        ]
        return palette
        
        
    }
    
    
}
