//
//  UserProfileView.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 09/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol UserProfileViewDelegate: class {
    
}

class UserProfileView: UIViewController {
    
    var viewModel: UserProfileViewModel!
    fileprivate let disposeBag = DisposeBag()
    
    weak var delegate: AppActionable?

    @IBOutlet weak var loggoutButton: UIButton!
    init() {
        self.viewModel = UserProfileViewModel()
        super.init(nibName: String(describing: UserProfileView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
        self.setupViewModel()
        self.setupBindings()
    }
    
}

extension UserProfileView {
    
    func setupViewModel() {
        viewModel.setupBindings(loggoutTap: self.loggoutButton.rx.tap.asSignal())
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {
        self.viewModel.loggedUser
            .asObservable()
            .subscribe(onNext: { user in
                if user == .logged {
                    self.delegate?.handle(.showFeed)
                }
            })
            .disposed(by: disposeBag)
    }
}
