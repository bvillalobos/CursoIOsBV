//
//  News.swift
//  News
//
//  Created by Felipe Soto Campos on 5/18/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import Foundation

class News: NSObject {
    
    var titleNews: String
    var descriptionNews : String
    var createdAt: Date
    
    init(titleNews: String, descriptionNews: String, createdAt: Date) {
        self.titleNews = titleNews
        self.descriptionNews = descriptionNews
        self.createdAt = createdAt
    }
    
}
