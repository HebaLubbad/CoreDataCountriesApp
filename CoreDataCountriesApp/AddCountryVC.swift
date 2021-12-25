//
//  AddCountryVC.swift
//  CoreDataCountriesApp
//
//  Created by macbook on 21/12/2021.
//

import UIKit

class AddCountryVC: UIViewController {

    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    
    var imagePicker:UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
    }
 
    
    
    @IBAction func saveAction(_ sender: Any) {
        
        self.addCountry(name: nameTF.text ?? "", image: imageV.image ?? UIImage())
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func libraryAction(_ sender: Any) {
    
    imagePicker  = UIImagePickerController()
    imagePicker?.delegate = self
    imagePicker?.sourceType = .photoLibrary
    imagePicker?.allowsEditing = true
    imagePicker?.mediaTypes = ["public.image"]
    self.present(imagePicker!, animated: true, completion: nil)
    
}
    @IBAction func cameraAction(_ sender: Any) {
        if  UIImagePickerController.isCameraDeviceAvailable(.rear) == true {
            imagePicker  = UIImagePickerController()
            imagePicker?.delegate = self
            imagePicker?.sourceType = .camera
            imagePicker?.allowsEditing = true
            imagePicker?.mediaTypes = ["public.image", "public.movie"]
            self.present(imagePicker!, animated: true, completion: nil)
        
        } else{
           noCamera()
        }
    }
    
    func noCamera()  {
        let alert = UIAlertController(title: "No Camera", message: "No available camer", preferredStyle: .alert)
        
        let okBtn = UIAlertAction(title: "OK", style: .destructive) { okAction in
          
        }
        alert.addAction(okBtn)
     
        
        self.present(alert, animated: true, completion: nil)
    }
    
}


extension AddCountryVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        self.imageV.image = image
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
