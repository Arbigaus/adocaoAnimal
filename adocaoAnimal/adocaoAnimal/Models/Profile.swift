//
//  Profile.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 03/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import Foundation

struct Profile: Codable {
    var name : String
    
    init() {
        self.name = ""
    }
}

struct UserId: Codable {
    var uuid : String
    
    init() {
        self.uuid = ""
    }
}

enum LoggedUser {
    case logged
    case notLogged
}
