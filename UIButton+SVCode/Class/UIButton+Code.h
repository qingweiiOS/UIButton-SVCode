//
//  UIButton+Code.h
//  UIButton+SVCode
//
//  Created by Mr_qing on 2017/7/16.
//  Copyright © 2017年 jonh. All rights reserved.
//

#import <UIKit/UIKit.h>
#define COUNTDOWNTITLE @"重新获取"
#define GETCODETITLE @"获取验证码"
@interface UIButton (Code)
///设置倒计时
- (void)setCountdown:(NSTimeInterval )timeOut;
///手动结束倒计时 离开页面之前 请务必调用
- (void)cancelCountdown;

@end
