//
//  NumbersViewController.swift
//  Quiz_2
//
//  Created by administrator on 5/18/17.
//  Copyright © 2017 administrator. All rights reserved.
//

import UIKit

class NumbersViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var numberArray = [Int] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataSource()
        tableView.registerCustomCell(identifier: TableViewCell.getCellIndentifier())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadDataSource() {
        
        for index in 0...100{
            numberArray.append(index)
        }
        
    }
    
    
}

extension NumbersViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.getCellIndentifier())
            as! TableViewCell
        
        
        let value = numberArray[indexPath.row]
        cell.numLabel.text = "\(value)"
        if (value % 2) == 0 {
            cell.backgroundColor = UIColor.blue
        } else {
            cell.backgroundColor = UIColor.red
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
        
    }
    
    
}
