//
//  Category.swift
//  News
//
//  Created by Felipe Soto Campos on 5/18/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import Foundation
import UIKit

class Category: NSObject {
 
    var name: String
    var image: UIImage
    var newArray: [News]
    
    init(name: String, image: String) {
        self.name = name
        self.image = UIImage(named: image)!
        self.newArray = [News]()
    }
    
}
