//
//  CategoryViewController.swift
//  News
//
//  Created by Felipe Soto Campos on 5/18/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    var categories = [Category]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCategories()
        tableView.registerCustomCell(identifier: CategoryTableViewCell.getCellIdentifier())
        self.title = "Categories"
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func initializeCategories() {
        let economyCategory = Category(name: "Economy", image: "economy", type: .economy)
        let sportCategory = Category(name: "Sports", image: "sports", type: .sports)
        let incidentsCategory = Category(name: "Incidents", image: "incident", type: .incidents)
        let technologyCategory = Category(name: "Technology", image: "technology", type: .technology)
        
        categories = [economyCategory, sportCategory, incidentsCategory, technologyCategory]
    }
    
}

extension CategoryViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsViewController = storyboard?.instantiateViewController(withIdentifier: NewsViewController.getUIViewControllerIdentifier()) as! NewsViewController
        newsViewController.news = categories[indexPath.row].newArray
        newsViewController.categoryType = categories[indexPath.row].type
        newsViewController.delegate = self
        navigationController?.pushViewController(newsViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.getCellIdentifier()) as! CategoryTableViewCell
        cell.setUpCell(category: categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}


extension CategoryViewController: NewsViewControllerDelegate{
    
    func addNews(news: [News], categoryType: CategoryType){
    
        let index = categories.index{$0.type == categoryType}
        if let indexUnwraped = index {
            let categoryTOupdate = categories[indexUnwraped]
            categoryTOupdate.newArray = news
            categories[indexUnwraped] = categoryTOupdate
        
        
        }
    
    }
    
    
}



