//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//数组


func demo1 () {
    let array = ["张三","小芳","小呵呵"];
    print(array)
    
    let array2 = ["asdf",12,"asdf"] as [Any]
    
    print(array2)
    
    let p = CGPoint(x: 100, y: 100)
    
    let arrayp = [p]
    
    print(arrayp)
    
    let pp = CGPoint(x: 100, y: 100)
    
    
    
    let anyArray = ["123",123,NSValue(cgPoint: pp)] as [Any]
    print(anyArray)
}

//下表便利
func demo2 () {
    let array = ["张三","小芳","小呵呵"];
    for i in 0..<array.count {
        print(array[i])
    }
    print("--遍历元素")
    //for in 遍历
    for s in array {
        print(s)
    }
    //元组
    for s in array.enumerated() {
        print(s)
    }
    print("-------")
    for (n,c) in array.enumerated() {
        print("\(n),\(c)")
        
    }
    print("-----反序遍历")
    for s in array.reversed() {
        print(s)
    }
    
    print("-----反序遍历&索引和内容")
    
    for s in array.enumerated().reversed() {
        print(s)
    }
    
}

//demo2()
//-----------------------------------

// MARK: - 数组的增删改查

func arrayDemo() {
    var array = ["laowang","laoli","laochen"]
    array.append("laozhou")
    
    array[0] = "小王"
    
    print(array)
    
    var arra = [Int]()
    arra.append(11)
    arra.append(234)
    
//    arra.remove(at: 1)
    //删除内容 并且保留空间大小
    arra.removeAll(keepingCapacity: true)
    
    arra.capacity
    
    var arrag = [Int]()
    
    for i in 0...9 {
        arrag.append(i)
        print("\(arrag) 容量 \(arrag.capacity)")
    }
    
    
    //合并数组
    
    //要合并数组 两个类型一定要一致
    var arraay = ["laowang","laoli","laochen"]
    
    let array1 = ["asdfaf","asdfadf","asdfasdf"]
    
    arraay+=array1
    
}

func dictDemo() {
    //1.0定义
    
    var dict = ["name":"张","age":17] as [String : Any]
    dict
    
    let array: [[String : Any]] = [
        ["name":"张","age":23],
        ["name":"张","age":157],
        ["name":"张","age":44]
    ]
    
    array
    
    //2.0遍历
    
    for o in dict {
        print(o)
    }
    
    //3.0增删
    
    //增
    dict["title"] = "zhouhe"

    //改
    dict["name"] = "大西瓜"
    
    
    
    //哈希  hash 就是将字符串变成唯一的证书 便于查找提高字典遍历的速度
    dict.removeValue(forKey: "age")
    
    print(dict)
    
    
    
    //4.0合并
}

dictDemo()

//arrayDemo()

//demo1()
