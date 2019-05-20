//
//  UserProfileView.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 09/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol UserProfileViewDelegate: class {
    
}

class UserProfileView: UIViewController {
    
    var viewModel: UserProfileViewModel!
    fileprivate let disposeBag = DisposeBag()
    
    fileprivate var petsList = [ Pet ]()
    fileprivate var userDetails = Profile()
    
    weak var delegate: AppActionable?

    @IBOutlet weak var emailTextLabel: UILabel!
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var addressTextLabel: UILabel!
    @IBOutlet weak var phoneTextLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var perfilImage: UIImageView!
    
    @IBOutlet weak var petsTableView: UITableView!
    
    init() {
        self.viewModel = UserProfileViewModel()
        super.init(nibName: String(describing: UserProfileView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(title: "< Voltar", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.back(sender:)))
        self.navigationItem.leftBarButtonItem = backButton
        
        let loggoutButton = UIBarButtonItem(title: "Sair", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.loggout(sender:)))
        self.navigationItem.rightBarButtonItem = loggoutButton
        
        self.configureViews()
        self.setupViewModel()
        self.setupBindings()
    }
    
    @objc func back(sender: UIBarButtonItem) {
        self.delegate?.handle(.showFeed)
    }
    
    @objc func loggout(sender: UIBarButtonItem) {
        self.viewModel.loggout()
    }
    
}

extension UserProfileView {
    
    func setupViewModel() {
//        viewModel.setupBindings(loggoutTap: self.loggoutButton.rx.tap.asSignal())
    }
    
    func configureViews() {
        
        self.perfilImage.layer.cornerRadius = 30
        self.updateButton.layer.cornerRadius = 20
        self.updateButton.layer.borderWidth = 4
        self.updateButton.layer.borderColor = UIColor(red:255/255, green:255/255, blue:255/255, alpha: 0.8).cgColor
        
    }
    
    func setupBindings() {
        
        viewModel.userDetails
            .subscribe(onNext: { user in
                self.userDetails = user
                if user.name != "" {
                    self.nameTextLabel.text = user.fullName
                    self.emailTextLabel.text = user.email
                }
            })
            .disposed(by: disposeBag)
        
        let itemsTableView = Observable.just(
            self.petsList.map { $0 }
        )
        
        itemsTableView
            .bind(to: self.petsTableView.rx
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
        
        self.petsTableView.rx.itemDeleted
            .subscribe {
                print($0)
            }
            .disposed(by: disposeBag)
        
        
        self.viewModel.loggedUser
            .subscribe(onNext: { user in
                if user == .notLogged {
                    self.delegate?.handle(.showFeed)
                }
            })
            .disposed(by: disposeBag)
    }
}
