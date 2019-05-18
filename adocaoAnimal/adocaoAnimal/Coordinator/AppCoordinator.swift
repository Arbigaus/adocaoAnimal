//
//  AppCoordinator.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 04/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

enum AppAction {
    case back
    case showFeed
    case showLogin
    case showLoginEmail
    case showUserProfile
    case showCreatePetView
    case showCreateAccount
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
        showFeed()
//        showCreatePetView()
        
    }
    
    fileprivate func showFeed(){
        let homeView = FeedView()
        homeView.delegate = self
        homeView.title = "HOME"
        
        homeView.tabBarItem = setupTabBarItem(
                title: "HOME",
                image: R.image.chatIcon()!,
                position: 1
        )
        
        let homeNavigation = UINavigationController(rootViewController: homeView)
        
        let addPet = CreatePetView()
        addPet.title = "Adicionar um Pet"
        
        addPet.tabBarItem = setupTabBarItem(
            title: "HOME",
            image: R.image.chatIcon()!,
            position: 2
        )
        
        let addPetNavigation = UINavigationController(rootViewController: addPet)
        
        let tabBar = TabBarView(viewControllers: [homeNavigation, addPetNavigation])
        
        self.currentView = tabBar
        
    }
    
    fileprivate func showLogin() {
        let view = LoginView()
        self.navigationController.pushViewController(view, animated: true)
        view.delegate = self
        self.currentView = navigationController
    }
    
    fileprivate func showUserProfile() {
        let view = UserProfileView()
        self.navigationController.pushViewController(view, animated: true)
        view.delegate = self
        self.currentView = navigationController
    }
    
    fileprivate func showPetDetail(_ pet : Pet){
        let view = PetDetailsView(pet: pet)
        view.delegate = self
        self.navigationController.pushViewController(view, animated: true)
        self.currentView = navigationController
    }
    
    fileprivate func showCreatePetView() {
        let view = CreatePetView()
        view.delegate = self
        self.navigationController.pushViewController(view, animated: true)
        self.currentView = navigationController
    }
    
    fileprivate func showLoginEmail() {
        let view = LoginEmailView()
        self.navigationController.pushViewController(view, animated: true)
        view.delegate = self
        self.currentView = navigationController
    }
    
    fileprivate func showCreateAccount() {
        let view = CreateAccountView()
        self.navigationController.pushViewController(view, animated: true)
        view.delegate = self
        self.currentView = navigationController
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
        
        case .showUserProfile :
            showUserProfile()
            
        case .showPetDetails(let pet) :
            showPetDetail(pet)
            
        case .showCreatePetView :
            showCreatePetView()
            
        case .showLogin :
            showLogin()
            
        case .showLoginEmail :
            showLoginEmail()
            
        case .showCreateAccount :
            showCreateAccount()
            
        }       
    }
    
    /// Configures a UITabBarItem to be attributed to a UIViewController.
    ///
    /// - Parameters:
    ///   - title: The title shown in the tab under the icon.
    ///   - image: The image shown in the tab.
    ///   - position: The position of the item in the tab bar. It starts at 1.
    /// - Returns: A UITabBarItem
    func setupTabBarItem(title: String, image: UIImage, position: Int) -> UITabBarItem {
        let tabBarItem = UITabBarItem(title: title, image: image, tag: position - 1)
        
        return tabBarItem
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
