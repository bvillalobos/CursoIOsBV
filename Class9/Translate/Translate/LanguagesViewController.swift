//
//  LanguagesViewController.swift
//  Translate
//
//  Created by Local User on 6/1/17.
//  Copyright © 2017 Local User. All rights reserved.
//

import UIKit

protocol LenguageDelegate : class {
    
    func closePopover()
    func selectedLanguage(languageType: Constants.LanguageType, language: String)
    
}

class LanguagesViewController: UIViewController {

    @IBAction func seleccionarAccion(_ sender: Any) {
        
        let languageSelect = languagesArray[pickerView.selectedRow(inComponent:0)]
        
        delegate?.selectedLanguage(languageType: languageType!, language: languageSelect[Constants.DIRS_KEY]!)
        
                //delegate?.closePopover()
    }
    
    
    @IBOutlet weak var pickerView: UIPickerView!
     weak var delegate : LenguageDelegate?
    
    var languageType: Constants.LanguageType?
    var languagesArray = [[String: String]]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension LanguagesViewController: UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languagesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languagesArray[row][Constants.LANGUAGE_KEY]
    }
}
