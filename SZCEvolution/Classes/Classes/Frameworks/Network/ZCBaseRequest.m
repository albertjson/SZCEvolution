//
//  ZCBaseRequest.m
//  SZCEvolution
//
//  Created by choice-ios1 on 16/9/29.
//  Copyright © 2016年 albertjson. All rights reserved.
//

#import "ZCBaseRequest.h"

@implementation ZCBaseRequest

//此方法可以封装一些错误的处理，子类可以继承重写。但是子类继承的时候建议    [super requestFailedFilter];

- (void)requestFailedFilter
{
    NSLog(@"我失败了111想");
}

@end
