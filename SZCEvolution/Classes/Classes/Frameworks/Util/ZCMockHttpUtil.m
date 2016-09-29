//
//  ZCMockHttpUtil.m
//  SZCEvolution
//
//  Created by choice-ios1 on 16/9/29.
//  Copyright © 2016年 albertjson. All rights reserved.
//

#import "ZCMockHttpUtil.h"

#import <OHHTTPStubs.h>
#import <OHHTTPStubsResponse+JSON.h>

@implementation ZCMockHttpUtil

+ (void)setMockEnabled:(BOOL)enabled
{
    [OHHTTPStubs setEnabled:enabled];
}

+ (void)configMockHttpResponse
{
    int statusCode = 200;
    NSTimeInterval requestTime = 1;
    NSTimeInterval responseTime = 2;
    
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest * _Nonnull request) {
        
        NSString * urlString = request.URL.absoluteString;
        
        if ([urlString containsString:@"http://www.baidu.com"]) {
            return YES;
        }
        //else if (<#expression#>){}
        return NO;
    } withStubResponse:^OHHTTPStubsResponse * _Nonnull(NSURLRequest * _Nonnull request) {
        
        NSString * urlString = request.URL.absoluteString;
        
        if ([urlString containsString:@"http://www.baidu.com"]) {
            
            NSError* notConnectedError = [NSError errorWithDomain:NSURLErrorDomain code:kCFURLErrorNotConnectedToInternet userInfo:nil];
            return [OHHTTPStubsResponse responseWithError:notConnectedError];
            
            //return [[OHHTTPStubsResponse responseWithJSONObject:@{@"ADAPTER":@"http://m6.g13p.com/j0/girl13.com-2016-09-26-16-57-08_7h.jpg"} statusCode:statusCode headers:nil] requestTime:requestTime responseTime:responseTime];
        }
        //else if (<#expression#>){}
        return nil;
    }];
}


@end
