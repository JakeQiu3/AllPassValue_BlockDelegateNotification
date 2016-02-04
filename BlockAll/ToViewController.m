//
//  ToViewController.m
//  uuu
//
//  Created by qsyMac on 16/2/4.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "ToViewController.h"
#import "ThreeViewController.h"

@interface ToViewController ()<UIAlertViewDelegate>

@end

@implementation ToViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 50);
    [btn setTitle:@"测试" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    btn.titleLabel.text = @"测试";
//    btn.titleLabel.textColor = [UIColor redColor];
    [btn addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
}
- (void)push:(UIButton *)btn  {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"选择" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex) {//点击确定
        ThreeViewController *threeBar = [[ThreeViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:threeBar];
        self.view.window.rootViewController = nav;
//        UIWindow *keywindow = [[UIApplication sharedApplication].windows lastObject];
//        keywindow.rootViewController = threeBar;
//        [UIApplication sharedApplication].keyWindow.rootViewController = threeBar;
    }
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
