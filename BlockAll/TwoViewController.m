//
//  TwoViewController.m
//  BlockAll
//
//  Created by qsyMac on 16/2/2.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "TwoViewController.h"
#import "SinglePassValue.h"
@interface TwoViewController ()
{
    NSInteger num;
    UILabel *_label;
}
@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];

}

//  1.block传值
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    num++;
    NSLog(@"%ld",num);
    if (self.backToFront) {//3
        //  block的主体部分在这儿：这个方法走完，意味着值已经传了
        self.backToFront(num);//5,9(最后执行)
    }
}

- (void)buildUI {
    _label = [[UILabel alloc]init];
    _label.frame = CGRectMake(100, 100, 250, 50);
    _label.backgroundColor = [UIColor greenColor];
    _label.font = [UIFont systemFontOfSize:19];
    _label.textColor = [UIColor redColor];
    _label.numberOfLines = 0;
    _label.text = @"传值给上一个页面";
//    2.代理传值
//    if ([self.                                                                                                                                                                                                                                                                                          delegate respondsToSelector:@selector(twoVC:passValueWithInfo:)]) {
// //  delegate的主体部分在这儿：这个方法走完，意味着值已经传了
//        [self.delegate twoVC:self passValueWithInfo:_label.text];
//    }
//    3.通知传值
//       通知的主体部分在这儿：这个方法走完，意味着值已经传了
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ChangeNameNotification" object:self userInfo:@{@"text":_label.text}];
//    4.单利传值
//    [SinglePassValue shareInstance].contextStr = _label.text;
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];
}

//- (void)returnText:(BackToFront)block {
//    self.backToFront = block;
//}
@end
