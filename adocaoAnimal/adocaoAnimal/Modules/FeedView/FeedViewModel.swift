//
//  FeedViewModel.swift
//  adocaoAnimal
//
//  Created by Gerson Arbrugaus on 03/04/19.
//  Copyright © 2019 Gerson Arbigaus. All rights reserved.
//

import RxSwift
import RxCocoa

class FeedViewModel {
    
    fileprivate let disposeBag = DisposeBag()
    fileprivate let accountService = AccountServiceImpl()
    
    var userDetails : Observable<Profile>
    
    var loggedUser   = PublishSubject<LoggedUser>()
    
    init() {        
        userDetails = accountService.getLoggedUser()
    }
}
