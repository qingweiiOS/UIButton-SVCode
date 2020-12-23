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
#define UIColorFromHexWithAlpha(hexValue,a) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:a]
#define UIColorFromHex(hexValue)            UIColorFromHexWithAlpha(hexValue,1.0)
@interface UIButton (Code)

///设置倒计时
- (void)setCountdown:(NSTimeInterval )timeOut;

/**
 *
 * 设置倒计时和关键词  （例如 注册验证码 登录验证码）
 * 设置后 该页面销毁后，重进入时倒计时不会重新设为0
 */
- (void)setCountdown:(NSTimeInterval )timeOut keywords:(NSString *)keyWord;

/**
 * 需要手动调用检测方法 和setCountdown:keywords:配套使用
 */
- (void)checkCountdown:(NSString *)keyWord;

///手动结束倒计时 当前页面销毁之前，请务必调用
- (void)cancelCountdown;


@end
