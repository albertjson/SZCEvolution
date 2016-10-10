//
//  ZCBaseRequest.m
//  SZCEvolution
//
//  Created by choice-ios1 on 16/9/29.
//  Copyright © 2016年 albertjson. All rights reserved.
//

#import "ZCBaseRequest.h"
#import "ZCHTTPError.h"
#import <AFNetworking.h>

@interface ZCBaseRequest()
{
    //UIView * _showView;
}
@end

@implementation ZCBaseRequest

//- (instancetype)initWithAnimatingView:(UIView*)aView
//{
//    self = [super init];
//    if (self) {
//        _showView = aView;
//        [self initialize];
//    }
//    return self;
//}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}
- (void)initialize
{
    self.animatingText = @"";
}

- (BOOL)isHideErrorToast
{
    return NO;
}
/*
 1. 若需要定义json--model，可在以下方法中处理  class ： YTKNetworkAgent
 - (void)handleRequestResult:(NSURLSessionTask *)task responseObject:(id)responseObject
 2. 需要进一步处理error，例如error message定义等等，也在上面方法进行处理
 3. 需要把服务端正常返回的错误格式的数据定义为http的错误，待处理
 4. 需要把token失效的问题统一处理的错误，待处理
 @param success <#success description#>
 @param failure <#failure description#>
 */

/*
///  The validator will be used to test if `responseJSONObject` is correctly formed.
- (nullable id)jsonValidator
{
    //此方法有两个作用
    1. 校验返回的数据格式与此方法内数据格式是否一致[此方法内可缺省，不是所有参数都要写，但是必须要写，为了统一处理错误]
    2. 校验返回的数据字段类型，防止给不符合该字段的类型导致程序的异常
    如果返回的数据有可能为null，则格式需指定为NSObject类型的
}
 */

//以下四个方法子类可以原始拥有，也可以`[super requestCompletePreprocessor];`进行基础上编写，也可以直接重写。但是一般情况下建议继承的基础上

///  Called on background thread after request succeded but before switching to main thread. Note if
///  cache is loaded, this method WILL be called on the main thread, just like `requestCompleteFilter`.
- (void)requestCompletePreprocessor
{
    [super requestCompletePreprocessor];
    //json转model
}

///  Called on the main thread after request succeeded.
- (void)requestCompleteFilter
{
    [super requestCompleteFilter];
}

///  Called on background thread after request succeded but before switching to main thread. See also
///  `requestCompletePreprocessor`.
- (void)requestFailedPreprocessor
{
    [super requestFailedPreprocessor];
    //可以在此方法内处理token失效的情况，所有http请求统一走此方法，即会统一调用

    //note：子类如需继承，必须必须调用 [super requestFailedPreprocessor];
    
    NSError * error = self.error;
    
    if ([error.domain isEqualToString:AFURLResponseSerializationErrorDomain])
    {
        //AFNetworking处理过的错误
        
    }else if ([error.domain isEqualToString:YTKRequestValidationErrorDomain])
    {
        //猿题库处理过的错误
        
    }else{
        //系统级别的domain错误，无网络等[NSURLErrorDomain]
        //根据error的code去定义显示的信息，保证显示的内容可以便捷的控制
    }
    //初始化httpError的值
    //self.httpError = [[ZCHTTPError alloc] initWithDomain:<#(nonnull NSErrorDomain)#> code:<#(NSInteger)#> userInfo:<#(nullable NSDictionary *)#>];
    
    if (![self isHideErrorToast]) {
        UIWindow * window = [[UIApplication sharedApplication] keyWindow];
        
        UIViewController * controller = [self findBestViewController:window.rootViewController];
        
        [WMHUDUntil showFailWithMessage:error.localizedDescription toView:controller.view];
    }
}

///  Called on the main thread when request failed.
- (void)requestFailedFilter
{
    [super requestFailedFilter];
}
- (NSInteger)cacheTimeInSeconds
{
    return 60*3;
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
