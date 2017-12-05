//
//  ViewController.m
//  TestGCDDemo
//
//  Created by MisterBooo on 2017/12/5.
//  Copyright © 2017年 MisterBooo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    dispatch_queue_t concurrent_queue;
    dispatch_queue_t serial_queue;
}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    concurrent_queue = dispatch_queue_create("com.yangxiaoliu.www", DISPATCH_QUEUE_CONCURRENT);
    serial_queue = dispatch_queue_create("com.misterbbooo.www", DISPATCH_QUEUE_SERIAL);
    
}
//异步串行
- (IBAction)testAsyncWithSerialQueue:(id)sender {
 NSLog(@"************testAsyncWithSerialQueue***********");
    [self addQueue:serial_queue];
}
//异步并行
- (IBAction)testAsyncWithConCurrentQueue:(id)sender { NSLog(@"************testAsyncWithConCurrentQueue***********");
    [self addQueue:concurrent_queue];
}

//测试BarrierSync
- (IBAction)testBarrierSyncWithConCurrentQueue:(id)sender {
    NSLog(@"************testBarrierSyncWithConCurrentQueue***********");
    for (int index = 0; index < 20; index++) {
        dispatch_async(concurrent_queue, ^{
            NSLog(@"index = %d",index);
        });
    }
    for (int j = 0; j < 10000; j++) {
        dispatch_barrier_sync(concurrent_queue, ^{
            if (j == 9999) {
                NSLog(@"barrier Finished");
                NSLog(@"current thread is %@",[NSThread currentThread]);
            }
        });
    }
    NSLog(@"Running on Main Thread");
    for (int index = 20 ; index < 40; index++) {
        dispatch_async(concurrent_queue, ^{
            NSLog(@"index = %d",index);
        });
    }
}



//在指定队列添加任务
- (void)addQueue:(dispatch_queue_t )queue{
    dispatch_async(queue, ^{
        NSLog(@"1:%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"2:%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"3:%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"4:%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"5:%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"6:%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"7:%@",[NSThread currentThread]);
    });
}


@end
