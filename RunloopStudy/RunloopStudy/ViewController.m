//
//  ViewController.m
//  RunloopStudy
//
//  Created by MisterBooo on 2017/12/28.
//  Copyright © 2017年 MisterBooo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//** 线程 */
@property(nonatomic, strong) NSThread *thread;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)testDemo1:(id)sender {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"线程开始");
        //获取到当前线程
        self.thread = [NSThread currentThread];
        
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        //添加一个Port
        [runloop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        //运行一个runloop，[NSDate distantFuture]：很久很久以后才让它失效
        [runloop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        NSLog(@"线程结束");
        
        //我们看到，我们收到了一个消息，这个消息是一个非timer的事件，所以runloop处理完就退出了
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self performSelector:@selector(recieveMsg) onThread:self.thread withObject:nil waitUntilDone:NO];
    });
    
    
}
- (void)recieveMsg{
    NSLog(@"收到消息了，在这个线程：%@",[NSThread currentThread]);
}


@end
