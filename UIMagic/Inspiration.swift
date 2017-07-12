//
//  Inspiration.swift
//  UIMagic
//
//  Created by Victor Lee on 12/7/17.
//  Copyright © 2017 VictorLee. All rights reserved.
//

import UIKit

class Inspiration: Session {
    
    static func LoadAllInspirations() -> [Inspiration] {
        
        var inspirations = [Inspiration]()
        if let url = Bundle.main.url(forResource: "Inspirations", withExtension: "plist") {
            if let inspirationsFromPlist = NSArray(contentsOf: url) {
                for dict in inspirationsFromPlist {
                    let inspiration = Inspiration(dictionary: dict as! NSDictionary)
                    inspirations.append(inspiration)
                }
            }
        }
        return inspirations
    }
}
