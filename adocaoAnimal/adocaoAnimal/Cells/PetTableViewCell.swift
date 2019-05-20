//
//  PetTableViewCell.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 10/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit

class PetTableViewCell: UITableViewCell {

    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var petLocationLabel: UILabel!
    
    override func prepareForReuse() {
        
    }
    
    func bind (_ pet : Pet) {
//        petImage.image = UIImage(named: pet.image)
//        petNameLabel.text = pet.name
//        petLocationLabel.text = pet.address
    }
    
}
