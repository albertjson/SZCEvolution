//
//  ZCBaseRequest.m
//  SZCEvolution
//
//  Created by choice-ios1 on 16/9/29.
//  Copyright © 2016年 albertjson. All rights reserved.
//

#import "ZCBaseRequest.h"

@implementation ZCBaseRequest


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
    
}

///  Called on the main thread after request succeeded.
- (void)requestCompleteFilter
{
    
}

///  Called on background thread after request succeded but before switching to main thread. See also
///  `requestCompletePreprocessor`.
- (void)requestFailedPreprocessor
{
    //可以在此方法内处理token失效的情况，所有http请求统一走此方法，即会统一调用

    //note：子类如需继承，必须必须调用 [super requestFailedPreprocessor];
}

///  Called on the main thread when request failed.
- (void)requestFailedFilter
{
    
}

@end
