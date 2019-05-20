//
//  CreatePetViewModel.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 15/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import RxSwift
import RxCocoa
import Photos

class CreatePetViewModel {
    fileprivate let disposeBag = DisposeBag()
    
    var petPhotos = [PHAsset]()
    
    //let input: Driver<Void>
    
    init() {
        
    }
    
    func setupBindings(
        petName: Driver<String>,
        petColor: Driver<String>,
        petGender: Driver<String>,
        petType: Driver<String>,
        petWeight: Driver<String>,
        petDescription: Driver<String>,
        createTap: Signal<Void> 
        ){
        
    }
}
