//
//  Country_DB.swift
//  CoreDataCountriesApp
//
//  Created by macbook on 25/12/2021.
//

import Foundation
import UIKit
import CoreData


extension UIViewController {
    
    
    func addCountry(name:String,image:UIImage) {
        
        let country =   Country(context: db_context)
           country.name = name
           country.image = image
           country.createdAt = Date()
           country.updatedAt = Date()
           
           do {
           app_delegte.saveContext()
               print("Saved Successfully")
           }catch{
               print("error at save data")
           }
    }
    

    
      func LoadCountries() ->[Country] {
          let request: NSFetchRequest<Country> =   Country.fetchRequest()
          
          do {
              let featched_countries: [Country]  = try db_context.fetch(request)
              
              return featched_countries
          }catch {
              
              print("Error at fetcheing Data")
              return []
          }
          
      }
    
    
    func ClearCountries(){
        
        
        let request :NSFetchRequest<NSFetchRequestResult> = Country.fetchRequest()
        let requestDelete =   NSBatchDeleteRequest(fetchRequest: request)
        do {
       try db_context.execute(requestDelete)
            print("Clear data seuccessfullty")
            
        }catch{
            print("Batched error")
        }
        
    }
    
    
    
    func deleteCountry(index: Int){
        
        let request :NSFetchRequest<Country>  =   Country.fetchRequest()
        do{
        let elements: [Country] =    try  db_context.fetch(request)
           let deleted_object =  elements[index]
        db_context.delete(deleted_object)
        print("Deleted")
         
        }catch{
            print("Error delete")
        }
        
    }
    
    
    
    func editCountry(country:Country){
        let request: NSFetchRequest<Country>  =  Country.fetchRequest()
        request.predicate = NSPredicate(format: "createdAt=%@", (country.createdAt ?? Date()) as NSDate)
        do {
        let edit_object =  try db_context.fetch(request).first
            edit_object?.name = country.name
            edit_object?.image = country.image
            edit_object?.updatedAt = Date()
            
           try db_context.save()
            
        }catch{
            print("No objects found")
        }
    }
    
    
    
}
