//
//  AddCatViewController.swift
//  Quiz4
//
//  Created by administrator on 5/30/17.
//  Copyright © 2017 administrator. All rights reserved.
//

import UIKit

class AddCatViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        createdSaveAddButton()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createdSaveAddButton()
    {
        let addButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addSaveAction))
        navigationItem.rightBarButtonItem = addButton
    }
    
    
    func addSaveAction()
    {
        if  txtName.text!.isEmpty {
            
            let alertController = UIAlertController(title: "Información", message: "El nombre no tiene valor", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true)
            
        }
        else
        {
            if (RealmManager.validaExistCat(name: txtName.text!))
            {
                RealmManager.createCats(name: txtName.text!)
                navigationController?.popViewController(animated: true)
            
            }
            else{
                txtName.text = ""
                let alertController = UIAlertController(title: "Información", message: "GATO YA EXISTE", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                present(alertController, animated: true)
                
            }
            
            
            
            
        }
        
        
    }

}
