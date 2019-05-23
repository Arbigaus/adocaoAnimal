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
    fileprivate let petsService = PetsServiceImpl()
    
    var createdPet = PublishSubject<Bool>()
    
    var petPhotos = [PHAsset]()
    
    //let input: Driver<Void>
    
    init() {
        
    }
    
    func setupBindings(
        petName         : Driver<String>,
        petSize         : Driver<String>,
        petColor        : Driver<String>,
        petGender       : Driver<String>,
        petType         : Driver<String>,
        petWeight       : Driver<String>,
        petDescription  : Driver<String>,
        createTap       : Signal<Void>
        ){
                
        let petData = Driver.combineLatest(petName, petSize, petColor, petGender, petType, petWeight, petDescription)
                        .asObservable()
        
        let createResult = createTap
            .asObservable()
            .withLatestFrom(petData)
            .flatMapLatest { namePet, sizePet, colorPet, genderPet, typePet, weightPet, descriptionPet in

                self.petsService.createPet(petName: namePet, petSize: sizePet, petColor: colorPet, petGender: genderPet, petType: typePet, petWeight: weightPet, petDescription: descriptionPet, petImages: self.petPhotos)
        }.share()
        
        createResult
            .subscribe(onNext: { response in
                print(response)
                self.createdPet.onNext(true)
            })
            .disposed(by: disposeBag)
        
        
        
    }
}
