//
//  ExpenseDetailsViewModel.swift
//  wallEEt
//
//  Created by ParaBellum on 10/1/17.
//  Copyright © 2017 ParaBellum. All rights reserved.
//

import Foundation
import RxSwift

struct ExpenseDetailsViewModel{
    //Input
    let cancel:AnyObserver<Void>
    
    //Output
    let titleText:Observable<String>
    let didCancel:Observable<Void>
    init(accItem:AccountItem){
        let _behSubj = BehaviorSubject<String>(value: "\(accItem.amount)")
        self.titleText = _behSubj.asObservable().map{"\($0)"}
        let _cancel = PublishSubject<Void>()
        self.cancel = _cancel.asObserver()
        self.didCancel = _cancel.asObservable().do(onNext: {print ("1111")})
    }
   

}
