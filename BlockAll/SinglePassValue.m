//
//  SinglePassValue.m
//  BlockAll
//
//  Created by 邱少依 on 16/2/3.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "SinglePassValue.h"

@implementation SinglePassValue
//方法1
+ (instancetype)shareInstance {
    static SinglePassValue *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[self alloc] init];
    });
    return singleton;
}
//方法2
//+ (instancetype)shareInstance {
//    static SinglePassValue *singleton = nil;
////    资源加锁，保证线程单词只有1次被访问
//    @synchronized(self) {
//        if (!singleton) {
//            singleton = [[SinglePassValue alloc]init];
//        }
//        return singleton;
//    }
//}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
