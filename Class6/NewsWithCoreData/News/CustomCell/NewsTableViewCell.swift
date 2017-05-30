//
//  NewsTableViewCell.swift
//  News
//
//  Created by Felipe Soto Campos on 5/18/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setupCell(news:  News){
        
        titleLabel.text = news.titleNews
        descriptionLabel.text = news.descriptionNews
        dateLabel.text = news.createdAt.toString(dateFormat: "yyyy-MM-dd HH:mm:ss")
    
    }
    
}
extension Date {
    
    func toString( dateFormat  : String ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
        
    }
    
    
    
}
