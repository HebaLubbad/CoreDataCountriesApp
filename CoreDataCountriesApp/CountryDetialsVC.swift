//
//  CountryDetialsVC.swift
//  CoreDataCountriesApp
//
//  Created by macbook on 21/12/2021.
//

import UIKit
import CoreData



class CountryDetialsVC: UIViewController , transferData, UINavigationControllerDelegate {
   
    
    
    
    @IBOutlet weak var updatedLbl: UILabel!
    @IBOutlet weak var createdLbl: UILabel!
    @IBOutlet weak var nameLBl: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    
    
    var imagePicker:UIImagePickerController?
    
    var forwarded_country:Country?
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLBl.text = forwarded_country?.name
        imageV.image = forwarded_country?.image as? UIImage
        updatedLbl.text = " updated At : \(forwarded_country?.updatedAt ?? Date())"
        createdLbl.text = "created At : \(forwarded_country?.createdAt ?? Date())"
        
     
    }
    
    @IBAction func cancelction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func EditAction(_ sender: Any) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let vc: EditCountryVC = st.instantiateViewController(identifier: "EditCountryId")
        vc.delegateTransfer = self
        vc.forwarded_country = self.forwarded_country
        self.present(vc, animated: true) {
            print("Presented Successfully")
        }
    }
    
    func transferData(name: String) {
        self.forwarded_country?.name = name
        self.nameLBl.text = name
    }
    
// Edit at Database
    @IBAction func SaveAction(_ sender: Any) {
        self.editCountry(country: forwarded_country!)
        
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
    
//    func transfer(data: Country) {
//        nameLBl.text = data.name
//    }

}
extension CountryDetialsVC : UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        self.imageV.image = image
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
