//
//  PetDetailsView.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 04/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol PetDetailsViewDelegate: class {
    
}

class PetDetailsView: UIViewController {
    
    var viewModel: PetDetailsViewModel!
    
    weak var delegate: AppActionable?

    init() {
        super.init(nibName: String(describing: PetDetailsView.self), bundle: nil)
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

extension PetDetailsView {
    
    func setupViewModel() {
        self.viewModel = PetDetailsViewModel(
           
        )
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {

    }
}
