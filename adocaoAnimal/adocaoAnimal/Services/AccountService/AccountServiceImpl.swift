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
        
        createAuthUser(name: name, email: email, password: password) { (msg) in
            response.onNext(msg)
        }
        
        return response.asObservable()
        
    }
    
    private func createAuthUser(name: String, email: String, password : String, handler: @escaping ((Response)->Void)) {
        var response = Response()
        
        self.auth.rx.createUser(
            withEmail: email,
            password: password )
            .subscribe(onNext: { AuthResponse in
                self.createDBUser(name: name) { msg in
                    response.message = msg.message
                    response.created = msg.created
                    handler(response)
                }
            }, onError: { error in
                response.message = "Error on create user"
                response.created = false
                handler(response)
            })
            .disposed(by: self.disposeBag)

        
    }
    
    private func createDBUser(name: String, handler: @escaping ((Response)->Void)) {
        var response = Response()
        
        self.db.collection("Users")
            .document( self.auth.currentUser!.uid )
            .rx
            .setData([
                "name": name
                ])
            .subscribe(onNext:{
                response.message = "Usuário criado com sucesso"
                response.created = true
                handler(response)
            },
               onError: { error in
                response.message = "Error on create user on DB"
                response.created = false
                handler(response)
            })
            .disposed(by: self.disposeBag)
        
    }   
    
}
