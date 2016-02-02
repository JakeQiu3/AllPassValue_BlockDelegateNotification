//
//  PassValueToBackViewController.m
//  BlockAll
//
//  Created by qsyMac on 16/2/1.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "PassValueToBackViewController.h"
#import "FirstViewController.h"
@interface PassValueToBackViewController ()
{
    UIButton *_button;
}
@end

@implementation PassValueToBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
}

- (void)buildUI {
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(100, 100, 250, 100);
    _button.backgroundColor = [UIColor greenColor];
    _button.titleLabel.font = [UIFont systemFontOfSize:19];
    [_button setTitle:@"把标题传到下一页" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(nextPage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}
//前到后传值：遵循在前一个界面就完成传值的原则：属性最简单，通知方法，block方法
- (void)nextPage:(UIButton *)btn {
   
    FirstViewController *firstVC = [[FirstViewController alloc] init];
//    属性传值
    firstVC.btnStr = btn.titleLabel.text;
//    通知传值
    NSDictionary *dic = @{@"title":btn.titleLabel.text};
    [[NSNotificationCenter defaultCenter]postNotificationName:@"passValue" object:self userInfo:dic];
    
//    self.frontToBack;
//    if (self.frontToBack) {
//        self.frontToBack();
//    }
//    self.frontToBack = ^(NSString *titile){
//        firstVC.btnStr = btn.titleLabel.text;
//        NSLog(@"");
//    };
    [self.navigationController pushViewController:firstVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
