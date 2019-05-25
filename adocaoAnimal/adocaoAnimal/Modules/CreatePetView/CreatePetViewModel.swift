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
    fileprivate let accountService = AccountServiceImpl()
    
    var startLoading = PublishSubject<Bool>()
    
    var userDetails : Observable<Profile>
    
    var createdPet = PublishSubject<Bool>()
    
    var petPhotos = [PHAsset]()
    
    //let input: Driver<Void>
    
    init() {
        userDetails = accountService.getLoggedUser()
        self.startLoading.onNext(false)
        
    }
    
    func setupBindings(
        petName         : Driver<String>,
        petAge          : Driver<String>,
        petColor        : Driver<String>,
        petGender       : Driver<String>,
        petType         : Driver<String>,
        petWeight       : Driver<String>,
        petDescription  : Driver<String>,
        createTap       : Signal<Void>
        ){
                
        let petData = Driver.combineLatest(petName, petAge, petColor, petGender, petType, petWeight, petDescription)
                        .asObservable()
        
        let createResult = createTap
            .asObservable()
            .withLatestFrom(petData)
            .flatMapLatest { namePet, sizeAge, colorPet, genderPet, typePet, weightPet, descriptionPet in
                self.petsService.createPet(petName: namePet, petAge: sizeAge, petColor: colorPet, petGender: genderPet, petType: typePet, petWeight: weightPet, petDescription: descriptionPet, petImages: self.petPhotos)
        }.share()
        
//        createTap
//            .asObservable()
//            .subscribe(onNext: { _ in
//                self.startLoading.onNext(true)
//            })
//            .disposed(by: disposeBag)
        
        createResult
            .subscribe(onNext: { response in
                print(response)
                self.createdPet.onNext(true)
            })
            .disposed(by: disposeBag)
        
        userDetails.asObservable()
            .subscribe(onNext: { user in
                self.petsService.userDetails = user
            })
            .disposed(by: disposeBag)
        
    }
}
