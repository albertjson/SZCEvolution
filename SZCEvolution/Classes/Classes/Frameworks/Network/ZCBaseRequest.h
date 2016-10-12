//
//  ZCBaseRequest.h
//  SZCEvolution
//
//  Created by choice-ios1 on 16/9/29.
//  Copyright © 2016年 albertjson. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>
#import "YTKBaseRequest+AnimatingAccessory.h"
#import <WMHUDUntil.h>

@class ZCHTTPError;

@interface ZCBaseRequest : YTKRequest

//初始化方法，指定loading所在的页面，如果用init方法需要自己指定动画页面，不需要动画则不用指定view
//- (instancetype)initWithAnimatingView:(UIView*)aView;
//
@property (nonatomic,strong) ZCHTTPError * httpError;

- (BOOL)isHideErrorToast;

@end
/*
 1. 取消网络请求，在dealloc中调用 [request stop]方法
 2. 建议：入餐/出餐三个以上要用JsonModel，方便使用和维护
 */
