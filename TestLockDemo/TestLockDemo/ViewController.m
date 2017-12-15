//
//  ViewController.m
//  TestLockDemo
//
//  Created by MisterBooo on 2017/12/5.
//  Copyright © 2017年 MisterBooo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [self.view addSubview:view];
//    view.backgroundColor = [UIColor greenColor];
//
//    view.bounds = CGRectMake(0, 0, 300, 300);
//
//    NSLog(@"view.frame:%@,view.bounds:%@",NSStringFromCGRect(view.frame),NSStringFromCGRect(view.bounds));
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"numberOfSectionsInTableView");
    return 1  ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"numberOfRowsInSection");
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    NSLog(@"heightForHeaderInSection");
    return 22;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    NSLog(@"heightForFooterInSection");
    return 22;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"heightForRowAtIndexPath");
    return 44;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 100, 10)];
    headerView.backgroundColor = [UIColor orangeColor];
    NSLog(@"viewForHeaderInSection");
    return headerView;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 100, 10)];
    headerView.backgroundColor = [UIColor redColor];
    NSLog(@"viewForFooterInSection");
    return headerView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = @"textLabel";
    cell.contentView.backgroundColor = [UIColor greenColor];
    NSLog(@"cellForRowAtIndexPath");
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
