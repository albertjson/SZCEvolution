//
//  ZCMeGetInfoManger.m
//  SZCEvolution
//
//  Created by choice-ios1 on 16/9/29.
//  Copyright © 2016年 albertjson. All rights reserved.
//

#import "ZCMeGetInfoManger.h"

@implementation ZCMeGetInfoManger

- (NSString *)requestUrl
{
    return @"user/info";
}
///  Additional request argument.
- (nullable id)requestArgument
{
    return @{@"id":@"123456"};
}
///  HTTP request method.
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodGET;
}

///  Request serializer type.
//- (YTKRequestSerializerType)requestSerializerType
//{
//    return YTKRequestSerializerTypeJSON;
//}

///  Response serializer type. See also `responseObject`.
- (YTKResponseSerializerType)responseSerializerType
{
    return YTKResponseSerializerTypeJSON;
}
- (NSTimeInterval)requestTimeoutInterval
{
    return 30;
}
@end
