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
    
    var viewModel: CreateAccountViewModel!
    
    weak var delegate: AppActionable?
    @IBOutlet weak var createAccountButton: UIButton!
    
    init() {
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
        self.viewModel = CreateAccountViewModel(
           
        )
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {

    }
}
