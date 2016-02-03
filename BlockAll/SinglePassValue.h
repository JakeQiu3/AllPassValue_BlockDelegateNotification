//
//  SinglePassValue.h
//  BlockAll
//
//  Created by 邱少依 on 16/2/3.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SinglePassValue : NSObject
//单利传值
@property (nonatomic, strong) NSString *contextStr;
+ (instancetype)shareInstance;
@end
