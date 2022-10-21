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
        
        let subject = ReplaySubject<String>.create(bufferSize: 2)
        
        subject.onNext("Issue 1")
        subject.onNext("Issue 2")
        subject.onNext("Issue 3")
        
        subject.subscribe{
            print($0)
        }
        
        subject.onNext("Issue 4")
        subject.onNext("Issue 5")
        subject.onNext("Issue 6")
        
        print("[Subscription 2]")
        subject.subscribe{
            print($0)
        }
    }
}

