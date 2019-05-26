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
    var viewModel: PetDetailsViewModel!
    weak var delegate: AppActionable?
    let loadingView = LoadingView()
    
    var petDetailsToShow = PublishSubject<[ String ]>()
    
    var petDetails: Pet
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var petImageCollectionView: UICollectionView!
    @IBOutlet weak var ownerImage: UIImageView!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var petDescriptionLabel: UILabel!
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var petDetailsCollection: UICollectionView!
    
    @IBOutlet weak var adoptButtom: UIButton!
    
    init(pet: Pet) {
        self.petDetails = pet
        
        super.init(nibName: String(describing: PetDetailsView.self), bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.loadingAnimation(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
        self.setupViewModel()
        self.setupBindings()
        
        self.title = self.petDetails.petName
        
        self.navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(title: "< Voltar", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.back(sender:)))
        self.navigationItem.leftBarButtonItem = backButton
        
        self.petNameLabel.text = self.petDetails.petName
        self.ownerName.text = self.petDetails.petTutorName
        self.petDescriptionLabel.text = self.petDetails.petDescription
        
        var petDetailsToAppend = [String]()
        
        petDetailsToAppend.append("\(self.petDetails.petAge) Anos")
        petDetailsToAppend.append("\(self.petDetails.petWeight) Kg")
        petDetailsToAppend.append("\(self.petDetails.petColor)")
        petDetailsToAppend.append("\(self.petDetails.petGender)")
        
        self.petDetailsToShow.onNext(petDetailsToAppend)
        
        
        self.ownerImage.layer.cornerRadius = 25
        
        self.adoptButtom.layer.cornerRadius = 25
        self.adoptButtom.layer.borderWidth = 6
        
        self.adoptButtom.layer.borderColor = UIColor(red:255/255, green:255/255, blue:255/255, alpha: 0.8).cgColor
        
    }
}

extension PetDetailsView {
    
    func setupViewModel() {
        self.viewModel = PetDetailsViewModel()
        self.viewModel.setupBindings(petImageList: self.petDetails.petImages!)
    }
    
    func configureViews() {
        petDetailsCollection.register(R.nib.petDetailInfoCollectionViewCell)
        petImageCollectionView.register(R.nib.petDetailImageCollectionViewCell)
        
        self.view.addSubview(self.loadingView)
        self.loadingView.prepareForConstraints()
        self.loadingView.pinEdgesToSuperview()
        
    }
    
    func setupBindings() {
        
        self.viewModel.petImages
            .asObservable()
            .bind(to: petImageCollectionView.rx
                .items(cellIdentifier: R.reuseIdentifier.petDetailImageCollectionViewCell.identifier,
                       cellType: PetDetailImageCollectionViewCell.self)) { (row, element, cell) in
                        cell.bind(element)
                        self.loadingAnimation(false)
            }
            .disposed(by: disposeBag)
        
        self.petDetailsToShow
            .asObservable()
            .bind(to: petDetailsCollection.rx
                .items(cellIdentifier: R.reuseIdentifier.petDetailCollectionViewCell.identifier,
                       cellType: PetDetailInfoCollectionViewCell.self)) { (row, element, cell) in
                        cell .titleLabel.text = element
        }.disposed(by: disposeBag)
        
        
    }
    
    @objc func back(sender: UIBarButtonItem) {
        self.delegate?.handle(.showFeed)
    }
    
    func loadingAnimation(_ isLoading: Bool){
        DispatchQueue.main.async {
            isLoading ? self.loadingView.show() : self.loadingView.hide()
        }
    }
    
    
}
