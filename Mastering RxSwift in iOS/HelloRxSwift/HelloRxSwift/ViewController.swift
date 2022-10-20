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
        
        let subject = PublishSubject<String>()
        
        subject.onNext("Issue 1")
        
        subject.subscribe{ event in
            print(event)
        }
        
        subject.onNext("Issue 2")
        subject.onNext("Issue 3")
        
        subject.dispose()
        subject.onCompleted()
        
        subject.onNext("Issue 4")
    }
}

