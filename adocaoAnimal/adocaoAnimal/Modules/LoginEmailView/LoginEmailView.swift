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

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    init() {
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
        
        createAccountButton.layer.borderWidth = 1
        createAccountButton.layer.borderColor = UIColor(red:255/255, green:255/255, blue:255/255, alpha: 0.8).cgColor
        createAccountButton.layer.cornerRadius = 6
        
        loginButton.layer.cornerRadius = 6
//        loginButton.layer.borderWidth = 6
//        loginButton.layer.borderColor = UIColor(red:255/255, green:255/255, blue:255/255, alpha: 0.8).cgColor
        
    }
    
    // Definir para mostrar a navigation bar nesta View
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
}

extension LoginEmailView {
    
    func setupViewModel() {
        self.viewModel = LoginEmailViewModel(
           
        )
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {
        createAccountButton.rx.tap.bind { [unowned self] _ in
            self.delegate?.handle(.showCreateAccount)
            }.disposed(by: disposeBag)
    }
}
