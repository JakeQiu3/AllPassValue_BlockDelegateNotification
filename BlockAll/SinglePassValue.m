//
//  SinglePassValue.m
//  BlockAll
//
//  Created by 邱少依 on 16/2/3.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "SinglePassValue.h"

@implementation SinglePassValue

+ (instancetype)shareInstance {
    static SinglePassValue *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[self alloc] init];
    });
    return singleton;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
