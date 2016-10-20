//
//  ViewController.swift
//  weibo
//
//  Created by myzj2004 on 16/10/18.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        setupUI()

    }
    
    
    //创建tableView
    func setupUI() {
        
        //创建表格
        let tableView = UITableView(frame: view.bounds, style: .plain)
        //添加视图
        view.addSubview(tableView)
        //注册可重用cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        
        //设置代理方法
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
    }
    // MARK: - UITabelViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        //textlabel 是可选的
        cell.textLabel?.text = "1~\(indexPath.row)"
        return cell
    }
    
    
    func demo3(name: String? , age: Int?) {
        let oname: String? = "老王"
        let oage: Int? = 1
        
        
    }
    
    func demo2() {
        
//        let name: String? = "Object-c"
//        let age: Int? = 20
//        guard let name1 = name,let age1 = age else {
//            print("ssssss")
//            return
//        }
//        print(name1 + String(age1))
        
        let oname: String? = "老王"
        let oage: Int? = 1
        
        guard let name = oname ,let age = oage else {
            print("值为空")
            return
        }
        print(name + String(age))
        
    }
    
    
    // MARK: - if let  / var
    func demo1() {
        let oname: String? = nil
        let oage: Int?  = nil
        
        if oname != nil && oage != nil {
            print(oname! + String(oage!))
        }
        
        if let name = oname,
            let age = oage {
            print(name + String(age))
        } else {
            print("名字或者年龄为空")
        }
        
    }
    
    func demo(x: Int? ,y: Int?) -> () {
        print((x ?? 0) + (y ?? 0))
    }
}

