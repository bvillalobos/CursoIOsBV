//
//  DogsViewController.swift
//  CustomTableViewWithViewControllerExample
//
//  Created by administrator on 5/16/17.
//  Copyright © 2017 administrator. All rights reserved.
//

import UIKit

class DogsViewController: UIViewController {
    
    var dogs = [Dog]()
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeDogArray()
        tableView.registerCustomCell(identifier: DogTableViewCell.getCellIndentifier())
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initializeDogArray(){
        
         let dog1 =  Dog(name: "Bruno1", age: "Blanco1", color: "1 años")
         let dog2 =  Dog(name: "Bruno2", age: "Blanco2", color: "2 años")
         let dog3 =  Dog(name: "Bruno3", age: "Blanco3", color: "3 años")
         let dog4 =  Dog(name: "Bruno4", age: "Blanco4", color: "4 años")
         let dog5 =  Dog(name: "Bruno5", age: "Blanco5", color: "5 años")
        
        
        dogs = [dog1,dog2,dog3,dog4,dog5]
        
    }

    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension DogsViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath : IndexPath) ->
//        UITableViewCell{
//            let cell = tableView.dequeueReusableCell(withIdentifier: "")
//            return cell!
//    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DogTableViewCell.getCellIndentifier())
            as! DogTableViewCell
        
        let dog = dogs[indexPath.row]
        cell.nameLabel.text = dog.name
         cell.ageLabel.text = dog.age
         cell.colorLabel.text = dog.color
        
        
        
        
        return cell
        
    }
    
    
    
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
        
    }
    
    
    
    
}

