//
//  ZCBaseRequest.h
//  SZCEvolution
//
//  Created by choice-ios1 on 16/9/29.
//  Copyright © 2016年 albertjson. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>
#import "YTKBaseRequest+AnimatingAccessory.h"

@interface ZCBaseRequest : YTKRequest

@end
/*
 1. 取消网络请求，在dealloc中调用 [request stop]方法
 2. 
 */
