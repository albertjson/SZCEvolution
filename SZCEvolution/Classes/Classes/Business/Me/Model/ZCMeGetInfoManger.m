//
//  ZCMeGetInfoManger.m
//  SZCEvolution
//
//  Created by choice-ios1 on 16/9/29.
//  Copyright © 2016年 albertjson. All rights reserved.
//

#import "ZCMeGetInfoManger.h"
#import <WMHUDUntil.h>

@implementation ZCMeGetInfoManger

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIViewController *vc = [[UIApplication sharedApplication] keyWindow].rootViewController;
        
        UIViewController * controller = [self findBestViewController:vc];
        self.animatingView = controller.view;
        
        self.animatingText = @"囧大了";
    }return self;
}

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
    return @{@"haha":[NSNumber class]};
}
#pragma mark - private method
- (UIViewController*) findBestViewController:(UIViewController*)vc {
    
    if (vc.presentedViewController) {
        
        // Return presented view controller
        return [self findBestViewController:vc.presentedViewController];
        
    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
        
        // Return right hand side
        UISplitViewController* svc = (UISplitViewController*) vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController:svc.viewControllers.lastObject];
        else
            return vc;
        
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        
        // Return top view
        UINavigationController* svc = (UINavigationController*) vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController:svc.topViewController];
        else
            return vc;
        
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        
        // Return visible view
        UITabBarController* svc = (UITabBarController*) vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController:svc.selectedViewController];
        else
            return vc;
        
    } else {
        
        // Unknown view controller type, return last child view controller
        return vc;
        
    }
    
}

@end
