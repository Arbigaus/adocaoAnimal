//
//  Rx + Utils.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 03/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//


import Foundation
import RxSwift
import RxCocoa

// https://stackoverflow.com/questions/36709503/rxswift-unwrap-optional-handy-function
extension Observable where Element: OptionalType {
    /// Returns an Observable where the nil values from the original Observable are
    /// skipped
    func unwrap() -> Observable<Element.Wrapped> {
        return self.filter { $0.asOptional != nil }.map { $0.asOptional! }
    }
}

/// Represent an optional value
///
/// This is needed to restrict our Observable extension to Observable that generate
/// .Next events with Optional payload
protocol OptionalType {
    associatedtype Wrapped
    var asOptional:  Wrapped? { get }
}

/// Implementation of the OptionalType protocol by the Optional type
extension Optional: OptionalType {
    var asOptional: Wrapped? { return self }
}

