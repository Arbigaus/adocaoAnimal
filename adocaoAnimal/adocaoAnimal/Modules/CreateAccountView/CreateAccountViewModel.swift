//
//  CreateAccountViewModel.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 24/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import RxSwift
import RxCocoa
import RxFirebase
import FirebaseAuth

class CreateAccountViewModel {
    fileprivate let disposeBag = DisposeBag()
    fileprivate let auth = Auth.auth()
    
    var createdUser : Variable<Bool>
    
    init() {
        createdUser = Variable(false)
    }
    
    func setupBindings(
        fullName  : Driver<String>,
        email     : Driver<String>,
        passwd    : Driver<String>,
        createTap : Signal<Void> )
    {
        
        let loginData = Driver.combineLatest(email, passwd )
            .asObservable()
        
        let createResult = createTap
            .asObservable()
            .withLatestFrom(loginData)
            .flatMapLatest { userEamil, userPasswd in
                self.auth.rx.createUser(
                    withEmail: userEamil,
                    password: userPasswd )
        }.share()
        
        createResult.subscribe(onNext: { authResult in
            self.createdUser = Variable(true)            
        }, onError: { error in
            print("response: \(error)")
        }).disposed(by: disposeBag)
        
    }
    
}
