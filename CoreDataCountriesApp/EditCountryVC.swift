//
//  EditCountryVC.swift
//  CoreDataCountriesApp
//
//  Created by macbook on 21/12/2021.
//

import UIKit


protocol transferData {
    func transferData(name:String)
}

class EditCountryVC: UIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var nameTF: UITextField!
    
    var delegateTransfer: transferData?
    var forwarded_country:Country?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.delegate = self
        nameTF.text = forwarded_country?.name
       
    }
   
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      
        self.nameTF.endEditing(true)
        return true
    }
  
    
    @IBAction func saveACtion(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegateTransfer?.transferData(name: self.nameTF.text ?? "")
        }
    }
    
@IBAction func dissmissAction(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
}


}
