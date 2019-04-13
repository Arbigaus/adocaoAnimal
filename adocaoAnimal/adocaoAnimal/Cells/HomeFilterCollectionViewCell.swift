//
//  FilterCollectionViewCell.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 10/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit

class HomeFilterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var homeFilterViewCell: UIView!
    @IBOutlet weak var homeFilterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        homeFilterViewCell.layer.cornerRadius = 25
        homeFilterViewCell.layer.borderWidth = 6
//        homeFilterViewCell.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 0.8).cgColor
        homeFilterViewCell.layer.borderColor = UIColor(red:255/255, green:255/255, blue:255/255, alpha: 0.8).cgColor
    }

}
