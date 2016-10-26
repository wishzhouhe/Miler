//
//  ViewController.swift
//  003闭包的使用
//
//  Created by myzj2004 on 16/10/24.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var completionBlock: (()->())?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let b2 = { (x: Int) -> (Int) in
//            return x + 10
//        }
//        print(b2(10))
//        
//        
//        //OC 解决循环引用的方式
//        weak var weakSelf = self
//
//        loadData {
//            //单方向持有是不会产生循环引用的
//            //只是闭包对self 进行了一次copy   闭包执行结束后会销毁并且释放self
//            print(self.view)
//            
//            //解除循环引用
//            print(weakSelf?.view)
//        }
        
        
        //方法2swift 解决循环引用
        loadData { [weak self] in
            print(self?.view)
        }
        
        //方法三
        loadData { [unowned self] in
            print(self.view)
        }
    }


    
    func loadData(completion:@escaping () -> ()) -> () {
        //循环引用是相互的,你中有我我中有你 谁都不能释放 形成环状引用
        completionBlock = completion
        DispatchQueue.global().async {
            print("耗时操作")
            Thread.sleep(forTimeInterval: 2)
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    deinit {
        print("释放")
    }
}

