//
//  petView.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 04/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol petViewDelegate: class {
    
}

class petView: UIViewController {
    
    var viewModel: petViewModel!
    
    weak var delegate: petViewDelegate?

    init() {
        super.init(nibName: String(describing: petView.self), bundle: nil)
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

extension petView {
    
    func setupViewModel() {
        self.viewModel = petViewModel(
           
        )
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {

    }
}
