//
//  CreatePetView.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 15/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol CreatePetViewDelegate: class {
    
}

class CreatePetView: UIViewController {
    
    var viewModel: CreatePetViewModel!
    
    weak var delegate: CreatePetViewDelegate?

    init() {
        super.init(nibName: String(describing: CreatePetView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
        self.setupViewModel()
        self.setupBindings()
    }
    
}

extension CreatePetView {
    
    func setupViewModel() {
        self.viewModel = CreatePetViewModel(
           
        )
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {

    }
}
