//
//  CategoryViewController.swift
//  News
//
//  Created by administrator on 5/18/17.
//  Copyright © 2017 administrator. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    
    @IBOutlet weak var TableView: UITableView!
    var categories = [Category]()

    override func viewDidLoad() {
        super.viewDidLoad()
        inicializeCategories()
        TableView.registerCustomCell(identifier: CategoryTableViewCell.getTableViewCellIdentifier())
        
        
        self.title = "Categories"

        // Do any additional setup after loading the view.
    }
    
    
    func inicializeCategories(){
    
        let economyCategory = Category (name: "Economia", image: "economy")
        let sportCategory = Category (name: "Sport", image: "sports")
        let technologyCategory = Category (name: "Tecnologia", image: "technology")
        let incidentCategory = Category (name: "Sucesos", image: "incident")
        
        categories = [economyCategory,sportCategory,technologyCategory,incidentCategory]
    
    }

    
}

extension CategoryViewController:UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.getTableViewCellIdentifier()) as! CategoryTableViewCell
        
        cell.setupCell(category: categories[indexPath.row])
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let  newViewController = storyboard?.instantiateViewController(withIdentifier: NewsViewController.getViewControllerIndentifier()) as! NewsViewController
        newsViewController.news = categories[indexPath.row].newsArray
        navigationController?.pushViewController(newsViewController, animated: true)
    }


}
