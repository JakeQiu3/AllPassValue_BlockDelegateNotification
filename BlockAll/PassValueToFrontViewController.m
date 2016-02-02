//
//  PassValueToFrontViewController.m
//  BlockAll
//
//  Created by qsyMac on 16/2/1.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "PassValueToFrontViewController.h"
#import "TwoViewController.h"
@interface PassValueToFrontViewController ()
{
    UIButton *_button;
}
@end

@implementation PassValueToFrontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
}

- (void)buildUI {
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(100, 100, 150, 100);
    _button.backgroundColor = [UIColor greenColor];
    _button.titleLabel.font = [UIFont systemFontOfSize:19];
    [_button setTitle:@"下一页" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(nextPage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}
//点击button方法
- (void)nextPage:(UIButton *)btn {
    TwoViewController *twoVC = [[TwoViewController alloc] init];
    twoVC.backToFront = ^(NSInteger number){// 1,7
        [btn setTitle:[NSString stringWithFormat:@"%ld",(long)number] forState:UIControlStateNormal];//8
    };
    [self.navigationController pushViewController:twoVC animated:YES];
}

@end
