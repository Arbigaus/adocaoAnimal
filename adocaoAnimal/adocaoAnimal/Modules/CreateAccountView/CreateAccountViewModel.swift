//
//  CreateAccountViewModel.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 24/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import RxSwift
import RxCocoa
import RxSwiftUtilities

class CreateAccountViewModel {
    fileprivate let disposeBag = DisposeBag()
    fileprivate let accountService = AccountServiceImpl()
    
    var loggedUser   = PublishSubject<LoggedUser>()
    let isLoading: Driver<Bool>
    
    
    init() {
        let loadingIndicator = ActivityIndicator()
        
        self.isLoading = loadingIndicator
            .startWith(false)
            .asDriver()
    }
    
    func setupBindings(
        name      : Driver<String>,
        lastName  : Driver<String>,
        email     : Driver<String>,
        passwd    : Driver<String>,
        createTap : Signal<Void> )
    {
        
        let loginData = Driver.combineLatest( name, lastName, email, passwd )
            .asObservable()
        
        // Chama a função que irá criar a conta
        let createResult = createTap
            .asObservable()
            .withLatestFrom(loginData)
            .flatMapLatest { name, lastName, userEmail, userPasswd in
                self.accountService.createUser(
                        name: name,
                        lastName: lastName,
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
