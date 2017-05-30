//
//  CatCustomTableViewCell.swift
//  Quiz4
//
//  Created by administrator on 5/30/17.
//  Copyright © 2017 administrator. All rights reserved.
//

import UIKit

class CatCustomTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var txtName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(cats: Cat) {
        txtName.text = cats.name
        
    }
    
}
