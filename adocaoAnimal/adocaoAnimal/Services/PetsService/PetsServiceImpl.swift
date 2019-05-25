//
//  PetsServiceImpl.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 17/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import RxSwift
import Photos
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import RxFirebase

class PetsServiceImpl: NSObject, PetsService {
    
    fileprivate let disposeBag = DisposeBag()
    fileprivate let db = Firestore.firestore()
    fileprivate let st = Storage.storage()
    var userDetails = Profile()
    
    private lazy var imageManager = PHCachingImageManager()

    
    func createPet(
            petName: String,
            petAge: String,
            petColor: String,
            petGender: String,
            petType: String,
            petWeight: String,
            petDescription: String,
            petImages: [ PHAsset ]
        ) -> Observable<Response> {
        
        let response = PublishSubject<Response>()
        
        let petToSend = Pet(
            petName: petName,
            petAge: petAge,
            petColor: petColor,
            petGender: petGender,
            petType: petType,
            petWeight: petWeight,
            petDescription: petDescription,
            petImages: petImages
        )
        
        self.createPet(petImages, petToSend) { createResponse in
           response.onNext(createResponse)
        }
        
        return response.asObservable()
        
    }
    
    fileprivate func createPet(_ images: [PHAsset], _ petToSend: Pet, handler: @escaping ((Response) -> Void) ) {
        var urlImages = [String]()
        let countUrl = PublishSubject<String>()
        
        for image in images {
            
            let reference = self.st
                .reference(forURL: "gs://adocaoanimal-21d2c.appspot.com/pets/\(UUID().uuidString).jpg")
                .rx
            
            let options = PHImageRequestOptions()
            options.deliveryMode = PHImageRequestOptionsDeliveryMode.highQualityFormat

            self.imageManager.requestImageData(
                for: image,
                options: options
                ) { (imageData, _, _, _) in
                    reference.putData(imageData!)
                        .subscribe(onNext: { metadata in
                            countUrl.onNext("\(metadata.path ?? "" )")
                        }, onError: { error in
                            print("Erro ao fazer upload!!")
                        }).disposed(by: self.disposeBag)
            }
            
        }
        
        countUrl.asObservable()
            .subscribe(onNext: { urlImages.append( $0 ) })
            .disposed(by: disposeBag)
        
        countUrl.asObservable()
            .subscribe(onNext: { _ in
                if urlImages.count == images.count {
                    self.createPetOnDb(petToSend, urlImages, handler: { response in
                        handler(response)
                    })
                }
            }).disposed(by: disposeBag)
        
    }
    
    fileprivate func createPetOnDb(_ petToSend : Pet,_ imagesUrl : [ String ], handler: @escaping ((Response) -> Void)) {
        
        var msg = Response()
        
        self.db.collection("Pets")
            .rx
            .addDocument(data: [
                "petName"        : petToSend.petName,
                "petTutorId"     : "\(Auth.auth().currentUser?.uid ?? "")",
                "petTutorName"   : self.userDetails.name,
                "petImages"      : imagesUrl,
                "petAge"         : petToSend.petAge,
                "petWeight"      : petToSend.petWeight,
                "petType"        : petToSend.petType,
                "petColor"       : petToSend.petColor,
                "petDescription" : petToSend.petDescription
                ]).subscribe(onNext: { ref in
                    
                    msg.message = ref.documentID
                    msg.passed = true
                    handler(msg)
                    
                }, onError: { error in
                    
                    msg.message = "Error adding document: \(error)"
                    msg.passed = false
                    handler(msg)
                    
                }).disposed(by: self.disposeBag)
    }
    
    
}

