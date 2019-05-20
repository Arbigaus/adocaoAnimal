//
//  CreateAccountView.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 24/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol CreateAccountViewDelegate: class {
    
}

class CreateAccountView: UIViewController {
    
    fileprivate let disposeBag = DisposeBag()
    var viewModel: CreateAccountViewModel
    
    let loadingView = LoadingView()
    
    weak var delegate: AppActionable?
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwdLabel: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    
    init() {
        self.viewModel = CreateAccountViewModel()
        
        super.init(nibName: String(describing: CreateAccountView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
        self.setupViewModel()
        self.setupBindings()
        
        self.title = "Cadastro"
        
        createAccountButton.layer.cornerRadius = 6
    }
    
    // Definir para mostrar a navigation bar nesta View
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
}

extension CreateAccountView {
    
    func setupViewModel() {
        
        self.viewModel.setupBindings(
            name      : self.nameLabel.rx.text.orEmpty.asDriver(),
            lastName  : self.lastNameLabel.rx.text.orEmpty.asDriver(),
            email     : self.emailLabel.rx.text.orEmpty.asDriver(),
            passwd    : self.passwdLabel.rx.text.orEmpty.asDriver(),
            createTap : self.createAccountButton.rx.tap.asSignal() )
    }
    
    func configureViews() {
        
        self.view.addSubview(self.loadingView)
        self.loadingView.prepareForConstraints()
        self.loadingView.pinEdgesToSuperview()
        
    }
    
    // MARK: - SetupBindings
    func setupBindings() {
        
        viewModel.isLoading.drive(onNext: { (isLoading) in
            self.loadingAnimation(isLoading)
        }).disposed(by: self.disposeBag)
        
        // Verifica se o usuário foi logado e redireciona para a tela principal
        self.viewModel.loggedUser
            .subscribe(onNext: { status in
                if status == .logged {
                    self.delegate?.handle(.showFeed)
                }
            })
            .disposed(by: disposeBag)
    }
    
    func loadingAnimation(_ isLoading: Bool){
        DispatchQueue.main.async {
            isLoading ? self.loadingView.show() : self.loadingView.hide()
        }
    }
    
}
