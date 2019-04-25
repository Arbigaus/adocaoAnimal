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
    let disposeBag = DisposeBag()
    
    var viewModel: FeedViewModel!
    var petsList = [ Pet ]()
    let tapGesture = UITapGestureRecognizer()
    
    weak var delegate: AppActionable?
    
    @IBOutlet var locationAnimationView: AnimationView!
    
    @IBOutlet weak var perfilButton: UIButton!
    @IBOutlet weak var petsTableView: UITableView!
    @IBOutlet weak var filterCollectionView: UICollectionView!
    @IBOutlet weak var perfilView: UIView!
    
    init(viewModel: FeedViewModel = .init()) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: FeedView.self), bundle: nil)
        
        let petVader = Pet(name: "Darth Vader", size: .smal, image: "dog1.png", owner: "Adriele", address: "Rua ali", neighborhood: "CIC - 5,4km")
        let petLeia = Pet(name: "Princesa Leia", size: .medium, image: "cat1.jpg", owner: "Gerson", address: "Rua de lá", neighborhood: "Pinheirinho - 2,3km")
        let petYoda = Pet(name: "Yoda", size: .smal, image: "dog1.jpg", owner: "Skywalker", address: "Rua de cima", neighborhood: "Novo Mundo - 10km")
        
        petsList.append(petVader)
        petsList.append(petLeia)
        petsList.append(petYoda)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
        self.setupBindings()
        
        perfilButton.layer.cornerRadius = 20
        perfilView.layer.cornerRadius = 25
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    
}

extension FeedView {
    
    func configureViews() {
        startAnimationView()
        
        petsTableView.register(R.nib.petTableViewCell)
        filterCollectionView.register(R.nib.homeFilterCollectionViewCell)
    }
    
    func setupBindings() {
        
        let itemsTableView = Observable.just(
            petsList.map { $0 }
        )
        
        let filters = [ "Cachorros", "Gatos", "Coelhos", "Outros" ]
        
        let itemsCollecView = Observable.just(
            filters.map { "\($0)" }
        )
        
        itemsTableView
            .bind(to: petsTableView.rx
                .items(cellIdentifier: R.reuseIdentifier.petTableView.identifier,
                       cellType: PetTableViewCell.self)) { [unowned self] _ , pet, cell in
                        cell.bind(pet)
        }.disposed(by: disposeBag)
        
        self.petsTableView.rx
            .modelSelected(Pet.self)
            .subscribe(onNext: { (pet) in
                self.delegate?.handle(.showPetDetails(pet))
            }, onError: { (error) in
                print(error)
            }).disposed(by: disposeBag)
        
        itemsCollecView
            .bind(to: filterCollectionView.rx
                .items(cellIdentifier: R.reuseIdentifier.filterCollectionView.identifier,
                       cellType: HomeFilterCollectionViewCell.self)) { (row, element, cell) in
                        cell .homeFilterLabel.text = element
        }.disposed(by: disposeBag)
        
        perfilButton.rx.tap.bind { [unowned self] _ in
            self.delegate?.handle(.showLogin)
            }.disposed(by: disposeBag)
        
    }
    
    func startAnimationView() {
        
        let locationAnimation = Animation.named("location")
        
        locationAnimationView.loopMode = .loop
        locationAnimationView.animation = locationAnimation
        locationAnimationView.play()
        
    }
}
