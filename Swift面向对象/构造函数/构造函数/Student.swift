//
//  Student.swift
//  构造函数
//
//  Created by myzj2004 on 16/10/26.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

import UIKit

class Student: Person {
    var no: String
    
    override init() {
        print("Student");
        no = "123"
        super.init()
    }

}
