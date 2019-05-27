//
//  FeedViewModel.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 03/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import RxSwift
import RxCocoa
import RxSwiftUtilities

class FeedViewModel {
    
    fileprivate let disposeBag = DisposeBag()
    fileprivate let accountService = AccountServiceImpl()
    fileprivate let petService = PetsServiceImpl()
    
    let isLoading: Driver<Bool>
    
    var petList     = PublishSubject<[Pet]>()
    var userDetails : Observable<Profile>
    var loggedUser  = PublishSubject<LoggedUser>()
    var petImage    = PublishSubject<UIImage>()
    
    init() {        
        userDetails = accountService.getLoggedUser()
        let loadingIndicator = ActivityIndicator()
        
        self.isLoading = loadingIndicator
            .startWith(false)
            .asDriver()
    }
    
    func setupBindings(){ }
    
    func getImage(_ url: String) {
        petService.getImage(url) { photo in
            self.petImage.onNext(photo)
        }
    }
    
    func updatePetList() {
        self.petService.getAllPets { pets in
            self.petList.onNext(pets)
        }
    }
    
    func getPetListByType(_ type: String) {
        if type == "Tudo" {
            self.updatePetList()
        } else {
             self.petService.getPetsByType(type) { pets in
                self.petList.onNext(pets)
            }
        }
    }
    
}
