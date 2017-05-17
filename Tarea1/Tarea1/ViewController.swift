//
//  ViewController.swift
//  Tarea1
//
//  Created by administrator on 5/15/17.
//  Copyright © 2017 administrator. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textFieldNumOne: UITextField!
    @IBOutlet weak var textFieldNumTwo: UITextField!
    
    @IBOutlet weak var btnsumar: UIButton!
    @IBOutlet weak var btnRestar: UIButton!
    @IBOutlet weak var btnMultiplicar: UIButton!
    @IBOutlet weak var btnDividir: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.CerrarKeyBoardTarea))
        view.addGestureRecognizer(tap)
        
        btnsumar.backgroundColor = UIColor.lightGray
        btnRestar.backgroundColor = UIColor.lightGray
        btnMultiplicar.backgroundColor = UIColor.lightGray
        btnDividir.backgroundColor = UIColor.lightGray
        
    }
    
    func CerrarKeyBoardTarea() {
        view.endEditing(true)
    }
    
    @IBAction func btnSumar(_ sender: Any) {
        
        if let primerValor = Int(textFieldNumOne.text!), let segundoValor = Int(textFieldNumTwo.text!){
            
            let alertController = UIAlertController(title: "SUMA", message: "El resultado es: \(primerValor + segundoValor)", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func btnRestar(_ sender: Any) {
        
        if let primerValor = Int(textFieldNumOne.text!), let segundoValor = Int(textFieldNumTwo.text!){
            let alertController = UIAlertController(title: "RESTA", message: "El resultado es: \(primerValor - segundoValor)", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func btnMultiplicar(_ sender: Any) {
        
        if let primerValor = Int(textFieldNumOne.text!), let segundoValor = Int(textFieldNumTwo.text!){
            
            let alertController = UIAlertController(title: "MULTIPLICACIÓN", message: "El resultado es: \(primerValor * segundoValor)", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func btnDividir(_ sender: Any) {
        
        
        if let primerValor = Float(textFieldNumOne.text!), let segundoValor = Float(textFieldNumTwo.text!){
            
            if segundoValor == 0
            {
                let alertController = UIAlertController(title: "INFORMACIÓN", message: "No se pude dividir entre cero", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                present(alertController, animated: true, completion: nil)
                
                return
            }
            
            let alertController = UIAlertController(title: "DIVISIÓN", message: "El resultado es: \(primerValor / segundoValor)", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
            
        }
        
    }
    
    
}

