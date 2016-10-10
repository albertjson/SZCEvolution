//
//  ZCMeGetInfoManger.m
//  SZCEvolution
//
//  Created by choice-ios1 on 16/9/29.
//  Copyright © 2016年 albertjson. All rights reserved.
//

#import "ZCMeGetInfoManger.h"

@implementation ZCMeGetInfoManger

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        UIViewController *vc = [[UIApplication sharedApplication] keyWindow].rootViewController;
//        
//        UIViewController * controller = [self findBestViewController:vc];
//        self.animatingView = controller.view;
//        
//        self.animatingText = @"囧大了";
//    }return self;
//}

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
- (void)requestFailedFilter
{
    [super requestFailedFilter];
    
    NSLog(@"我失败了222");
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    [WMHUDUntil showFailWithMessage:@"难道就失败了吗" toView:window];
}

- (nullable id)jsonValidator
{
    return @{@"haha":[NSObject class]};
}

@end
