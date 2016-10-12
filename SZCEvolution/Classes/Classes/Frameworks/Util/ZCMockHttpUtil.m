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
        
        if ([urlString containsString:@"user/info"]) {
            return YES;
        }
        //else if (<#expression#>){}
        return NO;
    } withStubResponse:^OHHTTPStubsResponse * _Nonnull(NSURLRequest * _Nonnull request) {
        
        NSString * urlString = request.URL.absoluteString;
        
        if ([urlString containsString:@"user/info"]) {
            
            NSString * userNick = @"沉香";
            
            if ([urlString containsString:@"userId=1"]) {
                userNick = @"益智仁";
            }else if ([urlString containsString:@"userId=2"]){
                userNick = @"艾叶";
            }else if ([urlString containsString:@"userId=3"]){
                userNick = @"竹叶";
            }else if ([urlString containsString:@"userId=4"]){
                userNick = @"茭白";
            }
            
//            NSError* notConnectedError = [NSError errorWithDomain:NSURLErrorDomain code:kCFURLErrorNotConnectedToInternet userInfo:nil];
//            return [OHHTTPStubsResponse responseWithError:notConnectedError];
            
            return [[OHHTTPStubsResponse responseWithJSONObject:@{@"userNick":userNick,
                                                                  @"userAge":@35,
                                                                  @"userSex":@1,
                                                                  @"userSignature":@"我是一个iOS工程师"}
                                                     statusCode:statusCode headers:nil]
                    requestTime:requestTime
                    responseTime:responseTime];
        }
        //else if ([urlString containsString:@"iphone/images/1.jpg"]){}
        return nil;
    }];
}


@end
