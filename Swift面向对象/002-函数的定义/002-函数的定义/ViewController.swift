//
//  ViewController.swift
//  002-函数的定义
//
//  Created by myzj2004 on 16/10/24.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //swift3.0调用方式
        //swift2.2: sum(10,y:10)第一个形参会省略
        //swift1.0 sum(1,1)
       let sun = sum(x: 1, y: 1)
        print(sun)
        
        //闭包
        //函数就是一个闭包
        
        //定义一个常量记录函数
        let f = sum1
        let i = 10
        
        //在需要的时候执行
        print(f(20,1))
        
        
        
        //没有参数没有返回值的参数
        let b1 = {
            print("hhaahhah")
        }
        //执行闭包
        b1()
        
        //2.带参数的闭包
        //闭包中,参数,返回值,实现代码都写在 {} 中
        // {形参列表 -> 返回类型 //实现代码}
        
        let b2 = { (x:Int)-> Int in
            return 123 + x
        }
       print(b2(123))
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        //外部参数
        
//        print(sum1(num1: 1, num2: 22))
       print(sum1(1, 1))
        
        for2()
        
        //方法默认值
        print(sum3())
        print(sum3(x: 11, y: 11))
        //当x没有值得时候 取x得默认值计算
        print(sum3(y: 7))
    }
    
    func sum3(x: Int = 1, y: Int = 3) -> Int {
        return x + y
    }
    
    func for2() {
        for _ in 0...10 {
            print("hello word")
        }
    }
    
    func sum1(_ x: Int ,_ y: Int) -> Int {
       return x + y
    }
    
    func sum(x: Int,y: Int) -> Int {
        return x + y
    }
}

