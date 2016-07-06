//
//  DemoVC4.m
//  CoreAnimationDemo
//
//  Created by myzj2004 on 16/6/16.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

#import "DemoVC4.h"

@interface DemoVC4 ()

@end

@implementation DemoVC4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(175, 100)];
    
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:360 clockwise:YES];
    
    [path moveToPoint:CGPointMake(150, 125)];
    
    [path addLineToPoint:CGPointMake(150, 175)];
    
    [path addLineToPoint:CGPointMake(125, 225)];
    
    [path moveToPoint:CGPointMake(150, 175)];
    
    [path addLineToPoint:CGPointMake(175, 225)];
    
    [path moveToPoint:CGPointMake(100, 150)];
    
    [path addLineToPoint:CGPointMake(200, 150)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    shapeLayer.lineWidth = 4;
    
    shapeLayer.lineJoin = kCALineCapRound;
    
    shapeLayer.lineCap = kCALineCapRound;
    
    shapeLayer.path = path.CGPath;
    
    [self.view.layer addSublayer:shapeLayer];
    
    CGRect rect = CGRectMake(0, 300, 100, 100);
    
    CGSize radii = CGSizeMake(20, 20);
    
    UIRectCorner corners = UIRectCornerAllCorners;
    
    UIBezierPath *patch = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    
    CAShapeLayer *subShapeLayer = [CAShapeLayer layer];
    
    subShapeLayer.strokeColor = [UIColor grayColor].CGColor;
    
    subShapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    subShapeLayer.lineWidth = 4;
    
    subShapeLayer.lineJoin = kCALineCapRound;
    
    subShapeLayer.lineCap = kCALineCapRound;
    
    subShapeLayer.path = patch.CGPath;
    
    
    [self.view.layer addSublayer:subShapeLayer];
    
}


@end
