//
//  PetsService.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 17/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import RxSwift
import Photos

protocol PetsService {
    func createPet(
        petName: String,
        petAge: String,
        petColor: String,
        petGender: String,
        petType: String,
        petWeight: String,
        petDescription: String,
        petImages: [ PHAsset ] ) -> Observable<Response>
}
