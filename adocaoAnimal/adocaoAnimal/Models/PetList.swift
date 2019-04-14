//
//  PetList.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 14/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import Foundation

struct PetList: Codable {
    
}

struct Pet {
    let name: String
    let size: petSize
    let image: String
    let owner: String
    let address: String
    let neighborhood: String
    
}

enum petSize {
    case smal
    case medium
    case large
}

