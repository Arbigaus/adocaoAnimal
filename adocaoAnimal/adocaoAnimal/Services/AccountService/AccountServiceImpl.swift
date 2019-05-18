//
//  AccountServiceImpl.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 05/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import RxSwift
import FirebaseAuth
import FirebaseFirestore
import RxFirebase

class AccountServiceImpl: NSObject, AccountService {
    fileprivate let disposeBag = DisposeBag()
    fileprivate let auth = Auth.auth()
    fileprivate let db = Firestore.firestore()
        
    override init() {
    }
    
    // MARK: - Main function to create User
    func createUser(
            name: String,
            lastName: String,
            email: String,
            password: String
        ) -> Observable<Response> {
        
        let response = PublishSubject<Response>()
        
        createAuthUser(name: name, lastName: lastName, email: email, password: password) { (msg) in
            response.onNext(msg)
        }
        
        return response.asObservable()
        
    }
    
    // MARK: - Create User Account
    private func createAuthUser(name: String, lastName: String, email: String, password : String, handler: @escaping ((Response)->Void)) {
        var response = Response()
        
        self.auth.rx.createUser(
            withEmail: email,
            password: password )
            .subscribe(onNext: { AuthResponse in
                self.createDBUser(name: name, lastName: lastName) { msg in
                    
                    response.message = msg.message
                    response.passed = msg.passed
                    
                    handler(response)
                }
            }, onError: { error in
                response.message = "Error on create user"
                response.passed = false
                handler(response)
            })
            .disposed(by: self.disposeBag)        
    }
    
    // MARK: - Create user on DB
    private func createDBUser(name: String, lastName: String, handler: @escaping ((Response)->Void)) {
        var response = Response()
        
        self.db.collection("Users")
            .document( self.auth.currentUser!.uid )
            .rx
            .setData([
                "name": name,
                "lastName": lastName
                ])
            .subscribe(onNext:{
                response.message = "Usuário criado com sucesso"
                response.passed = true
                
                handler(response)
            },
               onError: { error in
                response.message = "Error on create user on DB"
                response.passed = false
                
                handler(response)
            })
            .disposed(by: self.disposeBag)
        
    }
    
    // MARK: - Main user login function
    func userLoggin( email: String, password: String) -> Observable<Response> {
        let response = PublishSubject<Response>()
        
        loginAuthUser(email: email, password: password) { (msg) in
            response.onNext(msg)
        }
        
        return response.asObservable()
        
    }
    
    // MARK: - User Login Function
    private func loginAuthUser(email: String, password: String, handler: @escaping ((Response) -> Void)) {
        var response = Response()
        
        self.auth.rx
            .signIn(withEmail: email, password: password)
            .subscribe(onNext: { (AuthDataResult) in
                response.message = "Usuário Logado com Sucesso"
                response.passed = true
                
                handler(response)
                
            }, onError: { (error) in
                response.message = "Ocorreu algum erro ao logar"
                response.passed = false
                
                handler(response)
            })
            .disposed(by: self.disposeBag)
    }
    
    //MARK: - Main Get logged user function
    func getLoggedUser() -> Observable<Profile>{
        return Observable
            .just(self.auth.currentUser)
            .flatMap{ (user) in
                self.getLoggedUserInfo(user?.uid ?? "0")
            }
    }
    
    // MARK: - Get logged user from Firestore
    func getLoggedUserInfo(_ uuid: String) -> Observable<Profile> {
        return self.db.collection("Users")
                .document(uuid)
                .rx.listen()
            .map{$0.data()}
            .map { data -> Profile in
                
                guard let data = data else { return Profile() }
                
                var userProfile = Profile()
                userProfile.name     = (data["name"] as? String)!
                userProfile.lastName = (data["lastName"] as? String) ?? ""
                                
                return userProfile
            }
    }
    
    func userLoggout() -> Bool {
        try! self.auth.signOut()
        return true
    }
    
}
