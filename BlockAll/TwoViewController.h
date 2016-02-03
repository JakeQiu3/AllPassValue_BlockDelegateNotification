//
//  TwoViewController.h
//  BlockAll
//
//  Created by qsyMac on 16/2/2.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TwoViewController;
//2.代理传值
@protocol TwoViewControllerDelegate <NSObject>

@optional
- (void)twoVC:(TwoViewController *)twoVC passValueWithInfo:(NSString *)text;
@end

//1.重命名block
typedef void(^BackToFront) ();

@interface TwoViewController : UIViewController
//1.声明一个block函数属性
@property (nonatomic, copy)BackToFront backToFront;//2,4,6

//2.声明一个delegate属性
@property (nonatomic, assign) id<TwoViewControllerDelegate> delegate;


@end
