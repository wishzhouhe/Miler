//
//  ViewController.m
//  GCD
//
//  Created by myzj2004 on 16/7/6.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) dispatch_queue_t mySERIALQueue;
@property (nonatomic,strong) dispatch_queue_t myConcurrentQueue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mySERIALQueue = dispatch_queue_create("com.my.zhouhe", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(_mySERIALQueue, ^{
        NSLog(@"1");
    });
    
    dispatch_async(_mySERIALQueue, ^{
        NSLog(@"2");
    });
    
    dispatch_async(_mySERIALQueue, ^{
        NSLog(@"3");
    });
    
    self.myConcurrentQueue = dispatch_queue_create("com.my.conrurrent", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(_myConcurrentQueue, ^{
        NSLog(@"并发1");
    });
    
    dispatch_async(_myConcurrentQueue, ^{
        NSLog(@"并发2");
    });
    
    dispatch_async(_myConcurrentQueue, ^{
        NSLog(@"并发3");
    });
    
    
    dispatch_queue_t queueSerial = dispatch_queue_create("com.muying.zhouhe", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    
    
    //设置两个队列的执行顺序
    dispatch_set_target_queue(global,queueSerial );
    
    dispatch_async(queueSerial, ^{
        NSLog(@"hello");
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"word");
    });
    
    

    //延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"asdf");
    });
    
    NSDate *data = [[NSDate alloc]initWithTimeIntervalSinceNow:10];
    
    dispatch_after(getDispatchTimeByData(data), dispatch_get_main_queue(), ^{
        NSLog(@"happen sth");
    });
    
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t queueGroup  = dispatch_queue_create("com.group.zhou", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_async(group, queueGroup, ^{
        NSLog(@"A");
    });
    
    dispatch_group_async(group, queueGroup, ^{
        NSLog(@"B");
    });
    
    dispatch_group_async(group, queueGroup, ^{
        NSLog(@"C");
    });
    
    dispatch_group_notify(group, queueGroup, ^{
        NSLog(@"任务组结束");
    });
    
    
    dispatch_queue_t barrier = dispatch_queue_create("com.barrier.zhouhe", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(barrier, ^{
        NSLog(@"1");
    });
    
    dispatch_async(barrier, ^{
        NSLog(@"2");
    });
    
    dispatch_barrier_async(barrier, ^{
        NSLog(@"w");
    });
    
    dispatch_async(barrier, ^{
        NSLog(@"3");
    });
    
    
    
    
    
}

dispatch_time_t getDispatchTimeByData(NSDate *date) {
    NSTimeInterval interval;
    double second, subsecond;
    struct timespec time;
    dispatch_time_t milestone;
    interval = [date timeIntervalSince1970];
    subsecond = modf(interval, &second);
    time.tv_sec = second;
    time.tv_nsec = subsecond * NSEC_PER_SEC;
    milestone = dispatch_walltime(&time, 0);
    return milestone;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
