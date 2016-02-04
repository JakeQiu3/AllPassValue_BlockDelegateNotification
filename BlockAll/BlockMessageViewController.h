//
//  BlockMessageViewController.h
//  BlockAll
//
//  Created by qsyMac on 16/2/4.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import <UIKit/UIKit.h>
// void(^MyBlockMessage) ()本身是一种数据类型，故可以作为一个独立的参数，穿传到方法中。
typedef void(^MyBlockMessage) ();
@interface BlockMessageViewController : UIViewController
@property (nonatomic, copy)MyBlockMessage blockMessage;
//本方法中有block参数，但Block中无名字，也无参数
- (void)passValueWithBlock:(void(^)())block;

@end
