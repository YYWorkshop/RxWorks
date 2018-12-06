//
//  ViewController.swift
//  Concat
//
//  Created by Chris on 2018/12/6.
//  Copyright © 2018 Chris. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.doConcatExample1()
        
//        self.doConcatExample2()
        
//        self.doConcatExample3()
        
        let concatOperator = ConcatOperator()
        
        concatOperator.getEmployeeData()        
    }

}

extension ViewController {
    
    func doConcatExample2() {
        
        let pb1 = Observable.of(1, 2, 3)
        let pb2 = Observable.of(4, 5, 6)
        
        pb1.concat(pb2)
            .subscribe { event in
                switch event {
                case .next(let element):
                    print("element:", element)
                case .error(let error):
                    print("error:", error)
                case .completed:
                    print("completed")
                }}
            .disposed(by: DisposeBag())
    }
    
    func doConcatExample1() {
        let obs1 = Observable<String>.create { observer in
            observer.onNext("a")
            observer.onNext("b")
            observer.onNext("c")
            
            observer.onCompleted()
            
            return Disposables.create()
        }
        
        let obs2 = Observable<String>.create { observer in
            observer.onNext("a'")
            observer.onNext("b'")
            observer.onNext("c'")
            
            observer.onCompleted()
            
            return Disposables.create()
        }
        
        let _ = obs1.concat(obs2).subscribe {
            print($0)
        }
    }
    
    func doConcatExample3() {
        let disposeBag = DisposeBag()
        
        let subject1 = BehaviorSubject(value: "🍎")
        let subject2 = BehaviorSubject(value: "🐶")
        
        let variable = Variable(subject1)
        
        variable.asObservable()
            .concat()
            .subscribe { print($0) }
            .disposed(by: disposeBag)
        
        subject1.onCompleted()
        
        subject1.onNext("🍐")
        
        subject1.onNext("🍊")
        
        variable.value = subject2.asObserver()
        
        subject2.onNext("I would be ignored1")
        
        subject2.onNext("I would be ignored2")
        
        subject2.onNext("🐱")
        
        subject2.onNext("🐭")
    }
}
