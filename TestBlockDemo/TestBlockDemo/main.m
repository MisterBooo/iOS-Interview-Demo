//
//  main.m
//  TestBlockDemo
//
//  Created by MisterBooo on 2017/12/5.
//  Copyright © 2017年 MisterBooo. All rights reserved.
//

//#import <Foundation/Foundation.h>
//
//int global_i = 1;
//
//static int static_global_j = 2;
//
//int main(int argc, const char * argv[]) {
//
//    static int static_k = 3;
//    int val = 4;
//
//    void (^myBlock)(void) = ^{
//        global_i ++;
//        static_global_j ++;
//        static_k ++;
//        NSLog(@"Block中 global_i = %d,static_global_j = %d,static_k = %d,val = %d",global_i,static_global_j,static_k,val);
//    };
//
//    global_i ++;
//    static_global_j ++;
//    static_k ++;
//    val ++;
//    NSLog(@"Block外 global_i = %d,static_global_j = %d,static_k = %d,val = %d",global_i,static_global_j,static_k,val);
//
//    myBlock();
//
//    return 0;
//}
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    __block int aaa = 0;
    
    void (^myBlock)(void) = ^{
        aaa ++;
        NSLog(@"%d",aaa);
    };
    
    myBlock();
    
    return 0;
}



