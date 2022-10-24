//
//  ViewController.swift
//  HelloRxSwift
//
//  Created by Jason on 2022/10/16.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let disposeBag = DisposeBag()
        
        let relay = BehaviorRelay(value: ["Item 1"])
        
        var value = relay.value
        value.append("Item 2")
        value.append("Item 3")
        relay.accept(value)
        
        relay.asObservable().subscribe {
            print ($0)
        }
    }
}

