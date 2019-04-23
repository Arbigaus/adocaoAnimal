//
//  AppCoordinator.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 04/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import Foundation
import UIKit

enum AppAction {
    case back
    case showFeed
    case showLogin
    case showPetDetails(_ pet: Pet)
    
}

protocol AppActionable: class {
    func handle(_ action: AppAction)
}

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    let window: UIWindow
    var navigationController: CustomNavigation
    // MARK: - Coordinator
    init(window: UIWindow) {
        self.window = window
        self.navigationController = CustomNavigation()
    }
    
    var currentView: UIViewController? {
        get {
            return window.rootViewController
        }
        set {
            UIView.transition(with: self.window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.window.rootViewController = newValue
            }, completion: nil)
        }
    }
    
    func start() {
        showLogin()
        
    }
    
    fileprivate func showFeed(){
        let homeView = FeedView()
        self.navigationController.pushViewController(homeView, animated: false)
        homeView.delegate = self
        self.currentView = navigationController
    }
    
    fileprivate func showLogin() {
        let view = LoginView()
        self.navigationController.setViewControllers([view], animated: true)
        view.delegate = self
        self.currentView = navigationController
        
        
    }
    
    fileprivate func showPetDetail(_ pet : Pet){
        let view = PetDetailsView(pet: pet)
        view.delegate = self
        self.navigationController.pushViewController(view, animated: true)
    }
    
    fileprivate func back() {
        self.navigationController.popViewController(animated: true)
    }
}

extension AppCoordinator: AppActionable {
    
    func handle(_ action: AppAction) {
        
        switch action {
        case .back :
            back()
            
        case .showFeed :
            showFeed()
            
        case .showPetDetails(let pet) :
            showPetDetail(pet)
            
        case .showLogin :
            showLogin()            
        }
        
    }
    
}

class CustomNavigation: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        
    }
    
    override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
    
    func setupViews() {
        self.navigationBar.isHidden = true
    }
}
