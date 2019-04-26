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
    
    //let input: Driver<Void>
    let disposeBag = DisposeBag()
    let auth = Auth.auth()
    
    
    init() {
        
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
            .withLatestFrom(loginData)
            .flatMapLatest { email, passwd in
                self.auth.rx.signIn(withEmail: email, password: passwd)
                    .subscribe(onNext: { authResult in
                        return "logado"
                    }, onError: {error in
                        print(error)
                    }).disposed(by: disposeBag)
            }
            .share()
 
    }
}
