//
//  ViewController.swift
//  Class2_A
//
//  Created by administrator on 5/11/17.
//  Copyright © 2017 administrator. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSaludar(_ sender: Any) {
        
        let nameViewController = (storyboard?.instantiateViewController(withIdentifier: "NameViewController"))! as! NameViewController
        
        nameViewController.name = nameTextField.text
        navigationController?.pushViewController(nameViewController, animated: true)
        
        
    
//        if let name = nameTextField.text{
//            print("El nombre es \(name)")
//            }
        
        //print("Press BTN")
        
//        let alertController = UIAlertController(title: "Informacion", message: "Usted presiono el boton", preferredStyle: .alert)
//        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alertController.addAction(action)
//        present(alertController, animated: true, completion: nil)
//        
    }

}

