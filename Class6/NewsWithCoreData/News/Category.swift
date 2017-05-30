//
//  Category.swift
//  News
//
//  Created by Felipe Soto Campos on 5/18/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import Foundation
import UIKit


enum CategoryType{
case economy,sports, incidents, technology
}

class Category: NSObject {
 
    var name: String
    var image: UIImage
    var newArray: [News]
    var type: CategoryType
    
    init(name: String, image: String, type: CategoryType) {
        self.name = name
        self.image = UIImage(named: image)!
        self.type = type
        self.newArray = [News]()
    }
    
}
