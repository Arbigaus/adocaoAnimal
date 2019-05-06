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
    
    weak var delegate: AppActionable?
    @IBOutlet weak var nameLabel: UITextField!
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
            fullName  : self.nameLabel.rx.text.orEmpty.asDriver(),
            email     : self.emailLabel.rx.text.orEmpty.asDriver(),
            passwd    : self.passwdLabel.rx.text.orEmpty.asDriver(),
            createTap : self.createAccountButton.rx.tap.asSignal() )
    }
    
    func configureViews() {}
    
    // MARK: - SetupBindings
    func setupBindings() {
        
        // Verifica se o usuário foi logado e redireciona para a tela principal
        self.viewModel.loggedUser
            .subscribe(onNext: { status in
                if status == .logged {
                    self.delegate?.handle(.showFeed)
                }
            })
            .disposed(by: disposeBag)
        
        
    }
}
