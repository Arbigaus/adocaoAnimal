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
        ) -> Observable<Response>
    {
        
        let response = PublishSubject<Response>()
        
        let petToSend = Pet(
            petName: petName,
            petAge: petAge,
            petColor: petColor,
            petGender: petGender,
            petType: petType,
            petWeight: petWeight,
            petDescription: petDescription,
            petImages: nil,
            petTutorID: nil,
            petTutorName: nil
        )
        
        self.createPet(petImages, petToSend) { createResponse in
           response.onNext(createResponse)
        }
        
        return response.asObservable()
        
    }
    
    // MARK: - Main Create Pet
    fileprivate func createPet(_ images: [PHAsset], _ petToSend: Pet, handler: @escaping ((Response) -> Void) ) {
        var urlImages = [String]()
        let countUrl = PublishSubject<String>()
        var pet = petToSend
        
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
                    pet.petImages = urlImages 
                    self.createPetOnDb(pet, handler: { response in
                        handler(response)
                    })
                }
            }).disposed(by: disposeBag)
        
    }
    
    fileprivate func createPetOnDb(_ petToSend : Pet, handler: @escaping ((Response) -> Void)) {
        
        var msg = Response()
        
        self.db.collection("Pets")
            .rx
            .addDocument(data: [
                "petName"        : petToSend.petName,
                "petTutorId"     : "\(Auth.auth().currentUser?.uid ?? "")",
                "petTutorName"   : self.userDetails.name,
                "petImages"      : petToSend.petImages as Any,
                "petAge"         : petToSend.petAge,
                "petGender"      : petToSend.petGender,
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
    
    // MARK: - Main Get All Pets
    func getAllPets(handler: @escaping (([Pet]) -> Void) ) {
//        let petListToReturn = PublishSubject<[Pet]>()
        var pets = [ Pet ]()
        
        db.collection("Pets")
            .rx
            .getDocuments()
            .subscribe(onNext: { snapshot in
                pets = snapshot.documents.map { petSnapshot -> Pet in
                    let data = petSnapshot.data()
                    
                    let petData = Pet(
                            petName         : data["petName"] as! String,
                            petAge          : data["petAge"] as! String,
                            petColor        : data["petColor"] as! String,
                            petGender       : data["petGender"] as! String,
                            petType         : data["petType"] as! String,
                            petWeight       : data["petWeight"] as! String,
                            petDescription  : data["petDescription"] as! String,
                            petImages       : (data["petImages"] as! [String]),
                            petTutorID      : (data["petTutorId"] as! String),
                            petTutorName    : (data["petTutorName"] as! String)
                        )
                    
                    return petData
                }
                handler(pets)
            }, onError: { error in
                print("Error fetching snapshots: \(error)")
            })
            .disposed(by: disposeBag)
        
//        return petListToReturn.asObservable()
        
    }
    
    // MARK: - Get Pets from user
    func getPetsFromUser(_ userUuid: String) -> Observable<[Pet]> {
        let petListToReturn = PublishSubject<[Pet]>()
        var pets = [ Pet ]()
        
        db.collection("Pets")
            .whereField("petTutorId", isEqualTo: userUuid)
            .rx
            .getDocuments()
            .subscribe(onNext: { snapshot in
                pets = snapshot.documents.map { petSnapshot -> Pet in
                    let data = petSnapshot.data()
                    
                    let petData = Pet(
                        petName         : data["petName"] as! String,
                        petAge          : data["petAge"] as! String,
                        petColor        : data["petColor"] as! String,
                        petGender       : data["petGender"] as! String,
                        petType         : data["petType"] as! String,
                        petWeight       : data["petWeight"] as! String,
                        petDescription  : data["petDescription"] as! String,
                        petImages       : (data["petImages"] as! [String]),
                        petTutorID      : (data["petTutorId"] as! String),
                        petTutorName    : (data["petTutorName"] as! String)
                    )
                    
                    return petData
                }
                petListToReturn.onNext(pets)
            }, onError: { error in
                print("Error fetching snapshots: \(error)")
            })
            .disposed(by: disposeBag)
        
        return petListToReturn.asObservable()
        
    }
    
    // MARK: - Get pets by type
    func getPetsByType(_ type: String, handler: @escaping (([Pet]) -> Void)) {
//        let petListToReturn = PublishSubject<[Pet]>()
        var pets = [ Pet ] ()
        
        db.collection("Pets")
            .whereField("petType", isEqualTo: type.dropLast())
            .rx
            .getDocuments()
            .subscribe(onNext: { snapshot in
                pets = snapshot.documents.map { petSnapshot -> Pet in
                    let data = petSnapshot.data()
                    
                    let petData = Pet(
                        petName         : data["petName"] as! String,
                        petAge          : data["petAge"] as! String,
                        petColor        : data["petColor"] as! String,
                        petGender       : data["petGender"] as! String,
                        petType         : data["petType"] as! String,
                        petWeight       : data["petWeight"] as! String,
                        petDescription  : data["petDescription"] as! String,
                        petImages       : (data["petImages"] as! [String]),
                        petTutorID      : (data["petTutorId"] as! String),
                        petTutorName    : (data["petTutorName"] as! String)
                    )
                    
                    return petData
                }
                handler(pets)
            }, onError: { error in
                print("Error fetching snapshots: \(error)")
            })
            .disposed(by: disposeBag)
        
        
    }
    
    
    // MARK: - Get Photos Function
    func getImage(_ imageAddress: String , handler: @escaping (UIImage) -> Void ) {
        let forUrl = "gs://adocaoanimal-21d2c.appspot.com/"
        
        let reference = self.st
            .reference(forURL: "\(forUrl)\(imageAddress)")
            .rx
        
        reference.getData(maxSize: 4 * 1024 * 1024)
            .subscribe(onNext: { data in
                handler(UIImage(data: data)!)
            })
            .disposed(by: disposeBag)
        
        
    }
    
}

