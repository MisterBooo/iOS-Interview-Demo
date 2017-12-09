//
//  ViewController.m
//  TestLockDemo
//
//  Created by MisterBooo on 2017/12/5.
//  Copyright © 2017年 MisterBooo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)testSynchronized:(id)sender {
    NSObject *obj = [[NSObject alloc] init];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @synchronized(obj){
            NSLog(@"需要线程同步的操作1 开始");
            sleep(3);
            NSLog(@"需要线程同步的操作1 结束");
        }
        
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        @synchronized(obj) {
            NSLog(@"需要线程同步的操作2");
        }
    });
    /*
    2017-12-06 11:31:51.087583+0800 TestLockDemo[7425:4466637] 需要线程同步的操作1 开始
    2017-12-06 11:31:54.089847+0800 TestLockDemo[7425:4466637] 需要线程同步的操作1 结束
    2017-12-06 11:31:54.090082+0800 TestLockDemo[7425:4466405] 需要线程同步的操作2
     */
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
