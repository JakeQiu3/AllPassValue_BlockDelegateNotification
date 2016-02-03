//
//  PassValueToFrontViewController.m
//  BlockAll
//
//  Created by qsyMac on 16/2/1.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "PassValueToFrontViewController.h"
#import "TwoViewController.h"
#import "SinglePassValue.h"
@interface PassValueToFrontViewController ()<TwoViewControllerDelegate>
{
    UIButton *_button;
    UITextField *_textField;
}
@end

@implementation PassValueToFrontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
}

- (void)buildUI {
    
    _textField = [[UITextField alloc] init];
    _textField.frame = CGRectMake(100, 100, 250, 30);
    _textField.placeholder = @"输入框内请输入内容";
    _textField.textAlignment = NSTextAlignmentCenter;
    _textField.textColor = [UIColor blueColor];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.layer.borderColor = [UIColor blackColor].CGColor;
    _textField.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_textField];
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(150, 300, 150, 50);
    _button.backgroundColor = [UIColor lightGrayColor];
    _button.titleLabel.font = [UIFont systemFontOfSize:19];
    [_button setTitle:@"Next Page" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(nextPage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}

//点击button方法
- (void)nextPage:(UIButton *)btn {
    TwoViewController *twoVC = [[TwoViewController alloc] init];
#pragma 少1 block方法
    twoVC.backToFront = ^(NSInteger number){// 1,7
        _textField.text = [NSString stringWithFormat:@"%ld",number];//8
    };
//    2.设置delegate
    twoVC.delegate = self;
    [self.navigationController pushViewController:twoVC animated:YES];
}

#pragma 少2 代理方法
- (void)twoVC:(TwoViewController *)twoVC passValueWithInfo:(NSString *)text {
    
    _textField.text = text;
}

#pragma 少3 通知

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(passValue:) name:@"ChangeNameNotification" object:nil];
    #pragma 少4 单利
//    _textField.text = [SinglePassValue shareInstance].contextStr;

}

- (void)passValue:(NSNotification *)notification {
   _textField.text = notification.userInfo[@"text"];
    NSLog(@"%@",_textField.text);
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"ChangeNameNotification" object:nil];
}

@end
