//
//  EditProfileView.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 20/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol EditProfileViewDelegate: class {
    
}

class EditProfileView: UIViewController {
    
    var viewModel: EditProfileViewModel!
    
    weak var delegate: AppActionable?

    init() {
        super.init(nibName: String(describing: EditProfileView.self), bundle: nil)
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

extension EditProfileView {
    
    func setupViewModel() {
        self.viewModel = EditProfileViewModel(
           
        )
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {

    }
}
