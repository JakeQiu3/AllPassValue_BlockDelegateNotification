//
//  PassValueToBackViewController.m
//  BlockAll
//
//  Created by qsyMac on 16/2/1.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "PassValueToBackViewController.h"
#import "FirstViewController.h"
#import "SinglePassValue.h"
@interface PassValueToBackViewController ()
{
    UIButton *_button;
    UITextField *_textField;
}
@end

@implementation PassValueToBackViewController

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

#warning 少 ——> 前到后传值：遵循在前一个界面就完成传值的原则：属性最简单，单利次之，代理(回调)不适合，通知方法（回调）不适合，block(回调)不适合
- (void)nextPage:(UIButton *)btn {
   
    FirstViewController *firstVC = [[FirstViewController alloc] init];
//   1. 属性传值:
//    firstVC.textStr = _textField.text;
//   2. 单利传值
//    [SinglePassValue shareInstance].contextStr = _textField.text;
//   3. 通知传值:（ 顺序：必须先注册观察者，再执行发布通知，才能执行观察者方法！）
    
    [[NSNotificationCenter defaultCenter]addObserver:firstVC selector:@selector(passValueFirst:) name:@"QSYPass" object:nil];
//    4.代理传值：代理传值中，无论optional或required，都无需专门遵守协议！
//    self.delegate = (id)firstVC;
//    5.block传值
//    self.frontToBack = ^(NSString *title){
//        firstVC.textStr = title;//间接传值
////        firstVC.label.text = title;//直接传值
//        NSLog(@"===%@===========%@",title,firstVC.textStr);
//    };
//    
    [self.navigationController pushViewController:firstVC animated:YES];
 #warning 少 ——> 陷阱：传过去值了，但控件的创建是放在viewdidLoad里面，是这个button方法全部执行完后才会去执行的，这样就不会显示，故选择viewDidDisappear方法。
//测试 NSDictionary *dic = @{@"title":_textField.text};
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"QSYPass" object:self userInfo:dic];
//    NSLog(@"%@",dic[@"title"]);
}

#warning 少，重点 -> 该方法是后一个视图viewWillAppear加载完毕后，viewDidAppear未加载时，才执行。
//- (void)viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
////    发布通知
//    NSDictionary *dic = @{@"title":_textField.text};
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"QSYPass" object:self userInfo:dic];
//    NSLog(@"%@",dic[@"title"]);
//    
////   执行代理
//    if ([self.delegate respondsToSelector:@selector(PassValueToBackVC:passText:)]) {
//        [self.delegate PassValueToBackVC:self passText:_textField.text];
//    }
//
////   block方法
//    if (self.frontToBack) {
//        self.frontToBack(_textField.text);
//    }
//
//}

#warning 少，重点 -> 视图将会消失，在下一个视图加载前，就执行了。故不能直接把数据传给控件（因为此时控件还没创建，为nil），而是把数据传给下一个视图的属性。
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //    发布通知
    NSDictionary *dic = @{@"title":_textField.text};
    [[NSNotificationCenter defaultCenter]postNotificationName:@"QSYPass" object:self userInfo:dic];
    NSLog(@"%@",dic[@"title"]);
    
    //   执行代理
    if (self.delegate && [self.delegate respondsToSelector:@selector(PassValueToBackVC:passText:)]) {
        [self.delegate PassValueToBackVC:self passText:_textField.text];
    }

    //    block方法
    if (self.frontToBack) {
        self.frontToBack(_textField.text);
    }

}


@end
