//
//  MilerFPSStatus.m
//  FPSTest
//
//  Created by myzj2004 on 16/6/7.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

#import "MilerFPSStatus.h"

@interface MilerFPSStatus () {
    @private
    CADisplayLink *_displayLink;
    NSUInteger   count;
    NSTimeInterval  laseTime;
}
@end

@implementation MilerFPSStatus
@synthesize FpsLabel;


+ (MilerFPSStatus *)shareInstance {
    static dispatch_once_t onceToken;
    static MilerFPSStatus * sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MilerFPSStatus alloc]init];
    });
    return sharedInstance;
}

#pragma mark init

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidBecomeActiveNotification)
                                                     name:UIApplicationDidBecomeActiveNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationWillResignActiveNotification)
                                                     name:UIApplicationWillResignActiveNotification
                                                   object:nil];
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displaylinkTick:)];
        [_displayLink setPaused:YES];
        [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        
        //fpsLabel
        FpsLabel = [[UILabel alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 50)/2+50, 0, 50, 20)];
        FpsLabel.font = [UIFont boldSystemFontOfSize:12];
        FpsLabel.textColor = [UIColor colorWithRed:0.33 green:0.84 blue:0.43 alpha:1.00];
        FpsLabel.backgroundColor = [UIColor clearColor];
        FpsLabel.textAlignment = NSTextAlignmentCenter;
        FpsLabel.tag = 101;
        
    }
    return self;
}

#pragma mark private
- (void)applicationDidBecomeActiveNotification {
    [_displayLink setPaused:NO];
}

- (void)applicationWillResignActiveNotification {
    [_displayLink setPaused:YES];
}

- (void) displaylinkTick:(CADisplayLink *)displayLink {
    if (laseTime == 0) {
        laseTime = displayLink.timestamp;
        return;
    }
    count++;
    NSTimeInterval interval = displayLink.timestamp - laseTime;
    if (interval < 1) return;
    laseTime = displayLink.timestamp;
    float fps = count / interval;
    count = 0;
    
    NSString *fpstext = [NSString stringWithFormat:@"%@ FPS",@((int)round(fps))];
    FpsLabel.text = fpstext;
}

- (void)open {
    NSArray *rootVCViewSubViews = [[UIApplication sharedApplication].delegate window].rootViewController.view.subviews;
    for (UIView *subViews in rootVCViewSubViews) {
        if ([subViews isKindOfClass:[UILabel class]] && subViews.tag == 101) {
            return;
        }
    }
    [[((NSObject <UIApplicationDelegate> *)([UIApplication sharedApplication].delegate)) window].rootViewController.view addSubview:FpsLabel];
}

- (void)close {
    NSArray *rootVCViesSubViews = [[UIApplication sharedApplication].delegate window].rootViewController.view.subviews;
    for (UIView *subView in rootVCViesSubViews) {
        if ([subView isKindOfClass:[UILabel class]] && subView.tag == 101) {
            [subView removeFromSuperview];
            return;
        }
    }
}

@end
