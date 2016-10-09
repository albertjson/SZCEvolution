//
//  ZCBaseRequest.h
//  SZCEvolution
//
//  Created by choice-ios1 on 16/9/29.
//  Copyright © 2016年 albertjson. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>
#import "YTKBaseRequest+AnimatingAccessory.h"


#define BASERequest  (ZCBaseRequest*)request

@class ZCHTTPError;
@class ZCJSONModel;

@interface ZCBaseRequest : YTKRequest

@property (nonatomic,strong) ZCHTTPError * httpError;

//获取解析成model的数据<子类只能去调用不能重写>
- (instancetype)getParseJSONModel;

// model对应的类名，子类实现的话会直接映射到该model类并进行初始化操作
- (NSString*)modelClassName;

@end
/*
 1. 取消网络请求，在dealloc中调用 [request stop]方法
 2. 
 */
