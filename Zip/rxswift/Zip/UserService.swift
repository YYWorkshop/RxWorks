//
//  UserService.swift
//  Zip
//
//  Created by Chris on 2018/12/14.
//  Copyright © 2018 Chris. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class UserService {
    
    var disposeBag : DisposeBag = DisposeBag()
        
    func getUserPhoto() -> Observable<[Photo]> {
        return Observable.create({ (observer) -> Disposable in
            let photoList = [Photo(name: "A"), Photo(name: "B"), Photo(name: "C")]
            observer.onNext(photoList)
            observer.onCompleted()
            return Disposables.create()
        })
    }
    
    func getPhotoMetadata() -> Observable<[Photo]> {
        return Observable.create({ (observer) -> Disposable in
            let metadataList = [Photo(name: "1"), Photo(name: "2"), Photo(name: "3")]
            observer.onNext(metadataList)
            observer.onCompleted()
            return Disposables.create()
        })
    }
    
}
