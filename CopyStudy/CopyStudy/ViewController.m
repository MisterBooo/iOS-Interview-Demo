//
//  ViewController.m
//  CopyStudy
//
//  Created by MisterBooo on 2017/12/26.
//  Copyright © 2017年 MisterBooo. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    Person *p1 = [[Person alloc] init];
    p1.name = @"name1";
    p1.age = 11;
    
    Person *p2 = [[Person alloc] init];
    p2.name = @"name2";
    p2.age = 12;
    
    NSArray *array = @[p1,p2];
    NSLog(@"array:%p",array);
    NSArray *arrayCopy = array.copy;
    NSMutableArray *arrayMcopy = array.mutableCopy;
    NSLog(@"arrayCopy:%p",arrayCopy);
    NSLog(@"arrayMcopy:%p",arrayMcopy);

//    p1.name = @"改变了";
//    Person *p_array = array.firstObject;
//    Person *p_arrayCopy= arrayCopy.firstObject;
//    Person *p_arrayMcopy = arrayMcopy.firstObject;
//
//    NSLog(@"p_array:%@,p_arrayCopy:%@,p_arrayMcopy:%@",p_array.name,p_arrayCopy.name,p_arrayMcopy.name);
    /*
            p_array:改变了,p_arrayCopy:改变了,p_arrayMcopy:改变了
     */

    /*
     2017-12-26 16:50:37.065394+0800 CopyStudy[13417:2707260] 前array:(
     "<Person: 0x6040002224c0>",
     "<Person: 0x604000224300>"
     )
     2017-12-26 16:50:37.065608+0800 CopyStudy[13417:2707260] 后array:(
     "<Person: 0x6040002224c0>",
     "<Person: 0x604000224300>"
     )
     2017-12-26 16:50:37.065874+0800 CopyStudy[13417:2707260] array:(
     "<Person: 0x6040002224c0>",
     "<Person: 0x604000224300>"
     )
     */
    
    
}

@end
