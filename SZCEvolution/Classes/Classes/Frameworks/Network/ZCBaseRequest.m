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
/**
 1. 若需要定义json--model，可在以下方法中处理  class ： YTKNetworkAgent
 - (void)handleRequestResult:(NSURLSessionTask *)task responseObject:(id)responseObject
 2. 需要进一步处理error，例如error message定义等等，也在上面方法进行处理
 3. 需要把服务端正常返回的错误格式的数据定义为http的错误，待处理
 4. 需要把token失效的问题统一处理的错误，待处理
 @param success <#success description#>
 @param failure <#failure description#>
 */


@end
