//
//  Response.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 17/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import Foundation

struct Response : Codable {
    var message : String?
    var passed : Bool
    
    init() {
        self.passed = false
    }
}

