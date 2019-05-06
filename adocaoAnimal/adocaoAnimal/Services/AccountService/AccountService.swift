//
//  AccountService.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 05/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import RxSwift

protocol AccountService {
    
    func createUser( name: String, email: String, password: String) -> Observable<Response>
}

struct Response : Codable {
    var message : String?
    var created : Bool
    
    init() {
        self.created = false
    }
}

