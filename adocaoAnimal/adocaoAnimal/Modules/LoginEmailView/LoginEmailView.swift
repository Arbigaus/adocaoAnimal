//
//  LoginEmailView.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 24/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol LoginEmailViewDelegate: class {
    
}

class LoginEmailView: UIViewController {
    var viewModel: LoginEmailViewModel!
    
    weak var delegate: AppActionable?
    let disposeBag = DisposeBag()
    
    let loadingView = LoadingView()

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var goToCreateAccountButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwdField: UITextField!
    
    init() {
        self.viewModel = LoginEmailViewModel()
        super.init(nibName: String(describing: LoginEmailView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
        self.setupViewModel()
        self.setupBindings()
        
        self.title = "Entrar com e-mail"
        
        goToCreateAccountButton.layer.borderWidth = 1
        goToCreateAccountButton.layer.borderColor = UIColor(red:255/255, green:255/255, blue:255/255, alpha: 0.8).cgColor
        goToCreateAccountButton.layer.cornerRadius = 6
        
        loginButton.layer.cornerRadius = 6
        
    }
    
    // Definir para mostrar a navigation bar nesta View
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
}

// MARK: LoginEmailView extensions
extension LoginEmailView {
    
    func setupViewModel() {
        self.viewModel.setupBindings(
            email    : self.emailField.rx.text.orEmpty.asDriver(),
            passwd   : self.passwdField.rx.text.orEmpty.asDriver(),
            loginTap : self.loginButton.rx.tap.asSignal()
        )
    }
    
    func configureViews() {
        self.view.addSubview(self.loadingView)
        self.loadingView.prepareForConstraints()
        self.loadingView.pinEdgesToSuperview()
    }
    
    // MARK: SetupBindings
    
    func setupBindings() {
        
        viewModel.isLoading.drive(onNext: { (isLoading) in
            self.loadingAnimation(isLoading)
        }).disposed(by: self.disposeBag)
        
        // Ação do botão de criar conta para redirecionar o usuário
        goToCreateAccountButton.rx.tap.bind { [unowned self] _ in
            self.delegate?.handle(.showCreateAccount)
            }
            .disposed(by: disposeBag)
        
        loginButton.rx.tap.bind { [unowned self] _ in
            self.view.endEditing(true)
            }.disposed(by: disposeBag)
        
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
