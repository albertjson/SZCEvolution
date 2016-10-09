//
//  ZCMeGetInfoManger.h
//  SZCEvolution
//
//  Created by choice-ios1 on 16/9/29.
//  Copyright © 2016年 albertjson. All rights reserved.
//

#import "ZCBaseRequest.h"
#import "ZCGetInfoModel.h"


@interface ZCMeGetInfoManger : ZCBaseRequest

@property (nonatomic,strong,readonly) ZCGetInfoModel * result;

@end
