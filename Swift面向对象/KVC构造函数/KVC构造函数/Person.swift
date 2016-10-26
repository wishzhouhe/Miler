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
    //swift基本数据类型 的属性必须要有默认值
    var age: Int = 0
    //在用KVC属性赋值时,属性一定不能声明称 私有的private修饰的属性对象是不能被外部访问的
    private var title: String?
    

    //使用KVC为对象赋值的时候其实是发生在运行时,运行是的时候self 没用完全被初始化导致setValuesForKeys不能使用要super.init()后再调用
    init(dict: [String:Any]) {
        super.init()
       self.setValuesForKeys(dict)
    }
}
