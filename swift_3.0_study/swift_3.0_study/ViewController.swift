//
//  ViewController.swift
//  swift_3.0_study
//
//  Created by myzj2004 on 16/10/13.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //创建试图
        let v = UIView(frame: CGRect(x: 0, y: 20, width: 100, height: 100))
        v.backgroundColor = UIColor.red
        
        view.addSubview(v)
        
        let btn = UIButton(type: .contactAdd)
        v.addSubview(btn)
        
        btn.addTarget(self, action: #selector(clickme), for: .touchUpInside)
        
        
        
        //----------
        
        let vv = UIView(frame: CGRect(x: 0, y: 30, width: 100, height: 100))
        vv.backgroundColor = #colorLiteral(red: 1, green: 0.9568627451, blue: 1, alpha: 1)
        
        view.addSubview(vv)
        //--------------
        
        let img = UIImageView(image: <#T##UIImage?#>)
        
    }
    
    func clickme() -> () {
        print(#function)
        print("打印我")
    }


}

