//
//  EnterNumberViewController.swift
//  Quiz3
//
//  Created by administrator on 5/23/17.
//  Copyright © 2017 administrator. All rights reserved.
//

import UIKit

class EnterNumberViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var datosTextFiel: UITextField!
    
    var Array = [String] ()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCustomCell(identifier: NumberCustomCellTableViewCell.getCellIndentifier())
        
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func agregarBtn(_ sender: UIButton) {
        
        Array.append(datosTextFiel.text!)
        tableView.reloadData()
        
    }
    

   
}

extension EnterNumberViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NumberCustomCellTableViewCell.getCellIndentifier())
            as! NumberCustomCellTableViewCell
        
        cell.initCell(data: Array[indexPath.row])
        
                return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 90
        
    }
    
    
}
