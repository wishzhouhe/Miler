//
//  TableViewController.m
//  CoreAnimationDemo
//
//  Created by myzj2004 on 16/6/12.
//  Copyright © 2016年 myzj2004. All rights reserved.
//



#import "TableViewController.h"
#import "DemoCell.h"

NSString * const demo1 = @"coreAnimation";
NSString * const demo2 = @"costom Drawing";

@interface TableViewController ()

@property (nonatomic,strong) NSArray *contentArray;


@end


@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.title = @"动画学习";
    self.contentArray = @[demo1,demo2];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return self.contentArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DemoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.title.text = [NSString stringWithFormat:@"DemoVC -- %@",@(indexPath.row + 1)];
    cell.descriptionTitle.text = self.contentArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *demoString = [NSString stringWithFormat:@"DemoVC%@",@(indexPath.row + 1)];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewVC = [storyboard instantiateViewControllerWithIdentifier:demoString];
    [self.navigationController pushViewController:viewVC animated:YES];
}


#pragma mark -- setter

- (NSArray *)contentArray {
    if (!_contentArray) {
        _contentArray = [NSArray array];
    }
    return _contentArray;
}

@end
