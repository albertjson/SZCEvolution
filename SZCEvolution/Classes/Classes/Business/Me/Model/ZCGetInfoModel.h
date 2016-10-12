//
//  ZCGetInfoModel.h
//  SZCEvolution
//
//  Created by 宋子初 on 2016/10/9.
//  Copyright © 2016年 albertjson. All rights reserved.
//

#import "ZCJSONModel.h"

@interface ZCGetInfoModel : ZCJSONModel

@property (nonatomic,copy) NSString * userNick;

@property (nonatomic,assign) NSInteger userAge;

@property (nonatomic,assign) BOOL userSex;

@property (nonatomic,copy) NSString<Optional> * userSignature;

@end
