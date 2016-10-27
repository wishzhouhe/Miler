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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if person != nil {
            textName.text = person?.name
            textPhone.text = person?.phone
            textTitle.text = person?.title
        }
    }

    
    @IBAction func savePerson(_ sender: AnyObject) {
        
    }
    

}
