//
//  PassValueToBackViewController.h
//  BlockAll
//
//  Created by qsyMac on 16/2/1.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PassValueToBackViewController;
//4、代理传值
@protocol PassValueToBackViewControllerDelegate <NSObject>

@optional
- (void)PassValueToBackVC:(PassValueToBackViewController *
                           )passValueVC passText:(NSString *)text;
@end
//2.重命名block
typedef void(^FrontToBack) ();
@interface PassValueToBackViewController : UIViewController
//2.声明block属性
@property (nonatomic, copy)FrontToBack frontToBack;

//4.代理
@property (nonatomic, assign) id<PassValueToBackViewControllerDelegate> delegate;

@end
