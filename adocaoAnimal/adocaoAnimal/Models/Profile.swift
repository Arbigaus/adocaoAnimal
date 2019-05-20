//
//  Profile.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 03/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import Foundation

struct Profile: Codable {
    var name     : String
    var lastName : String
    var fullName : String
    var email    : String
    
    init() {
        self.name = ""
        self.lastName = ""
        self.fullName = "\(self.name) \(self.lastName)"
        self.email = ""
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
