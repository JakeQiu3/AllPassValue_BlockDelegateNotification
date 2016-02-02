//
//  FirstViewController.m
//  BlockAll
//
//  Created by qsyMac on 16/2/2.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "FirstViewController.h"
@interface FirstViewController ()
{
    UIButton *_button;
}
@end

@implementation FirstViewController
// http://blog.csdn.net/leikezhu1981/article/details/40018415
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(passValue:) name:@"passValue" object:nil];
    [NSNotificationCenter defaultCenter];
}

- (void)passValue:(NSNotification *)notification {
    _button.titleLabel.text = notification.userInfo[@"title"];
    NSLog(@"%@",_button.titleLabel.text);
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"passValue" object:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
}

- (void)buildUI {
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(100, 100, 250, 100);
    _button.backgroundColor = [UIColor greenColor];
    _button.titleLabel.font = [UIFont systemFontOfSize:19];
//    属性
//    [_button setTitle:self.btnStr forState:UIControlStateNormal];
//    [_button setTitle:self.btnStr forState:UIControlStateNormal];

    [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:_button];
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
