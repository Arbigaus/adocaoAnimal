//
//  LoginEmailViewModel.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 24/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import RxSwift
import RxCocoa
import RxFirebase
import FirebaseAuth

class LoginEmailViewModel {
    fileprivate let disposeBag = DisposeBag()
    fileprivate let accountService = AccountServiceImpl()
    
    var loggedUser   = PublishSubject<LoggedUser>()
    
    
    init(){}
    
    func setupBindings(
        email    : Driver<String>,
        passwd   : Driver<String>,
        loginTap : Signal<Void> )
    {
       
        let loginData = Driver.combineLatest(email, passwd)
            .asObservable()
        
        let loginResult = loginTap
            .asObservable()
            .withLatestFrom( loginData )
            .flatMapLatest { userEmail, userPasswd in
                self.accountService
                    .userLoggin(
                        email: userEmail,
                        password: userPasswd
                    )
            }.share()
        
        loginResult
            .subscribe({ AuthDataResult in
                self.loggedUser.onNext(.logged)
            })
            .disposed(by: disposeBag) 
    }
}
