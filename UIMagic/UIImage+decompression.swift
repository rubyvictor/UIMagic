//
//  UIImage+decompression.swift
//  UIMagic
//
//  Created by Victor Lee on 12/7/17.
//  Copyright © 2017 VictorLee. All rights reserved.
//

import UIKit

extension UIImage {
    
    var decompressedImage: UIImage! {
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        draw(at: .zero)
    let decompressedImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
        return decompressedImage
    }
    
    
}
