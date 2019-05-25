//
//  Pet.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 20/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import Foundation
import Photos

struct PetList: Codable {

}

struct Pet {
    let petName: String
    let petAge: String
    let petColor: String
    let petGender: String
    let petType: String
    let petWeight: String
    let petDescription: String
    let petImages: [ PHAsset ]
}

enum petSize {
    case smal
    case medium
    case large
}
