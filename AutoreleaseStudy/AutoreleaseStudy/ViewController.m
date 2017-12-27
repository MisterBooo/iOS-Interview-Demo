//
//  ViewController.m
//  AutoreleaseStudy
//
//  Created by MisterBooo on 2017/12/27.
//  Copyright © 2017年 MisterBooo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

__weak id reference = nil;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *str = [NSString stringWithFormat:@"MisterBooo"];
    reference = str;
    NSLog(@"viewDidLoad:%@",reference);

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear:%@",reference);
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear:%@",reference);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
