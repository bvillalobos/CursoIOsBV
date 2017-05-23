//
//  NumberCustomCellTableViewCell.swift
//  Quiz3
//
//  Created by administrator on 5/23/17.
//  Copyright © 2017 administrator. All rights reserved.
//

import UIKit

class NumberCustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var datosLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell ( data: String)
    {
     datosLabel.text = data
    
    }
    
}
