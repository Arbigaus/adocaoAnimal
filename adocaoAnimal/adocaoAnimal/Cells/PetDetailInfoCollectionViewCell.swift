//
//  PetDetailInfoCollectionViewCell.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 15/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit

class PetDetailInfoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        detailLabel.layer.cornerRadius = 20
        
    }

}
