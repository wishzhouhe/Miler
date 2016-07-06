//
//  DemoVC5.m
//  CoreAnimationDemo
//
//  Created by myzj2004 on 16/6/16.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

#import "DemoVC5.h"
#import <CoreText/CoreText.h>

@interface DemoVC5 ()


@property (weak, nonatomic) IBOutlet UIView *labelView;


@end

@implementation DemoVC5

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = self.labelView.bounds;
    [self.labelView.layer addSublayer:textLayer];
    
    
    //设置文字属性
    textLayer.foregroundColor = [UIColor blackColor].CGColor;

    textLayer.alignmentMode = kCAAlignmentJustified;
    
    textLayer.wrapped = YES;
    
    UIFont *font = [UIFont systemFontOfSize:15];
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    NSString *text = @"昏暗的灯光下,你看起来那样的迷人,我的心已经无法平静,让我一次喝个够";
    textLayer.string = text;
    
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    
    CATextLayer  *tLayer = [CATextLayer layer];
    tLayer.frame = self.labelView.bounds;
    tLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.labelView.layer addSublayer:textLayer];

    textLayer.contentsScale = [UIScreen mainScreen].scale;
    textLayer.wrapped = YES;
    
    UIFont *tfont = [UIFont systemFontOfSize:14];
    
    NSString *ttext = @"Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consecteturLorem ipsum dolor sit amet, consectetur";
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:ttext];
    
    CFStringRef tfontName = (__bridge CFStringRef)font.fontName;
    CGFloat fontsize = tfont.pointSize;
    CTFontRef tfontRef = CTFontCreateWithName(tfontName, fontsize, NULL);
    
    NSDictionary *attribs = @{
                              
                              (__bridge id)kCTForegroundColorAttributeName:(__bridge id)[UIColor redColor].CGColor,
                              
                              (__bridge id)kCTFontAttributeName: (__bridge id)fontRef
                              };
    
    [string setAttributes:attribs range:NSMakeRange(0, [ttext length])];
    
    attribs = @{
                
                (__bridge id)kCTForegroundColorAttributeName:(__bridge id)[UIColor grayColor].CGColor,
                (__bridge id)kCTFontAttributeName: (__bridge id)fontRef
                
                
                };
    
    [string setAttributes:attribs range:NSMakeRange(6, 5)];
    CFRelease(fontRef);
    tLayer.string = string;

    
    
}

@end
