//
//  Person.swift
//  构造函数
//
//  Created by myzj2004 on 16/10/26.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    //declaration requires an 'override' keyword
   override init() {
    name = "li"
    print("Person")
    super.init()
    
    }
}
