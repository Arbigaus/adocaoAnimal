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
    fileprivate let disposeBag = DisposeBag()
    fileprivate let accountService = AccountServiceImpl()
    
    var loggedUser   = PublishSubject<LoggedUser>()
    
    init() {
        loggedUser.onNext(.logged)
    }
    
    func setupBindings( loggoutTap : Signal<Void> ) {
        
        loggoutTap.asObservable()
            .subscribe(onNext: { _ in
                if self.accountService.userLoggout() {
                    self.loggedUser.onNext(.notLogged)
                }
            }).disposed(by: disposeBag)
    }
}
