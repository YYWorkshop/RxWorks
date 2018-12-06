//
//  ConcatOperator.swift
//  Concat
//
//  Created by Chris on 2018/12/6.
//  Copyright © 2018 Chris. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ConcatOperator  {
    
    var disposeBag : DisposeBag = DisposeBag()
    
    func getEmployeeData() {
        getEmployeeFromCacheAndFallBackToOnline()
            .subscribe(onNext: { (goodReceiptPOList) in
                print(goodReceiptPOList.count)
            }, onError: { error in
                print("error")
            }, onCompleted: {
                print("onCompleted")
            }).disposed(by: disposeBag)
    }
    
    func getEmployeeFromCache() -> Observable<[Employee]> {
        return Observable.create({ (observer) -> Disposable in
            // Getting Data from Local
            let employeeArray = [Employee(name: "A"), Employee(name: "B"), Employee(name: "C")]
            observer.onNext(employeeArray)
            observer.onCompleted()
            return Disposables.create()
        })
    }
    
    func getEmployeeFromOnline() -> Observable<[Employee]> {
        return Observable.create({ (observer) -> Disposable in
            let employeeArray = [Employee(name: "A"), Employee(name: "C"), Employee(name: "E"), Employee(name: "F"), Employee(name: "G")]
            observer.onNext(employeeArray)
            observer.onCompleted()
            return Disposables.create()
        })
    }
    
    func getEmployeeFromCacheAndFallBackToOnline() -> Observable<[Employee]> {
        return Observable.concat(getEmployeeFromCache(),
                                 getEmployeeFromOnline()).single({ (employeeList) -> Bool in
                                    return employeeList.count > 0
                                 }).take(1)
        
//        return Observable.concat(getEmployeeFromCache(),                                 getEmployeeFromOnline().subscribeOn(CurrentThreadScheduler.instance)).single({ (employeeList) -> Bool in
//                return employeeList.count > 0
//            }).take(1)
        
//        return Observable.concat(getEmployeeFromCache(),
//         getEmployeeFromOnline().subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))).single({ (employeeList) -> Bool in
//            return employeeList.count > 0
//        }).take(1)
    }
    
    
}
