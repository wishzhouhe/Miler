//
//  DemoVC6.m
//  CoreAnimationDemo
//
//  Created by myzj2004 on 16/6/17.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

#import "DemoVC6.h"

@interface DemoVC6 ()

@property (weak, nonatomic) IBOutlet UIView *TransformLayer;

@end

@implementation DemoVC6

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

#pragma mark - CATransformLayer

- (CALayer *)faceWithTransfrom:(CATransform3D)transfrom {
    //创建layer
    CALayer *face = [CALayer layer];
    face.frame = CGRectMake(-50, -50, 100, 100);
    
    
    //设置颜色
    CGFloat red = (rand()/(double)INT_MAX);
    
    CGFloat green = (rand() / (double)INT_MAX);
    
    CGFloat blue = (rand() / (double)INT_MAX);
    
    face.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:0.5].CGColor;

    face.transform = transfrom;
    
    return face;
    
}

- (CALayer *)cubeWithTransfrom:(CATransform3D)transfrom {
    CATransformLayer *cube = [CATransformLayer layer];
    
    //add cube face 1
    CATransform3D ct = CATransform3DMakeTranslation(0, 0, 50);
    
    [cube addSublayer:[self faceWithTransfrom:ct]];
    

}

- (void)createTransformLayer {
    
}



@end
