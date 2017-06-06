//
//  ViewController.swift
//  Translate
//
//  Created by Local User on 5/30/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController, NVActivityIndicatorViewable {

    @IBAction func traducir(_ sender: Any) {
        
        if originText.text!.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty 
        
        {
          mostrarAlerta(msj: "Introduzca el texto a traducir", titulo: "Alerta")
        
        }
        else
        {
            view.endEditing(true)
            showActivityIndicator()
            APIManager.createTranslate(originLang: originLanguage!, destinationLang: destinationLanguage!, text: originText.text) { (textTranslated) in
                self.hideActivityIndicator()
                self.destinationText.text = textTranslated

        
        }
        
        
        }
        
    }
    
    @IBOutlet weak var destinoLabel: UILabel!
    @IBOutlet weak var origenLabel: UILabel!
    @IBOutlet weak var destinationText: UITextView!
    @IBOutlet weak var originText: UITextView!
    
    var originLanguage : String?
    var destinationLanguage : String?
    
    var languagesArray : [[String: String]]?
    
    @IBAction func cambioAction(_ sender: Any) {
        
        let back = originLanguage
        originLanguage = destinationLanguage
        destinationLanguage = back
        updateLanguange()
        
    }
   
    @IBAction func destinoAction(_ sender: Any) {
        presentLanguageController(languageType: Constants.LanguageType.destination)
    }
    
    @IBAction func origenAction(_ sender: Any) {
        presentLanguageController(languageType: Constants.LanguageType.origin)
        
    }
    
    func presentLanguageController(languageType: Constants.LanguageType){
    
        let leguangeViewController = storyboard?.instantiateViewController(withIdentifier: "LanguagesViewController") as!
        LanguagesViewController
        leguangeViewController.modalPresentationStyle = .overCurrentContext
        leguangeViewController.delegate = self
        leguangeViewController.languageType = languageType
        leguangeViewController.languagesArray = languagesArray!
        
        present(leguangeViewController, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotifications()
        showActivityIndicator()
        APIManager.getLanguages()
    }
    
    func registerNotifications()
    {
        NotificationCenter.default.addObserver(self, selector: #selector (getLanguagesAvailable(notification:)), name: Notification.Name(Constants.GET_LANGUAGES_NOTIFICATION), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector (showError(notification:)), name: Notification.Name(Constants.ERROR_FOUND_NOTIFICATION), object: nil)
    }
    
    func getLanguagesAvailable(notification: Notification)
    {
        languagesArray = notification.userInfo![Constants.LANGUAGE_KEY] as? [[String: String]]
        hideActivityIndicator()
    }
    
    func showError(notification: Notification)
    {
        hideActivityIndicator()
        mostrarAlerta(msj: "Ha ocurrido un error", titulo: "Atención")
    }
    
    func mostrarAlerta(msj: String, titulo: String){
        
        let alertController = UIAlertController(title: titulo, message: msj, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    func showActivityIndicator()
    {
        DispatchQueue.main.async {
            let size = CGSize(width: 35, height: 35)
            self.startAnimating(size, message: nil, type: NVActivityIndicatorType.squareSpin)
        }
    }
    
    func hideActivityIndicator()
    {
        DispatchQueue.main.async {
            self.stopAnimating()
        }
    }
    func updateLanguange()
    {
        
        origenLabel.text = originLanguage?.uppercased()
        destinoLabel.text = destinationLanguage?.uppercased()
    }

}

extension ViewController: LenguageDelegate{

    func closePopover() {
     dismiss(animated: true, completion: nil)
    }
    
    
    func selectedLanguage(languageType: Constants.LanguageType, language: String){
        
        switch languageType {
        case .origin:
            originLanguage = language
            break
            
        case .destination:
            destinationLanguage = language
            break
        
        }
        
        updateLanguange()
        
        
//        if languageType == Constants.LanguageType.origin
//        {
//            origenLabel.text = language.uppercased()
//        }
//        else
//        {
//        destinoLabel.text = language.uppercased()
//        
//        }
         closePopover()
    
    }
    
    
    
}





