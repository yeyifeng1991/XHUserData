//
//  ViewController.m
//  XHUserData
//
//  Created by mc on 2018/7/11.
//  Copyright © 2018年 jiucangtouzi. All rights reserved.
//

#import "ViewController.h"
#import "XHData.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    XHUser * user = [[XHUser alloc]initWithDictionary:nil]; // 初始化数据模型
    [[XHData sharedInstance] saveSeccionWithUser:user]; // 保存
// [[XHData sharedInstance] getSeccsion].name;
    NSLog(@"%@",[[XHData sharedInstance] getSeccsion].name);
    [XHData sharedInstance].userId = @"中国";
    NSLog(@"%@",[XHData sharedInstance].userId);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
