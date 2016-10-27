//
//  ListTableViewController.swift
//  私人通讯录
//
//  Created by myzj2004 on 16/10/27.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    
    var personList = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData { (Person) in
            print(Person)
            self.personList += Person
            
            self.tableView.reloadData()
        }
    }

    
    /// 模拟异步 ,利用闭包毁掉
    
    
    private func loadData(completion:@escaping ([Person])->()) -> () {
        DispatchQueue.global().async {
            print("加载")
            Thread.sleep(forTimeInterval: 1)
            var arrayM = [Person]()
            
            for i in 0..<20 {
                let p = Person()
                p.name = "zhouhe - \(i)"
                p.phone = "139" + String(format: "%06d", arc4random_uniform(10000000))
                p.title = "shabi"
                arrayM.append(p)
            }
            DispatchQueue.main.async(execute: { 
                completion(arrayM)
            })
        }
    }

}
