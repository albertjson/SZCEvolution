//
//  ZCHTTPError.h
//  SZCEvolution
//
//  Created by choice-ios1 on 16/10/9.
//  Copyright © 2016年 albertjson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCHTTPError : NSError

//用于显示错误信息字段
@property (nonatomic,copy) NSString * message;

@end
