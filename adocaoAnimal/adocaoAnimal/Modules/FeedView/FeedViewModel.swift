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
    
    var petList     : Observable<[Pet]>?
    var userDetails : Observable<Profile>
    var loggedUser   = PublishSubject<LoggedUser>()
    
    init() {        
        userDetails = accountService.getLoggedUser()
        petList = petService.getAllPets()
        
        let loadingIndicator = ActivityIndicator()
        
        self.isLoading = loadingIndicator
            .startWith(false)
            .asDriver()
    }
    
    func setupBindings(){

    }
}
