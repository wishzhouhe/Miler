//
//  Person.swift
//  便利构造器
//
//  Created by myzj2004 on 16/10/27.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var name: String?
    var age: Int = 0
    //只有便利构造器才会调用self.init 构造当前对象
    //
    convenience init?(name: String,age: Int) {
        if age > 100 {
            return nil
        }
        //给属性初始化之前,使用self 访问name 之前 应该调用self.init
        //实例化当前对象 在去对属性赋值
        self.init()
        //执行到此self才允许被访问到.
        self.name = name
    }
}
