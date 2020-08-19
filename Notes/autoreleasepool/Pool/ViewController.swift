//
//  ViewController.swift
//  Pool
//
//  Created by Alexander Ignatev on 18.08.2020.
//  Copyright © 2020 Alexandr Ignatyev. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        experiment0()
        print()
        experiment1()
        print()
        experiment2()
        print()
        experiment3()
        print()
    }

    func experiment0() {
        print("Swift NSObject")
        print("> start", #function)

        for i in 0..<3 {
            let object = Object(id: i)
            print(object)
        }

        print("> end", #function)
    }

    func experiment1() {
        print("Objective-C NSObject")
        print("> start", #function)

        for i in 0..<3 {
            let object = LegacyObject(id: i)
            print(object)
        }

        print("> end", #function)
    }

    func experiment2() {
        print("Objective-C NSObject with autorelease")
        print("> start", #function)

        for i in 0..<3 {
            let object = LegacyObject.create(withID: i)
            print(object)
        }

        print("> end", #function)
    }

    func experiment3() {
        print("Objective-C NSObject autoreleasepool")
        print("> start", #function)

        for i in 0..<3 {
            autoreleasepool {
                let object = LegacyObject.create(withID: i)
                print(object)
            }
        }

        print("> end", #function)
    }
}

