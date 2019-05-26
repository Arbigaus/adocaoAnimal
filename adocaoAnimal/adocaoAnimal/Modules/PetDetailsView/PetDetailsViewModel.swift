//
//  PetDetailsViewModel.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 04/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import RxSwift
import RxCocoa

class PetDetailsViewModel {
    fileprivate let petService = PetsServiceImpl()
    
    let petImages = PublishSubject<[UIImage]>()
    
    init() {
        
    }
    
    func setupBindings(petImageList: [String]){
        var petImage = [UIImage]()
        petImageList.map{ petImageUrl in
            self.petService.getImage(petImageUrl, handler: { image in
                petImage.append(image)
                self.petImages.onNext(petImage)
            })            
        }
        
    }
    
}
