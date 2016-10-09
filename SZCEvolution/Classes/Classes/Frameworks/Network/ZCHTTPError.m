//
//  ZCHTTPError.m
//  SZCEvolution
//
//  Created by choice-ios1 on 16/10/9.
//  Copyright © 2016年 albertjson. All rights reserved.
//

#import "ZCHTTPError.h"

@implementation ZCHTTPError

- (instancetype)initWithDomain:(NSErrorDomain)domain code:(NSInteger)code userInfo:(nullable NSDictionary *)dict
{
    self = [super initWithDomain:domain code:code userInfo:dict];
    if (self) {
        
    }
    return self;
}

@end
