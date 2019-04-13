//
//  FeedView.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 03/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Lottie

class FeedView: UIViewController {
    
    var viewModel: FeedViewModel!
    
    weak var delegate: AppActionable?
    
    @IBOutlet var locationAnimationView: AnimationView!
    
    @IBOutlet weak var petsTableView: UITableView!
    @IBOutlet weak var filterCollectionView: UICollectionView!
    
    init(viewModel: FeedViewModel = .init()) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: FeedView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
        self.setupBindings()
    }
    
    
    
}

extension FeedView {
    
    func configureViews() {
        startAnimationView()
        
        petsTableView.register(R.nib.petTableViewCell)
        filterCollectionView.register(R.nib.homeFilterCollectionViewCell)
    }
    
    func setupBindings() {
        
        let pets = [ ["name" : "Darth Vader", "image" : "dog1.png"], ["name" : "Princesa Leia", "image" : "dog2.png"], ["name" : "Yoda", "image" : "dog1.png" ] ]
        let itemsTableView = Observable.just(
            pets.map { $0 }
        )
        
        let filters = [ "Cachorros", "Gatos", "Coelhos", "Outros" ]
        
        let itemsCollecView = Observable.just(
            filters.map { "\($0)" }
        )
        
        itemsTableView
            .bind(to: petsTableView.rx
                .items(cellIdentifier: R.reuseIdentifier.petTableView.identifier,
                       cellType: PetTableViewCell.self)) { (row, pet, cell) in
                        cell.bind(pet)
        }
        
        self.petsTableView.rx
            .modelSelected(PetDetailsView.self)
            .subscribe( { (pet) in
                self.delegate?.handle(.showPetDetails)
            })
        
        itemsCollecView
            .bind(to: filterCollectionView.rx
                .items(cellIdentifier: R.reuseIdentifier.filterCollectionView.identifier,
                       cellType: HomeFilterCollectionViewCell.self)) { (row, element, cell) in
                        cell .homeFilterLabel.text = element
        }
        
    }
    
    func startAnimationView() {
        
        let locationAnimation = Animation.named("location")
        
        locationAnimationView.loopMode = .loop
        locationAnimationView.animation = locationAnimation
        locationAnimationView.play()
        
    }
}
