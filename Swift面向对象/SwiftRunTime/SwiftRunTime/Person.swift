//
//  Person.swift
//  SwiftRunTime
//
//  Created by myzj2004 on 16/10/26.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var name: String?
    var age: Int = 0
    var title: String?
    
    
    class func propertyList() -> [String] {
        var count: UInt32 = 0
        
        //返回当前类的属性列表数组 RUNTIME 可选项
        let list = class_copyPropertyList(self, &count)
        print("属性的数量\(count)")
        
        //遍历属性列表数组
//        for i in 0..<Int(count) {
//            let pty = list?[i]
//            
//            //获取'属性'的名称 c 语言字符串
//            //Int8 -> Byte -> char => C语言字符串
//            let cname = property_getName(pty!)
//            print(cname)
//            
//            //转换oc的字符串  string
//            
//            let name = String(utf8String: cname!)
//        }

        
        for i in 0..<Int(count) {
            guard let pty = list?[i],
                let cname = property_getName(pty),
            let name = String(utf8String: cname) else {
                continue
            }
            
            print(name)
            
            
        }

        free(list)
        
        return []
    }
    
    
}
