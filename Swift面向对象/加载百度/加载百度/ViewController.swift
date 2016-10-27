//
//  ViewController.swift
//  加载百度
//
//  Created by myzj2004 on 16/10/26.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://www.baidu.com")
        
        URLSession.shared.dataTask(with: url!) { (data, _, error) in
            guard let data = data,
            let html = String(data: data, encoding: .utf8) else {
                return;
            }
            print("========="+html)
        }.resume()
    }



}

