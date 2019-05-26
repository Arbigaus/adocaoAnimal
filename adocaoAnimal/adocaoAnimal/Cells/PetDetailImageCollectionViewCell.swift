//
//  PetDetailImageCollectionViewCell.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 26/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit

class PetDetailImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var petImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(_ image: UIImage) {
        self.petImage.image = image
    }

}
