//
//  LoadingView.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 13/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//
import Foundation
import UIKit
import Lottie

class LoadingView: UIView {
    private var didSetupViews: Bool = false
    
    var lottieView = AnimationView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupViews()
        self.accessibilityIdentifier = "loading_view"
    }
    
    func show() {
        UIView.animate(withDuration: 0.2) {
            self.alpha = 1.0
        }
        lottieView.play()
    }
    
    func hide() {
        UIView.animate(withDuration: 0.2) {
            self.alpha = 0.0
        }
        lottieView.stop()
    }
    
    private func setupViews() {
        if !didSetupViews {
            self.didSetupViews = true
            self.setupConstraints()
        }
    }
    
    private func setupConstraints() {
        
        self.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        let loading = Animation.named("4888-dog-icon")
        
        self.lottieView.loopMode = .loop
        self.lottieView.animation = loading
        self.lottieView.contentMode = .scaleToFill
        
        self.addSubview(lottieView)
    
        
    }
}
