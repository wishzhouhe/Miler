//
//  MilerFPSStatus.h
//  FPSTest
//
//  Created by myzj2004 on 16/6/7.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MilerFPSStatus : NSObject

@property (nonatomic,strong) UILabel *FpsLabel;

/**
 *  创建FPS显示的单例类
 *
 *  @return 返回一个单例类
 */
+ (MilerFPSStatus *) shareInstance;

/**
 *  开启显示
 */
- (void) open;

/**
 *  关闭显示
 */
- (void) close;


@end
