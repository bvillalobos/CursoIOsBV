//
//  NumPrimoViewController.swift
//  Tarea2
//
//  Created by administrator on 5/22/17.
//  Copyright © 2017 administrator. All rights reserved.
//

import UIKit

class NumPrimoViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    
    var numberArray = [Int] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataSource()
        TableView.registerCustomCell(identifier: TableViewCell.getCellIndentifier())

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loadDataSource() {
        numberArray.append(1)
        for index in 1...1000{
            if isPrime(_number: index){
                //print(index)
                numberArray.append(index)
            }
        }
        
    }
    
    func isPrime (_number: Int) -> Bool{
        return _number > 1 && !(2..<_number).contains { _number % $0 == 0 }
    }
   
}

extension NumPrimoViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.getCellIndentifier())
            as! TableViewCell
        
        
        let value = numberArray[indexPath.row]
        cell.numLabel.text = "\(value)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
        
}
}
