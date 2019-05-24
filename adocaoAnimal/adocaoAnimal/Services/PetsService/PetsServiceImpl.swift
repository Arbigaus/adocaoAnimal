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
    private lazy var imageManager = PHCachingImageManager()
    
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
        let uploadedImages = PublishSubject<Bool>()
        
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
        
        self.uploadImages(petImages, petToSend) { createResponse in
           response.onNext(createResponse)
        }
        
        return response.asObservable()
        
    }
    
    fileprivate func uploadImages(_ images: [PHAsset],_ petToSend: Pet, handler: @escaping ((Response) -> Void) ) {
        
        let count = PublishSubject<Int>()
        var urlImages = [String]()
        let response = Response()
        
        let reference = Storage.storage()
            .reference(forURL: "gs://adocaoanimal-21d2c.appspot.com/pets/\(UUID().uuidString)")
            .rx
        
        for image in images {
            var imageToSend : Data?
            self.imageManager.requestImageData(
                for: image,
                options: nil) { (imageData, _, _, _) in
                    imageToSend = imageData
            }
            
            if imageToSend != nil {
                reference.putData(imageToSend!)
                    .subscribe(onNext: { metadata in
                        print("Aquiii ====>")
                        print(metadata.name)
                        print(metadata.bucket)
                        print(metadata.path)
                        print(metadata.customMetadata)
                        
                        let actualIndex = images.index(of: image)
                        
                        urlImages.append("\(String(describing: metadata.name))")
                        
                        count.onNext(actualIndex!)
                    }, onError: { error in
                        print("Erro ao fazer upload!!")
                    }).disposed(by: disposeBag)
            }
            
        }
        
        count.asObservable()
            .subscribe(onNext: { (i) in
                var createResponse = Response()
                if urlImages.count == images.count {
                    self.createPetOnDb(petToSend, urlImages, handler: { response in
                        createResponse.message = response.message
                        createResponse.passed = response.passed
                    })
                    handler(response)
                }
            }).disposed(by: self.disposeBag)
    }
    
    fileprivate func createPetOnDb(_ petToSend : Pet,_ imagesUrl : [ String ], handler: @escaping ((Response) -> Void)) {
        
        var msg = Response()
        
        self.db.collection("Pets")
            .rx
            .addDocument(data: [
                "name" : petToSend.petName
                ]).subscribe(onNext: { ref in
                    
                    msg.message = ref.documentID
                    msg.passed = true
                    print("Document added with ID: \(ref.documentID)")
                    
                    handler(msg)
                    
                }, onError: { error in
                    
                    msg.message = "Error adding document: \(error)"
                    msg.passed = false
                    
                    handler(msg)
                    print("Error adding document: \(error)")
                }).disposed(by: self.disposeBag)
    }
    
    
}

