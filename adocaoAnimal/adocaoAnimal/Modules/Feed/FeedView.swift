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
import Lottie

class FeedView: UIViewController {
    
    var viewModel: FeedViewModel!
    
    weak var delegate: AppActionable?
    
    @IBOutlet var locationAnimationView: AnimationView!
    
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
        
        startAnimationView()
        
    }
    
    func startAnimationView() {
        
        let locationAnimation = Animation.named("location")
        
        locationAnimationView.loopMode = .loop
        locationAnimationView.animation = locationAnimation
        locationAnimationView.play()
        
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
