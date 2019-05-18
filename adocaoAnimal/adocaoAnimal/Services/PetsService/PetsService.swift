//
//  PetsService.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 17/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import RxSwift

protocol PetsService {
    func createPet(_ pet: Pet ) -> Observable<Response>
}
