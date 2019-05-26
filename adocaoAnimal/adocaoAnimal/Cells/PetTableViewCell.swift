//
//  PetTableViewCell.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 10/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit

class PetTableViewCell: UITableViewCell {
    fileprivate let petService = PetsServiceImpl()

    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var tutorName: UILabel!
    
    override func prepareForReuse() {}
    
    func bind (_ pet : Pet) {
        petNameLabel.text = pet.petName
        tutorName.text = pet.petTutorName!
        
        petService.getImage(pet.petImages![0]) { photo in
            self.petImage.image = photo
        }
        
    }
    
}
