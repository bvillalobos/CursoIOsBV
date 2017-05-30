//
//  NewsDetailTableViewController.swift
//  News
//
//  Created by administrator on 5/23/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit


protocol NewsDetailTableViewControllerDelegate: class {

    func addNews(news: News)
    
}

class NewsDetailTableViewController: UITableViewController {

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    
    
    weak var delegate: NewsDetailTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSaveNews()

        
    }
    

    func addSaveNews(){
        
        let saveAction = UIBarButtonItem(barButtonSystemItem: .save, target: self, action:
            #selector(saveNewsAction))
        
    navigationItem.rightBarButtonItem = saveAction
        
    }
    
    func saveNewsAction(){
        
        let news = News(titleNews: titleText.text!, descriptionNews: descriptionTextField.text!, createdAt: Date())
        delegate?.addNews(news: news)
       navigationController?.popViewController(animated: true)
        
    }

    

    
}
