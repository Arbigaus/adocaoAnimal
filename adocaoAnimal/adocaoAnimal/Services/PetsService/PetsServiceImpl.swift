//
//  PetsServiceImpl.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 17/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import RxSwift
import FirebaseFirestore
import RxFirebase

class PetsServiceImpl: NSObject, PetsService {
    
    fileprivate let disposeBag = DisposeBag()
    fileprivate let db = Firestore.firestore()
    
    func createPet(_ pet: Pet) -> Observable<Response> {
        let response = PublishSubject<Response>()
        var msg = Response()
        
        self.db.collection("Pets")
            .rx
            .addDocument(data: [
                "name" : pet.name
            ]).subscribe(onNext: { ref in
                
                msg.message = ref.documentID
                msg.passed = true
                print("Document added with ID: \(ref.documentID)")
                
                response.onNext(msg)
                
            }, onError: { error in
                
                msg.message = "Error adding document: \(error)"
                msg.passed = false
                
                response.onNext(msg)
                print("Error adding document: \(error)")
            }).disposed(by: disposeBag)
        
        
        return response.asObservable()
        
    }
    
    
}

