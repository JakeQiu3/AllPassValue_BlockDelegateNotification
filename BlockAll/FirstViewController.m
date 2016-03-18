//
//  FirstViewController.m
//  BlockAll
//
//  Created by qsyMac on 16/2/2.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "FirstViewController.h"
#import "SinglePassValue.h"
#import "PassValueToBackViewController.h"
@interface FirstViewController ()

//{
//    UILabel *_label;
//}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
}

- (void)buildUI {
    _label = [[UILabel alloc]init];
    _label.frame = CGRectMake(100, 100, 250, 50);
    _label.backgroundColor = [UIColor greenColor];
    _label.font = [UIFont systemFontOfSize:19];
    _label.textColor = [UIColor redColor];
    _label.numberOfLines = 0;
//    1.属性传值
    _label.text = self.textStr;
//    2.单利传值
//    _label.text = [SinglePassValue shareInstance].contextStr;
//    5.block传值
//    _label.text = self.textStr;
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];
}
//    3.通知传值的方法
- (void)passValueFirst:(NSNotification *)notification {
    self.textStr = notification.userInfo[@"title"];// 间接传值配合上面_label.text = self.textStr  操作
//    _label.text = notification.userInfo[@"title"];// 直接传值给label
    NSLog(@"==%@=====%@",notification.userInfo[@"title"],_label.text);
}

//    4.代理传值的方法
- (void)PassValueToBackVC:(PassValueToBackViewController *
                           )passValueVC passText:(NSString *)text {
      self.textStr = text;// 间接传值
//    _label.text = text;// 直接传值给label
}

- (void)dealloc {
    NSLog(@"销毁观察者,在viewDidDisappear之后才执行");
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma 少 测试各个执行顺序
//// 上一个viewWillDisappear 和 viewDidDisappear之间
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    NSLog(@"2.....viewWillAppear");
//}
//// 上一个viewDidDisappear之后
//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    NSLog(@"2.....viewDidAppear");
//}
////下一个viewDidLoad之前
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    NSLog(@"2.....viewWillDisappear");
//}
////下一个viewWillAppear 和 viewDidAppear 之间
//- (void)viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//     NSLog(@"2.....viewDidDisappear");
//}

@end
