//
//  ViewController.swift
//  便利构造器
//
//  Created by myzj2004 on 16/10/27.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let p = Person(name: "zhouhe", age: 55);
        print(p?.name)
    }



}

