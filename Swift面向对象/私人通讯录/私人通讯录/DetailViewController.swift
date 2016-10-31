//
//  DetailViewController.swift
//  私人通讯录
//
//  Created by myzj2004 on 16/10/27.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

    
    var person: Person?
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textPhone: UITextField!
    @IBOutlet weak var textTitle: UITextField!
    
    
    var completion: (()->())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if person != nil {
            textName.text = person?.name
            textPhone.text = person?.phone
            textTitle.text = person?.title
        }
    }

    
    @IBAction func savePerson(_ sender: AnyObject) {
        
        if person == nil {
            person = Person()
        }
        
        //用UI 更新peron内容
        person?.name = textName.text
        person?.phone = textPhone.text
        person?.title = textTitle.text
        
        //执行闭包毁掉
        //oc中执行block前都必须判断是否有值 否则容易崩溃
        //!是xcode提示解决办法
        //?可选解包 如果为空就不执行闭包
        completion?()
        
        //返回上一页
        _ = navigationController?.popViewController(animated: true)
    }
    

}
