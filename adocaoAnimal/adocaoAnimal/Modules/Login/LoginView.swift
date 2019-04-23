//
//  LoginView.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 22/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginView: UIViewController {
    
    var viewModel: LoginViewModel!
    
    weak var delegate: AppActionable?
    
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    
    init() {
        super.init(nibName: String(describing: LoginView.self), bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
        self.setupViewModel()
        self.setupBindings()
        
        emailButton.layer.borderWidth = 1
        emailButton.layer.borderColor = UIColor(red:255/255, green:255/255, blue:255/255, alpha: 0.8).cgColor
        emailButton.layer.cornerRadius = 6
        
        googleButton.layer.cornerRadius = 6
        facebookButton.layer.cornerRadius = 6
    }
    
}

extension LoginView {
    
    func setupViewModel() {
        self.viewModel = LoginViewModel(
           
        )
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {

    }
}
