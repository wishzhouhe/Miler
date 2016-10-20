//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func demo (num: Int) {
    switch num {
    case 10:
        print("you")
    default:
        print("一般")
    }
}






func demo1 (str: String) {
    switch str {
    case "9","8":
        print("猜对了")
    case "0":
        break;
    default:
        print("不对")
    }
}


let ai = 0...10

let at = 0..<10



for i in 0..<10 {
    print(i)
}

//--------------

//字符串的遍历

func strDemo() {
    let str = "我要飞的更高"
    for c in str.characters {
        print(c)
    }
    
}

//字符串
func strDemo1() {
    let str = "你好"
    //返回指定编码值得字节数量 汉子是三个字节
    print(str.lengthOfBytes(using: .utf8))
    //返回字符的个数(推荐使用)
    print(str.characters.count)
    
    
    let sStr = str as NSString
    print(sStr.length)
    //使用nsstring
}

//拼接字符串
func strDemo2() {
    let name = "老王"
    let age = 18
    let title: String? = "BOOS"
    let point: CGPoint? = nil
    
    let str = "\(name) \(age) \(title ?? "") \(point ?? CGPoint())"
    
    let h = 8
    let s = 9
    let m = 7
    
    let dataStr = String(format: "%02d:%02d:%02d", h,s,m)
    
    print(dataStr)
    
    print(str)
}
//拼接字符串子串
func strsubDemo() {
    //建议一般使用NSString 作为中转因为swift 取子串的方法一致在优化
    
    let str = "我们一起飞"
    
    let subStr = str as NSString

    let ss = subStr.substring(to: 1)
    let tt = subStr.substring(with: NSMakeRange(2,3))
    
    
    print(tt)
    print(ss)
    
    print(str.startIndex)
    print(str.endIndex)
    
    print(str.substring(from: "我们".endIndex))
    print(str.substring(from: "a".endIndex))
    
    guard let range = str.range(of: "一起") else {
        print("没有找到")
        return
    }
    print(range)
    print(str.substring(with: range))
    
}
print("-------")

strsubDemo()

print("-------")
print("-------")

strDemo2()

print("------")

print("---------")
strDemo1()
print("---------")
strDemo()

demo1(str: "99")

demo(num: 99)
