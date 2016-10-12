//
//  ZCMeGetInfoManger.h
//  SZCEvolution
//
//  Created by choice-ios1 on 16/9/29.
//  Copyright © 2016年 albertjson. All rights reserved.
//

#import "ZCBaseRequest.h"
#import "ZCGetInfoParam.h"
#import "ZCGetInfoModel.h"

@interface ZCMeGetInfoManger : ZCBaseRequest

//入参model
//当入参在三个以下的时候，可以不用写model，初始化传入参数即可
@property (nonatomic,strong) ZCGetInfoParam * param;

@end
