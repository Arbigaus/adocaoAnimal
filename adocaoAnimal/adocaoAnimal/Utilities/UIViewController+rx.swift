//
//  UIViewController+rx.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 18/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import UIKit
import RxSwift

extension UIViewController {
    
    func alert(title: String, text: String?) -> Completable {
        return Completable.create { [weak self] completable in
            let alertVC = UIAlertController(title: title, message: text, preferredStyle: .alert)
            
            alertVC.addAction(UIAlertAction(title: "Close", style: .default, handler: { _ in
                completable(.completed)
            }))
            
            self?.present(alertVC, animated: true, completion: nil)
            return Disposables.create()
        }
    }
}
