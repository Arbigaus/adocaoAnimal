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
        
    var loggedUser : BehaviorRelay<Bool>
    
    fileprivate let disposeBag = DisposeBag()
    fileprivate let auth = Auth.auth()
    
    init() {
        self.loggedUser = BehaviorRelay(value: false)
    }
    
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

                self.auth.rx.signIn(
                    withEmail: userEmail,
                    password: userPasswd )

            }.share()
        
        loginResult.subscribe(onNext: { authResult in
            print("Token: \(authResult)")
            self.loggedUser = BehaviorRelay(value: true)
        }, onError: { error in
            print("Error: \(error)")
        }).disposed(by: disposeBag)
 
    }
}
