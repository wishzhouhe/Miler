//
//  ViewController.swift
//  KVC构造函数
//
//  Created by myzj2004 on 16/10/26.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let p = Person(dict: ["name" : "老张","age" : 22,"title":"boos"])
        let p = Student(dict: ["name" : "老张","age" : 22,"title":"boos","no":"hahahah","xxxx":"sdfd"])
        print(p.name,p.age,p.title,p.no)
    }


}

