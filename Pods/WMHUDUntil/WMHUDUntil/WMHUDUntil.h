//
//  WMHUDUntil.h
//  WMHUDUntil
//
//  Created by choice-ios1 on 16/8/15.
//  Copyright © 2016年 choice-ios1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

//统一的控制是否显示动画的变量，默认YES
extern BOOL HUDAnimated;


/**
 *  @author ZICHU, 16-08-15 18:08:22
 *
 * ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
 *
 * Helpless ！！！ I edit MBDefaultPadding is 15.f in MBProgressHUD
 */
@interface WMHUDUntil : NSObject

#pragma -mark show hudView

// show white loading circle🔆
+ (MBProgressHUD*)showWhiteLoadingToView:(UIView*)view;

// show gray loading circle🔆
+ (MBProgressHUD*)showGrayLoadingToView:(UIView*)view;

// show white loading && message🔆🔠
+ (MBProgressHUD*)showWhiteLoadingWithMessage:(NSString*)message toView:(UIView*)view;

// show gray loading && message🔆🔠
+ (MBProgressHUD*)showGaryLoadingWithMessage:(NSString*)message toView:(UIView*)view;

// hide Indicator🚫
+ (BOOL)hideHUDForView:(UIView *)view;

#pragma -mark show hudView and hide

// show message and hide after delay timeInterval
+ (MBProgressHUD*)showMessage:(NSString*)message toView:(UIView*)view;

// show 🔠 to window and after delay timeInterval
+ (MBProgressHUD*)showMessageToWindow:(NSString*)message;

// show ⚠️ and hide after delay timeInterval
+ (MBProgressHUD*)showWarningWithMessage:(NSString*)message toView:(UIView*)view;

// show ✅ and hide after delay timeInterval
+ (MBProgressHUD*)showSuccessWithMessage:(NSString*)message toView:(UIView*)view;

// show ❎ and hide after delay timeInterval
+ (MBProgressHUD*)showFailWithMessage:(NSString*)message toView:(UIView*)view;

@end
