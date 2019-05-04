//
//  Storage.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 03/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import Foundation
import RxSwift

protocol LocalStorage: class {
    var userUuid: Observable<UserId> { get }
    
    var firstAccess: Bool {get set}
    
}
