//
//  AccountService.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 05/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import RxSwift

protocol AccountService {
    
    func createUser( name: String, lastName: String, email: String, password: String) -> Observable<Response>
}
