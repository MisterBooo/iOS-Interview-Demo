//
//  ViewController.m
//  TestBlockDemo
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
    [self printfGlobalBlock];
    [self printfStackBLock];
}

- (void)printfGlobalBlock{
    NSLog(@"%@",^{
        int temp = 10;
        printf("%d\n",temp);
    });
    //2017-12-05 19:27:53.425680+0800 TestBlockDemo[3924:4248116] <__NSGlobalBlock__: 0x10bc83088>
}
- (void)printfStackBLock{
    int temp = 10;
    NSLog(@"%@",^{
        printf("%d\n",temp);
    });
    //2017-12-06 10:10:57.147892+0800 TestBlockDemo[5538:4373417] <__NSStackBlock__: 0x7fff53683ba8>

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
