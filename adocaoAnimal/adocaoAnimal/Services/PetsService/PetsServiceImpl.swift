//
//  PetsServiceImpl.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 17/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import RxSwift
import Photos
import FirebaseFirestore
import FirebaseStorage
import RxFirebase

class PetsServiceImpl: NSObject, PetsService {
    
    fileprivate let disposeBag = DisposeBag()
    fileprivate let db = Firestore.firestore()
    
    func createPet(
            petName: String,
            petSize: String,
            petColor: String,
            petGender: String,
            petType: String,
            petWeight: String,
            petDescription: String,
            petImages: [ PHAsset ]
        ) -> Observable<Response> {
        let response = PublishSubject<Response>()
        var msg = Response()
        
        let reference = Storage.storage()
            .reference(forURL: "gs://adocaoanimal-21d2c.appspot.com/images/teste.jpg")
            .rx
        
        var dataImage : Data?
        
        if petImages.count > 0 {
            PHImageManager().requestImage(for: petImages[0], targetSize: PHImageManagerMaximumSize, contentMode: PHImageContentMode.default, options: nil) { (pickedImage, info) in
                print(pickedImage)
                print(info)
                dataImage = pickedImage!.jpegData(compressionQuality: 1)
            }
        }
        
        if dataImage != nil {
            reference.putData(dataImage!)
                .subscribe(onNext: { metadata in
                    // Success
                }, onError: { error in
                    // Uh-oh, an error occurred!
                }).disposed(by: disposeBag)
        }
        
        let petToSend = Pet(
                    petName: petName,
                    petSize: petSize,
                    petColor: petColor,
                    petGender: petGender,
                    petType: petType,
                    petWeight: petWeight,
                    petDescription: petDescription,
                    petImages: petImages
            )
        
        
        self.db.collection("Pets")
            .rx
            .addDocument(data: [
                "name" : petToSend.petName
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

