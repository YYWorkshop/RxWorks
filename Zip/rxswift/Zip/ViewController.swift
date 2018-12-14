//
//  ViewController.swift
//  Zip
//
//  Created by Chris on 2018/12/14.
//  Copyright © 2018 Chris. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        doExample1()
        
//        doExample2()
        
//        doExample3()
        
//        doExample4()
        
//        doExample5()
        
        doExample6()
    }

}

extension ViewController {
    
    func doExample1() {
        let disposeBag = DisposeBag()
        let first = PublishSubject<String>()
        let second = PublishSubject<String>()
        
        Observable.zip(first, second) { $0 + $1 }
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
        first.onNext("1")
        second.onNext("A")
        
        first.onNext("2")
        second.onNext("B")
        
        second.onNext("C")
        second.onNext("D")
        
        first.onNext("3")
        first.onNext("4")
    }
    
    func doExample2() {
        let disposeBag = DisposeBag()
        let first = PublishSubject<String>()
        let second = PublishSubject<String>()
        
        Observable.zip(first, second) { $0 + $1 }
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
        second.onNext("A")
        second.onNext("B")
        second.onNext("C")
        second.onNext("D")
        
        first.onNext("1")
        first.onNext("2")
        first.onNext("3")
        first.onNext("4")
    }
    
    func doExample3() {
        let disposeBag = DisposeBag()
        let first = PublishSubject<String>()
        let second = PublishSubject<String>()
        
        Observable.zip(first, second) { $0 + $1 }
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
        second.onNext("C")
        second.onNext("D")
        
        first.onNext("1")
        first.onNext("2")
        first.onNext("3")
        first.onNext("4")
    }
    
    func doExample4() {
        let disposeBag = DisposeBag()
        
        let range = Observable.range(start: 0, count: 5);
        
        Observable.zip(range, range, range) {
            "\($0):\($1):\($2)"
            }
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
    
    func doExample5() {
        let disposeBag = DisposeBag()
        
        let range = Observable.range(start: 0, count: 5);
        
        Observable.zip(range, range.skip(3), range.skip(3)) {
            "\($0):\($1):\($2)"
            }
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
    
    func doExample6() {
        let disposeBag = DisposeBag()
        
        let range = Observable.range(start: 0, count: 5);
        
        Observable.zip(range, range.skip(1), range.skip(2)) {
                "\($0):\($1):\($2)"
            }
            .subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
    }
}
