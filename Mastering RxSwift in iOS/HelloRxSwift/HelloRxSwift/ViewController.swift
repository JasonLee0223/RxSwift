//
//  ViewController.swift
//  HelloRxSwift
//
//  Created by Jason on 2022/10/16.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let disposeBag = DisposeBag()
        
        Observable.of("A", "B", "C")
            .subscribe {
                print($0)
            }.disposed(by: disposeBag)
        
        Observable<String>.create{ observer in
            observer.onNext("A")
            observer.onCompleted()
            observer.onNext("?")
            return Disposables.create()
        }.subscribe(onNext: { print($0) }, onError: { print($0) },
                    onCompleted: { print("Completed") },
                    onDisposed: { print("Disposed") } )
        .disposed(by: disposeBag)
        
    }
}

