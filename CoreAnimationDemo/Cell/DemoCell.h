//
//  DemoCell.h
//  CoreAnimationDemo
//
//  Created by myzj2004 on 16/6/12.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const identifier = @"DemoCell";

@interface DemoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *descriptionTitle;

@end
