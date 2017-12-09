//
//  ViewController.m
//  TestGCDDemo
//
//  Created by MisterBooo on 2017/12/5.
//  Copyright © 2017年 MisterBooo. All rights reserved.
//

#import "ViewController.h"

typedef void(^Completion) (NSString *string);

@interface ViewController (){
    dispatch_queue_t concurrent_queue;
    dispatch_queue_t serial_queue;
}

@property(nonatomic, copy) Completion completion;

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
//指定优先级
- (IBAction)setTargetQueue:(id)sender {
    
    NSLog(@"************指定优先级***********");
    dispatch_queue_t serialDispatchQueue = dispatch_queue_create("com.MisterBooo.TestGCDDemo.www", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t dispatchGetGlboalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    // 第一个参数为要设置优先级的queue,第二个参数是参照物，既将第一个queue的优先级和第二个queue的优先级设置一样。
    dispatch_set_target_queue(serialDispatchQueue, dispatchGetGlboalQueue);

    dispatch_async(serialDispatchQueue, ^{
        NSLog(@"低优先级喽");
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"优先级一般1。。。");
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"优先级一般2。。。");
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"优先级一般3。。。");
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"优先级一般4。。。");
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"优先级一般5。。。");
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"优先级一般6。。。");
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"优先级一般7。。。");
    });
    
    /*
     输出:
     2017-12-05 16:18:37.738609+0800 TestGCDDemo[99519:4104624] ************指定优先级***********
     2017-12-05 16:18:37.739033+0800 TestGCDDemo[99519:4104977] 优先级一般1。。。
     2017-12-05 16:18:37.739061+0800 TestGCDDemo[99519:4104975] 优先级一般2。。。
     2017-12-05 16:18:37.739057+0800 TestGCDDemo[99519:4104978] 低优先级喽
     2017-12-05 16:18:37.739371+0800 TestGCDDemo[99519:4104990] 优先级一般3。。。
     2017-12-05 16:18:37.739647+0800 TestGCDDemo[99519:4104991] 优先级一般4。。。
     2017-12-05 16:18:37.739780+0800 TestGCDDemo[99519:4104976] 优先级一般5。。。
     2017-12-05 16:18:37.739923+0800 TestGCDDemo[99519:4104992] 优先级一般6。。。
     2017-12-05 16:18:37.740032+0800 TestGCDDemo[99519:4104977] 优先级一般7。。。
     */
   
}

- (IBAction)printAllDispacth:(id)sender {
    NSLog(@"************printAllDispacth***********");
    
 /*
  常见编译警告类型
  -Wincompatible-pointer-types    指针类型不匹配
  -Wincomplete-implementation     没有实现已声明的方法
  -Wprotocol                      没有实现协议的方法
  -Wimplicit-function-declaration 尚未声明的函数(通常指c函数)
  -Warc-performSelector-leaks     使用performSelector可能会出现泄漏(该警告在xcode4.3.1中没出现过,网上流传说4.2使用performselector:withObject: 就会得到该警告)
  -Wdeprecated-declarations       使用了不推荐使用的方法(如[UILabel setFont:(UIFont*)])
  -Wunused-variable               含有没有被使用的变量
  -Wundeclared-selector           未定义selector方法
  
  */
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
    //被夹在这中间的代码针对于此警告都会无视并且不显示出来

    dispatch_queue_t mainDispatchQueue = dispatch_get_main_queue();
    
    dispatch_queue_t globalDispatchQueueHigh = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    
    dispatch_queue_t globalDispatchQueueDefault = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_queue_t globalDispatchQueueLow = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    
    dispatch_queue_t globalDispatchQueueBackground = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
   
#pragma clang diagnostic pop
    
}

- (IBAction)testDispatchGroup:(id)sender {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"blk0");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"blk1");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"blk2");
    });
    dispatch_group_async(group, queue, ^{
        int sleepTime = arc4random_uniform(5);
        sleep(sleepTime);
        NSLog(@"blk3:休息了%d秒",sleepTime);
    });
    
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        NSLog(@"done");
//    });
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 2ull * NSEC_PER_SEC);
    long result = dispatch_group_wait(group, time);
    if (result == 0) {
        //group的全部处理执行结束
        NSLog(@"group的全部处理执行结束");
    }else{
        //group的某一个处理还在执行中
        NSLog(@"等了2秒了，group的某一个处理还在执行中");

    }
    
}

- (IBAction)testSyncLock:(id)sender {
    dispatch_queue_t queue = dispatch_get_main_queue();
    //Thread 1: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0)
    dispatch_sync(queue, ^{
        NSLog(@"不会执行的代码，打印不出来");
    });
    
}
- (IBAction)testDispatchApply:(id)sender {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_apply(30, queue, ^(size_t index) {
        NSLog(@"index:%zu",index);
    });
    
    NSLog(@"done");
}
- (IBAction)testSemaphore:(id)sender {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 10000; i++) {
        dispatch_async(queue, ^{
            
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            
            [array addObject:[NSNumber numberWithInt:i]];
            NSLog(@"i:%d",i);
            
            dispatch_semaphore_signal(semaphore);
            
        });
    }
}

- (IBAction)testDispatchSource:(id)sender {
    

    __block NSString *str = @"改变前str";
    Completion _completion = ^(NSString *String){
        NSLog(@"block里面的str:%@",str);
        dispatch_sync(concurrent_queue, ^{
            NSLog(@"同步concurrent_queue的str:%@",str);
        });
//        dispatch_sync(daispatch_get_main_queue(), ^{
//            NSLog(@"同步主线程里面的str:%@",str);
//        });
        dispatch_async(concurrent_queue, ^{
            NSLog(@"异步concurrent_queue的str:%@",str);
        });
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"异步主线程里面的str:%@",str);
        });
    };
    str = @"block里面的";
    _completion(@"_completion");
    str = @"主线程里面的";
//    dispatch_async(concurrent_queue, ^{
//        sleep(2);
//        str = @"concurrent_queue";
//    });
//

       
    
   
  
    
   
    return;

    ///定时器
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    
    dispatch_source_set_timer(timer, 5ull * NSEC_PER_SEC, DISPATCH_TIME_FOREVER, 1ull * NSEC_PER_SEC);
    
    dispatch_source_set_event_handler(timer, ^{
        NSLog(@"wakeup");
        dispatch_source_cancel(timer);
    });
    
    dispatch_source_set_cancel_handler(timer, ^{
        
    });
    
    dispatch_resume(timer);
}

#pragma mark - Private
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
