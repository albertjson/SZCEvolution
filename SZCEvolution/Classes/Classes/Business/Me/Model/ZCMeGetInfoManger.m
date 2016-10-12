//
//  ZCMeGetInfoManger.m
//  SZCEvolution
//
//  Created by choice-ios1 on 16/9/29.
//  Copyright © 2016年 albertjson. All rights reserved.
//

#import "ZCMeGetInfoManger.h"

@implementation ZCMeGetInfoManger

///请求的url，不包括域名`域名通过YTKNetworkConfig配置`
- (NSString *)requestUrl
{
    return @"user/info";
}
///请求入参
- (nullable id)requestArgument
{
    return self.param.toDictionary;
}
///可选，当使用缓存的时候，根据argument来过滤想要的缓存数据
- (id)cacheFileNameFilterForRequestArgument:(id)argument
{
    return self.param.toDictionary;
}
///请求方式，默认为GET请求
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodGET;
}
///请求寄存器，默认为http
- (YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeHTTP;
}

///响应寄存器，默认JSON响应数据 详见 `responseObject`.
- (YTKResponseSerializerType)responseSerializerType
{
    return YTKResponseSerializerTypeJSON;
}
///请求超时时间，默认60s，除特殊需要，一般子类不需要实现
- (NSTimeInterval)requestTimeoutInterval
{
    return 30;
}
- (NSInteger)cacheTimeInSeconds
{
    return 10;
}
///json校验，如实现该方法，如返回数据与校验的参数不一致，则会调用失败函数
///jsonValidator并不需要校验全部的回参，根据情况需要
- (nullable id)jsonValidator
{
    return @{@"userNick":[NSString class]};
}
///失败/成功的回调，一般不需要再这里实现，如果要实现，请必须调用`[super requestFailedFilter];`
- (void)requestFailedFilter
{
    [super requestFailedFilter];
}
- (void)requestCompleteFilter{
    [super requestCompleteFilter];
}

@end
