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
    
    var lottieView: LOTAnimationView?
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupViews()
        self.accessibilityIdentifier = "loading_view"
    }
    
    func show() {
        UIView.animate(withDuration: 0.2) {
            self.alpha = 1.0
        }
        lottieView?.play()
    }
    
    func hide() {
        UIView.animate(withDuration: 0.2) {
            self.alpha = 0.0
        }
        lottieView?.stop()
    }
    
    private func setupViews() {
        if !didSetupViews {
            self.didSetupViews = true
            self.setupConstraints()
        }
    }
    
    private func setupConstraints() {
        self.lottieView = LOTAnimationView(name: "4888-dog-icon")
        self.addSubview(lottieView!)
        
        lottieView?.alpha = 1
        lottieView?.constraintWidth(400.0)
        lottieView?.constraintHeight(400.0)
        lottieView?.prepareForConstraints()
        lottieView?.centerHorizontally()
        lottieView?.centerVertically()
        lottieView?.loopAnimation = true
        
        self.backgroundColor = UIColor.white.withAlphaComponent(1)
    }
    
    
}
