//
//  DemoVC2.m
//  CoreAnimationDemo
//
//  Created by myzj2004 on 16/6/13.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

#import "DemoVC2.h"

@interface DemoVC2 ()

@end

@implementation DemoVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    
    
    CALayer *bulelayer = [CALayer layer];
    bulelayer.frame = CGRectMake(50.f, 50.f, 100.f, 100.f);
    bulelayer.backgroundColor = [UIColor blackColor].CGColor;
    
    
    bulelayer.delegate = self;
    

    
    
    bulelayer.contentsScale = [UIScreen mainScreen].scale;
    
    [self.view.layer addSublayer:bulelayer];
    
    [bulelayer display];
    
    
    
}


- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextSetLineWidth(ctx, 10.f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

- (void)dealloc {
    [self.view.layer removeFromSuperlayer];
}


@end
