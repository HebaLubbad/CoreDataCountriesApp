//
//  CountryTCell.swift
//  CoreDataCountriesApp
//
//  Created by macbook on 21/12/2021.
//

import UIKit

class CountryTCell: UITableViewCell {
    
    
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryImageV: UIImageView!

    
    
    
    func SetData(country:Country) {
        countryName.text =  country.name
        countryImageV.image = country.image as? UIImage
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
