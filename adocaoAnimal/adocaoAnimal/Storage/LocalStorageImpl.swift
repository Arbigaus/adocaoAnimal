//
//  LocalStorageImpl.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 03/05/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import Foundation
import RxSwift
import RxSwiftUtilities
import Firebase

struct LocalStorageKeys {
    private init() {}
    
    static let userUuid = "userUuid"
    static let firstAccess = "firstAccess"
}

class LocalStorageImpl: LocalStorage {

    let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
        userDefaults.register(defaults: [LocalStorageKeys.firstAccess: true])
    }
    
    var userUuid: Observable<UserId> {
        return userDefaults.rx
            .observe(Data.self, LocalStorageKeys.userUuid)
            .unwrap()
            .map { self.decodeUserUuid($0) }
            .share()
    }
    
    func decodeUserUuid(_ encoded: Data) -> UserId {
        let decoder = JSONDecoder()
        return try! decoder.decode(UserId.self, from: encoded)
    }
    
    func updateUserUuid(_ profile: UserId) {
        if let encoded = try? JSONEncoder().encode(profile){
            self.userDefaults.set(encoded, forKey: LocalStorageKeys.userUuid)
        }
    }
    
    var firstAccess: Bool {
        get {
            return self.userDefaults.bool(forKey: LocalStorageKeys.firstAccess)
        }
        set {
            self.userDefaults.set(newValue, forKey: LocalStorageKeys.firstAccess)
        }
    }
    
    
}
