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
        
        let observable4 = Observable.from([1, 2, 3, 4, 5])
//        observable4.subscribe { event in
//            if let element = event.element {
//                print(element)
//            }
//        }
//
//        let observable3 = Observable.of([1, 2, 3])
//        observable3.subscribe{ event in
//            if let element = event.element {
//                print(element)
//            }
//        }
        
        observable4.subscribe(onNext: { element in
            print(element)
        })

    }


}

