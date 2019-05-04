//
//  Profile.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 03/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import Foundation

struct Profile: Codable {
    
}

struct UserId: Codable {
    
    let uuid : String
    
    init() {
        self.uuid = ""
    }
}
