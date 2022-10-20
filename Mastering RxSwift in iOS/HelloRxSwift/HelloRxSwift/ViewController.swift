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
        
        let subject = BehaviorSubject(value: "Initial Value")
        subject.onNext("Last Issue")
        
        subject.subscribe{ event in
            print(event)
        }
        
        subject.onNext("Issue 1")
    }
}

