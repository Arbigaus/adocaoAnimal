//
//  CreateAccountViewModel.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 24/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import RxSwift
import RxCocoa

class CreateAccountViewModel {
    fileprivate let disposeBag = DisposeBag()
    fileprivate let accountService = AccountServiceImpl()
    
    var loggedUser   = PublishSubject<LoggedUser>()
    
    
    init() {}
    
    func setupBindings(
        fullName  : Driver<String>,
        email     : Driver<String>,
        passwd    : Driver<String>,
        createTap : Signal<Void> )
    {
        
        let loginData = Driver.combineLatest( fullName, email, passwd )
            .asObservable()
        
        // Chama a função que irá criar a conta
        let createResult = createTap
            .asObservable()
            .withLatestFrom(loginData)
            .flatMapLatest { fullName, userEmail, userPasswd in
                self.accountService.createUser(
                        name: fullName,
                        email: userEmail,
                        password: userPasswd)
        }.share()
        
        // Informa a View que foi criada a conta
        createResult
            .subscribe(onNext: { response in
                if response.passed {
                    self.loggedUser.onNext(.logged)
                }
        }).disposed(by: disposeBag)
        
    }
    
}
