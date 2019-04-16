//
//  PetDetailsView.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 04/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol PetDetailsViewDelegate: class {
    
}

class PetDetailsView: UIViewController {
    
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var ownerImage: UIImageView!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var petDescriptionLabel: UILabel!
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var petDescriptionText: UITextView!
    
    @IBOutlet weak var petDetailsCollection: UICollectionView!
    
    @IBOutlet weak var adoptButtom: UIButton!
    @IBOutlet var backButton: UIButton!
    
    var viewModel: PetDetailsViewModel!
    weak var delegate: AppActionable?
    
    var pet: Pet

    init(pet: Pet) {
        self.pet = pet
        super.init(nibName: String(describing: PetDetailsView.self), bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
        self.setupViewModel()
        self.setupBindings()
        
        self.petImage?.image = UIImage(named: self.pet.image)
        self.petNameLabel?.text = self.pet.name
        self.ownerName?.text = self.pet.owner
        
        self.ownerImage.layer.cornerRadius = 25
        self.adoptButtom.layer.cornerRadius = 15
        
        self.adoptButtom.layer.borderColor = UIColor(red:255/255, green:255/255, blue:255/255, alpha: 0.8).cgColor
        
    }

    
}

extension PetDetailsView {
    
    func setupViewModel() {
        self.viewModel = PetDetailsViewModel(
           
        )
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {
        backButton.rx
            .tap.subscribe { [unowned self] in
                self.delegate?.handle(.back)        }
    }
}
