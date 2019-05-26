//
//  UserProfileViewModel.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 09/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import RxSwift
import RxCocoa

class UserProfileViewModel {
    fileprivate let disposeBag      = DisposeBag()
    fileprivate let accountService  = AccountServiceImpl()
    fileprivate let petService      = PetsServiceImpl()
    
    var petList     : Observable<[Pet]>?
    var userDetails : Observable<Profile>
    var loggedUser   = PublishSubject<LoggedUser>()
    
    init() {
        userDetails = accountService.getLoggedUser()
        petList = petService.getPetsFromUser(accountService.getLoggedUserId())
        loggedUser.onNext(.logged)
    }
    
    func loggout() {
        if self.accountService.userLoggout() {
            self.loggedUser.onNext(.notLogged)
        }
    }
    
}
