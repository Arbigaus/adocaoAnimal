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
        var msg = Response()
        
        self.uploadImages(petImages) { (imagesResponse) in
            print(imagesResponse)
            uploadedImages.onNext(true)
        }
        
        uploadedImages
            .asObservable()
            .subscribe(onNext: { (imagesUploaded) in
                if imagesUploaded {
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
                            }).disposed(by: self.disposeBag)
                    
                }
            }).disposed(by: disposeBag)
        
        return response.asObservable()
        
    }
    
    fileprivate func uploadImages(_ images: [PHAsset], handler: @escaping (([String]) -> Void) ) {
        
        let count = PublishSubject<Int>()
        let response = [String]()
        
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
                        
                        count.onNext(actualIndex!)
                    }, onError: { error in
                        print("Erro ao fazer upload!!")
                    }).disposed(by: disposeBag)
            }
            
        }
        
        count.asObservable()
            .subscribe(onNext: { (i) in
                if response.count == images.count {
                    handler(response)
                }
            }).disposed(by: self.disposeBag)
    }
    
    
}

