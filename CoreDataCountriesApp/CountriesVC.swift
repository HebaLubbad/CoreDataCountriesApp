//
//  ViewController.swift
//  CoreDataCountriesApp
//
//  Created by macbook on 21/12/2021.
//

import UIKit
import CoreData
class CountriesVC: UIViewController  {
    
    
    @IBOutlet weak var countriesTableView: UITableView!
    
    
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.refreshData()
        
    }
    
    func refreshData(){
        
        let fetched_countris  = LoadCountries()
        countries.removeAll()
        countries.append(contentsOf: fetched_countris)
        self.countriesTableView.reloadData()
    }
 
    
    @IBAction func deleteAction(_ sender: Any)
    {
        let alert = UIAlertController(title: "Clear countries", message: "Are you sure want to clear all countries?", preferredStyle: .alert)
        
        let okBtn = UIAlertAction(title: "Sure", style: .destructive) { okAction in
            
            self.ClearCountries()
            self.refreshData()
         
        }
        alert.addAction(okBtn)
        
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel Clear  process")
        }
        alert.addAction(cancelBtn)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func addAction(_ sender: Any) {
        
      let st =   UIStoryboard(name: "Main", bundle: nil)
        let vc :AddCountryVC =   st.instantiateViewController(identifier: "AddCountryId")
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension CountriesVC : UITableViewDelegate, UITableViewDataSource  {
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.deleteCountry(index: indexPath.row)
            self.refreshData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: CountryDetialsVC =  storyboard.instantiateViewController(identifier: "DetialsId")
        vc.forwarded_country = countries[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
   
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Countries "
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let myCell =  countriesTableView.dequeueReusableCell(withIdentifier: "myCell")  as!  CountryTCell
        myCell.SetData(country:self.countries[indexPath.row])
        return myCell
      
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
        
    }
    
    
}
