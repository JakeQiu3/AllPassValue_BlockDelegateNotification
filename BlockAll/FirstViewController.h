//
//  FirstViewController.h
//  BlockAll
//
//  Created by qsyMac on 16/2/2.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
@property (nonatomic, strong)NSString *textStr;
- (void)passValueFirst:(NSNotification *)notification;

@property (nonatomic, strong) UILabel *label;
@end
