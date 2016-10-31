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
    
    
    private func loadData(completion:@escaping ([Person])->()){
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
    // MARK: - UITableViewDataSource 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = personList[indexPath.row].name
        cell.detailTextLabel?.text = personList[indexPath.row].phone
        return cell
    }
    // MARK: - 控制器跳转方法
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //类型转换//as ! / as? 根绝前面的返回值来决定的
        let vc = segue.destination as! DetailViewController
        
        //这只选中的person indePatch
        if let IndexPath = sender as? IndexPath {
            vc.person = personList[IndexPath.row]
            vc.completion = {
                self.tableView.reloadRows(at: [IndexPath], with: .automatic)
            }
        } else {
            //新建
            vc.completion = {
                //1 获取明细控制器的person
                guard let p = vc.person else {
                    return
                }
                //2 插入到数组的顶部
                self.personList.insert(p, at: 0)
                //3 刷新表
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - UITabelViewDelegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //实现segue
        performSegue(withIdentifier: "ListTwo", sender: indexPath)
    }
    
    @IBAction func addPerson(_ sender: AnyObject) {
        //执行segue 跳转界面
        performSegue(withIdentifier: "ListTwo", sender: nil)
    }
    
    
    

}
