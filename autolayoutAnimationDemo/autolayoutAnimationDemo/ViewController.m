//
//  ViewController.m
//  autolayoutAnimationDemo
//
//  Created by myzj2004 on 16/10/9.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

#import "ViewController.h"

#define OBSERVERKEY @"contentOffset"            ///<    监听属性
#define MAXMOVE 64.f                                        ///<    滚动最大值
#define TITLEMAXMOVE 16.0                              ///<    导航文本位移最大值
#define TOPANDBOTTOMCONSTANT 9              ///<    红色背景上下间距约束值

@interface ViewController ()
<
UITableViewDelegate,UITableViewDataSource
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UILabel *navigationtitle;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *BackgroundTopConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ContentTopConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelBottomContraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *infoCenterX;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView addObserver:self forKeyPath:OBSERVERKEY options:NSKeyValueObservingOptionNew context:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.tableView removeObserver:self forKeyPath:OBSERVERKEY];
}

#pragma mark UITableViewDelegate & UITableViewDatascurce

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    view.backgroundColor = [UIColor grayColor];
    view.alpha = .5;
    return view;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - observer
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    CGFloat yOffset = self.tableView.contentOffset.y / MAXMOVE;
    yOffset = MAX(0, MIN(1, yOffset));
    self.navigationtitle.alpha = 1 - yOffset;
    self.labelBottomContraint.constant = yOffset * TITLEMAXMOVE;
        self.BackgroundTopConstraint.constant = self.ContentTopConstraint.constant = TOPANDBOTTOMCONSTANT - yOffset * MAXMOVE;
    self.infoCenterX.constant = TOPANDBOTTOMCONSTANT * yOffset;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%f---%f",self.BackgroundTopConstraint.constant,self.ContentTopConstraint.constant);
}



@end
