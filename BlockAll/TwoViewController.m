//
//  TwoViewController.m
//  BlockAll
//
//  Created by qsyMac on 16/2/2.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()
{
    NSInteger num;
}
@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
//点击次数
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    num++;
    NSLog(@"%ld",num);
    if (self.backToFront) {//3
//  block的主体部分在这儿：这个方法走完，意味着值已经传了
        self.backToFront(num);//5,9(最后执行)
    }
}

//- (void)returnText:(BackToFront)block {
//    self.backToFront = block;
//}
@end
