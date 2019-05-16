//
//  TabBarView.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 15/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit

protocol TabBarDelegate: class { }

class TabBarView: UITabBarController {
    
    weak var navigationDelegate: TabBarDelegate?
    
    init(viewControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = viewControllers
        self.view.accessibilityLabel = "tab_bar_view"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBar.tintColor = UIColor(hexString: "0D0D0D")
        //self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override var childForStatusBarStyle: UIViewController? {
        return self.selectedViewController
    }
}
