//
//  Person.swift
//  KVC构造函数
//
//  Created by myzj2004 on 16/10/26.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String?

    //使用KVC为对象赋值的时候其实是发生在运行时,运行是的时候self 没用完全被初始化导致setValuesForKeys不能使用要super.init()后再调用
    init(dict: [String:AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
}
