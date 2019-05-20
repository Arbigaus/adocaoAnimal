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

//    @IBOutlet weak var loggoutButton: UIButton!
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        if self.isMovingFromParent {
//            self.delegate?.handle(.showFeed)
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(title: "< Voltar", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.back(sender:)))
        self.navigationItem.leftBarButtonItem = backButton
        
        let loggoutButton = UIBarButtonItem(title: "Sair", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.loggout(sender:)))
        self.navigationItem.rightBarButtonItem = loggoutButton
        self.configureViews()
        self.setupViewModel()
        self.setupBindings()
    }
    
    @objc func back(sender: UIBarButtonItem) {
        self.delegate?.handle(.showFeed)
    }
    
    @objc func loggout(sender: UIBarButtonItem) {
        self.viewModel.loggout()
    }
    
}

extension UserProfileView {
    
    func setupViewModel() {
//        viewModel.setupBindings(loggoutTap: self.loggoutButton.rx.tap.asSignal())
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {
        self.viewModel.loggedUser
            .subscribe(onNext: { user in
                if user == .notLogged {
                    self.delegate?.handle(.showFeed)
                }
            })
            .disposed(by: disposeBag)
    }
}
