//
//  CreatePetImagesCollectionViewCell.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 17/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit

class CreatePetImagesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(_ image: UIImage ) {
        imageView.image = image
    }
    
}
