//
//  ViewController.swift
//  懒加载
//
//  Created by myzj2004 on 16/10/31.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //懒加载 简单实现
//    lazy var label: DemoLabel = DemoLabel()
    //懒加载本质上是一个闭包  供参考
    //完整写法
    lazy var label = {()->DemoLabel in
        let l = DemoLabel()
        return l
    }()
    
    
    override func viewDidLoad() {
        print("初始化viewController")
        super.viewDidLoad()
        label.text = "asdf"
        view.addSubview(label)
        label.center = view.center
        label.sizeToFit()
    }

}

