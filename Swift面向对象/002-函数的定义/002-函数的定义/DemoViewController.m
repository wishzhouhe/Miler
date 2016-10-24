//
//  DemoViewController.m
//  002-函数的定义
//
//  Created by myzj2004 on 16/10/24.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    void (^block)(NSString *str) = ^(NSString *str1){
        NSLog(@"123%@",str1);
    };
    
    block(@"hahah");
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
