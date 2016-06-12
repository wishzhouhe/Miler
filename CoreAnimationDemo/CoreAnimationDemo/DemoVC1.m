//
//  ViewController.m
//  CoreAnimationDemo
//
//  Created by myzj2004 on 16/6/3.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

#import "DemoVC1.h"


@interface DemoVC1 ()

@property (weak, nonatomic) IBOutlet UIView *firstView;

@end

@implementation DemoVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *sublayer = [CALayer layer];
    sublayer.frame = CGRectMake(self.firstView.center.x / 2, self.firstView.center.y / 2, 50, 50);
    sublayer.backgroundColor = [UIColor redColor].CGColor;
//    [self.firstView.layer addSublayer:sublayer];
    
    //contents
    UIImage *image = [UIImage imageNamed:@"bijini"];
//    self.firstView.contentMode = UIViewContentModeScaleAspectFill;//view填充模式
    
    self.firstView.layer.contentsGravity = @"resizeAspectFill";//layer图形填充模式 与View不同的是 layer使用的是字符串代替枚举
    
    self.firstView.layer.contents = (__bridge id)image.CGImage;
    
    self.firstView.layer.contentsScale = 1.0f;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
