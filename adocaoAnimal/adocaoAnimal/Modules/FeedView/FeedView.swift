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
    let loadingView = LoadingView()
        
    var viewModel: FeedViewModel!
    var petsList = PublishSubject<[Pet]>()
//    let tapGesture = UITapGestureRecognizer()
    
    weak var delegate: AppActionable?
    
    fileprivate var userDetails = Profile()
    
    @IBOutlet var locationAnimationView: AnimationView!
    
    @IBOutlet weak var perfilButton: UIButton!
    @IBOutlet weak var petsTableView: UITableView!
    @IBOutlet weak var filterCollectionView: UICollectionView!
    @IBOutlet weak var perfilView: UIView!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    init( viewModel: FeedViewModel = .init() ) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: FeedView.self), bundle: nil)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBindings()
        
        perfilButton.layer.cornerRadius = 20
        perfilView.layer.cornerRadius = 25
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        super.viewWillAppear(animated)
        
        self.configureViews()
//        self.loadingAnimation(true)
    }
    
}

extension FeedView {
    
    func configureViews() {
        startAnimationView()
        
        petsTableView.register(R.nib.petTableViewCell)
        filterCollectionView.register(R.nib.homeFilterCollectionViewCell)
        
        self.view.addSubview(self.loadingView)
        self.loadingView.prepareForConstraints()
        self.loadingView.pinEdgesToSuperview()
        
    }
    
    func setupBindings() {
        
        viewModel.isLoading.drive(onNext: { (isLoading) in
            self.loadingAnimation(isLoading)
        }).disposed(by: disposeBag)
        
        viewModel.userDetails
            .subscribe(onNext: { user in
                self.userDetails = user
                if user.name != "" {
                    self.welcomeLabel.text = "Olá \(user.name)"
                    
                } else {
                    self.welcomeLabel.text = "Bem vindo"
                    
                }
            })
            .disposed(by: disposeBag)
        
        // Popular a Table View de pets
        petsList.asObservable()
            .bind(to: petsTableView.rx
                .items(cellIdentifier: R.reuseIdentifier.petTableView.identifier,
                       cellType: PetTableViewCell.self)) { (row , pet, cell) in
                            cell.bind(pet)
            }
            .disposed(by: disposeBag)
        
        // Chamar a view de Pet
        self.petsTableView.rx
            .modelSelected(Pet.self)
            .subscribe(onNext: { (pet) in
                self.delegate?.handle(.showPetDetails(pet))
            }, onError: { (error) in
                print(error)
            }).disposed(by: disposeBag)
        
        // Popular a collection view de filtros
        let filters = [ "Cachorros", "Gatos", "Coelhos", "Outros" ]
        
        let itemsCollecView = Observable.just(
            filters.map { "\($0)" }
        )
        
        itemsCollecView
            .bind(to: filterCollectionView.rx
                .items(cellIdentifier: R.reuseIdentifier.filterCollectionView.identifier,
                       cellType: HomeFilterCollectionViewCell.self)) { (row, element, cell) in
                            cell.homeFilterLabel.text = element
            }
            .disposed(by: disposeBag)
        
        // Ação do botão de perfil
        perfilButton
            .rx.tap.bind { [unowned self] _ in
                
                if self.userDetails.name != "" {
                    self.delegate?.handle(.showUserProfile)
                } else {
                    self.delegate?.handle(.showLogin)
                }
            }
            .disposed(by: disposeBag)
        
        self.viewModel.petList!
            .asObservable()
            .subscribe(onNext: { pets in
                self.petsList.onNext(pets)
            })
            .disposed(by: self.disposeBag)
        
    }
    
    func startAnimationView() {
        
        let locationAnimation = LOTAnimationView(name: "location")
        
        locationAnimation.center = self.locationAnimationView.center
        locationAnimation.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        locationAnimation.contentMode = .scaleAspectFill
        locationAnimation.loopAnimation = true
        
        self.locationAnimationView.addSubview(locationAnimation)
        
        locationAnimation.play()
        
    }
    
    func loadingAnimation(_ isLoading: Bool){
        DispatchQueue.main.async {
            isLoading ? self.loadingView.show() : self.loadingView.hide()
        }
    }
    
}
