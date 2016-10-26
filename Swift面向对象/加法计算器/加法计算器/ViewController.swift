//
//  ViewController.swift
//  加法计算器
//
//  Created by myzj2004 on 16/10/26.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var text1: UITextField!
    
    @IBOutlet weak var text2: UITextField!
    
    @IBOutlet weak var text3: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func clas(_ sender: UIButton) {
        print(#function)
        print("\(text1.text)~~~~\(text2.text)")
       guard let num1 = Int(text1.text ?? ""),
        let num2 = Int(text2.text ?? "") else {
            print("不包含数字")
            return
        }
        print("\(num1,num2)")
        text3.text = "\(num1+num2)"
    }
}

