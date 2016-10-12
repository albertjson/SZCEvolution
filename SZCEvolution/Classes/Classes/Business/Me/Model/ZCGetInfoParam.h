//
//  ZCGetInfoParam.h
//  SZCEvolution
//
//  Created by choice-ios1 on 16/10/11.
//  Copyright © 2016年 albertjson. All rights reserved.
//

#import "ZCJSONModel.h"

@interface ZCGetInfoParam : ZCJSONModel

@property (nonatomic,copy) NSString * userId;

@property (nonatomic,copy) NSString * token;

@property (nonatomic,copy) NSString <Optional>* userName;

@end
