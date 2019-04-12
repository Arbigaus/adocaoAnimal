//
//  FilterCollectionViewCell.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 10/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit

class HomeFilterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var homeFilterViewCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        homeFilterViewCell.layer.cornerRadius = 10
    }

}
