//
//  Helper.swift
//  CustomTableViewWithViewControllerExample
//
//  Created by administrator on 5/16/17.
//  Copyright © 2017 administrator. All rights reserved.
//

import Foundation
import UIKit


extension UITableView{

    func registerCustomCell(identifier: String){
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    
    }

}

extension UITableViewCell{

   class func getCellIndentifier() -> String{
        return String(describing: self)
    }
}
