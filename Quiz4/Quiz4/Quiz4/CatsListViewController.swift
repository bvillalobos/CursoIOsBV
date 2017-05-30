//
//  CatsListViewController.swift
//  Quiz4
//
//  Created by administrator on 5/30/17.
//  Copyright © 2017 administrator. All rights reserved.
//

import UIKit
import RealmSwift

class CatsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var cats: Results<Cat>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCustomCell(identifier: CatCustomTableViewCell.getTableViewCellIdentifier())
        createdAddButton()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        inicializarArray()
        tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func inicializarArray(){
        
        cats = RealmManager.getAllCats()
        
    }
    
    func createdAddButton()
    {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add , target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = addButton
    }
    
    
    func addAction()
    {
        
        let addCatViewController = storyboard!.instantiateViewController(withIdentifier: AddCatViewController.getViewControllerIdentifier()) as! AddCatViewController
        navigationController?.pushViewController(addCatViewController, animated: true)
    }
    
    
}


extension CatsListViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: CatCustomTableViewCell.getTableViewCellIdentifier())) as!
        CatCustomTableViewCell
        let cat = cats![indexPath.row]
        cell.setUpCell(cats: cat)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cats = cats else{
            return 0
        }
        
        return cats.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}

