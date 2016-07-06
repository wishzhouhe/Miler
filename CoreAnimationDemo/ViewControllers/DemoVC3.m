//
//  DemoVC3.m
//  CoreAnimationDemo
//
//  Created by myzj2004 on 16/6/15.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

#import "DemoVC3.h"

@interface DemoVC3 ()

@property (weak, nonatomic) IBOutlet UIView *uiview;
@property (nonatomic,strong) CALayer *sublayer;

@property (weak, nonatomic) IBOutlet UIView *subViewOne;

@property (weak, nonatomic) IBOutlet UIView *subViewTwo;

@property (weak, nonatomic) IBOutlet UILabel *label;




@end

@implementation DemoVC3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sublayer = [CALayer layer];
    self.sublayer.frame = CGRectMake(50, 50, 100, 100);
    self.sublayer.backgroundColor = [UIColor blueColor].CGColor;
    
    [self.uiview.layer addSublayer:self.sublayer];
    

    self.subViewOne.layer.cornerRadius = 10;
//    self.subViewOne.layer.borderColor = [UIColor blackColor].CGColor;
//    self.subViewOne.layer.borderWidth = 5.f;
    self.subViewOne.layer.shadowOpacity = 0.5f;
    self.subViewOne.layer.shadowOffset = CGSizeMake(0, 5);
    self.subViewOne.layer.shadowRadius = 5;
    self.subViewOne.layer.shadowColor = [UIColor redColor].CGColor;
    self.subViewOne.layer.masksToBounds = YES;
    
    
    
    self.subViewTwo.alpha = 0.5;
    
    self.subViewTwo.layer.cornerRadius = 12;
    self.subViewTwo.layer.masksToBounds = YES;
    
    self.subViewTwo.layer.shouldRasterize = YES;
    
    self.subViewTwo.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    //图形旋转45度
//    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
//    self.sublayer.affineTransform = transform;
    
    //相当于GCD和动画组一样 做一系列的图形处理动作

    
    CGAffineTransform atransform = CGAffineTransformIdentity;
    atransform = CGAffineTransformScale(atransform, 0.5, 0.5);
    atransform = CGAffineTransformRotate(atransform, M_PI_4);
    atransform = CGAffineTransformTranslate(atransform, 200, 0);
    
    
    self.sublayer.affineTransform = atransform;
    
    

    
}

#pragma mark Setter 

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    
    CALayer *layer = [self.uiview.layer hitTest:point];
    
    if (layer == self.sublayer) {
        NSLog(@"sublayer");
    }else if(layer == self.uiview.layer) {
        NSLog(@"uiview layer%s",__func__);
    } else {
        return;
    }
    
    
    
    point = [self.uiview.layer convertPoint:point fromLayer:self.view.layer];
    
    if ([self.uiview.layer containsPoint:point]) {
        point = [self.sublayer convertPoint:point fromLayer:self.uiview.layer];
        if ([self.sublayer containsPoint:point]) {
            NSLog(@"123");
        }else {
            NSLog(@"456");
        }
    }
    
}

@end
