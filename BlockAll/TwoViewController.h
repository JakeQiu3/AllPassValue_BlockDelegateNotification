//
//  TwoViewController.h
//  BlockAll
//
//  Created by qsyMac on 16/2/2.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import <UIKit/UIKit.h>
//重命名block
typedef void(^BackToFront) ();

@interface TwoViewController : UIViewController
//声明一个block函数属性
@property (nonatomic, copy)BackToFront backToFront;//2,4,6

////含有Block参数的语句块函数
//- (void)returnText:(BackToFront)block;
@end
