//
//  ViewController.swift
//  StwiftTableView
//
//  Created by myzj2004 on 16/7/27.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    lazy var tableView : UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
}

// MARK: - <#注释>

//MARK: - setUpUI
extension ViewController {
    
    ///设置数据
    func setUpUI() {
        view.addSubview(tableView)
        
        tableView.frame = view.frame
        
        tableView.dataSource = self
        
        tableView.delegate = self
    }
}



//MARK: - UITableViewDataSource Methods
extension ViewController : UITableViewDataSource , UITableViewDelegate {
    //MARK - UITableViewDataSource Moethods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellID = "Cellid"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellID)
        }
        
        cell?.textLabel?.text = "测试数据:\(indexPath.row)"
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("点击了第\(indexPath.row)行")
    }
    
}
