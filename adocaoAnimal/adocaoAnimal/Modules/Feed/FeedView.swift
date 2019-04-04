//
//  FeedView.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 03/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol FeedViewDelegate: class {
    
}

class FeedView: UIViewController {
    
    var viewModel: FeedViewModel!
    
    weak var delegate: FeedViewDelegate?

    init() {
        super.init(nibName: String(describing: FeedView.self), bundle: nil)
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

extension FeedView {
    
    func setupViewModel() {
        self.viewModel = FeedViewModel(
           
        )
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {

    }
}
