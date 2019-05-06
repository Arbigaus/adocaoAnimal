//
//  AccountServiceImpl.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 05/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import RxSwift
import Firebase
import RxFirebase

class AccountServiceImpl: NSObject, AccountService {
    fileprivate let disposeBag = DisposeBag()
    fileprivate let auth = Auth.auth()
    fileprivate let db = Firestore.firestore()
    
    
    override init() {
    }
    
    func createUser( name: String, email: String, password: String) -> Observable<Response> {
        let response = PublishSubject<Response>()
        
        response.onNext( createAuthUser(name: name, email: email, password: password) )

        return response.asObservable()
        
    }
    
    private func createAuthUser(name: String, email: String, password : String) -> Response {
        var response = Response()
        
        do {
            try self.auth.rx.createUser(
                withEmail: email,
                password: password )
                .subscribe(onNext: { AuthResponse in
                    response = self.createDBUser(name: name)
                }, onError: { error in
                    response.message = "Error on create user"
                    response.created = false
                })
                .disposed(by: self.disposeBag)
            
            return response
        } catch {
            print("Error")
        }
    }
    
    private func createDBUser(name: String) -> Response {
        var response = Response()
        
        try self.db.collection("Users")
            .document( self.auth.currentUser!.uid )
            .rx
            .setData([
                "name": name
                ])
            .subscribe(onNext:{
                response.message = "Usuário criado com sucesso"
                response.created = true
            },
               onError: { error in
                response.message = "Error on create user on DB"
                response.created = false
            })
            .disposed(by: self.disposeBag)
        
        return response
    }
    
    
}
