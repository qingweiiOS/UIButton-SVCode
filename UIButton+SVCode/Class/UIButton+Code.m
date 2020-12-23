//
//  UIButton+Code.m
//  UIButton+SVCode
//
//  Created by Mr_qing on 2017/7/16.
//  Copyright © 2017年 jonh. All rights reserved.
//

#import "UIButton+Code.h"

static dispatch_source_t _timer;
@implementation UIButton (Code)

- (void)setCountdown:(NSTimeInterval )timeOut{
    if(timeOut<=0)
    {
        return;
    }
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    //每秒执行
    //得到当前时间
    NSTimeInterval startTime = time(NULL);
    NSTimeInterval endTime = startTime + timeOut;

    dispatch_source_set_event_handler(_timer, ^{
        NSTimeInterval curtime = time(NULL);
        if(curtime>=endTime){ //倒计时结束，关闭
            [self cancelCountdown];
        }else{
            int seconds = endTime-curtime;
            NSString *strTime = [NSString stringWithFormat:@"%d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:[NSString stringWithFormat:@"重新发送(%@)",strTime] forState:UIControlStateNormal];
                self.enabled = NO;
                self.backgroundColor = UIColorFromHex(0xcccccc);
            });
            
        }
    });
    dispatch_resume(_timer);
    
}
- (void)setCountdown:(NSTimeInterval )timeOut keywords:(NSString *)keyWord{
    [self setCountdown:timeOut];
    NSTimeInterval endTime = time(NULL)+timeOut;
    /// 纪录倒计时
    NSString *endStr = [NSString stringWithFormat:@"%.0f",endTime];
    [[NSUserDefaults standardUserDefaults] setObject:endStr forKey:[NSString stringWithFormat:@"%@_code",keyWord]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (void)checkCountdown:(NSString *)keyWord{
    if(keyWord.length == 0){
        return;
    }
    NSTimeInterval key_timeOut = 0.0;
    NSTimeInterval  startTime = time(NULL);
    NSString  *endTimeStr = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@_code",keyWord]];
    NSInteger endTime = [endTimeStr integerValue];
    NSInteger djs_time = endTime - startTime;
    if(djs_time>0)
    {
        key_timeOut = djs_time;
        [self setCountdown:key_timeOut];
    }else{
        NSLog(@"%@ -- 没有正在倒计时",keyWord);
    }
    
   
}
- (void)cancelCountdown
{
    
    if(_timer)
    {
        dispatch_source_cancel(_timer);
        dispatch_async(dispatch_get_main_queue(), ^{
            //设置界面的按钮显示 根据自己需求设置（倒计时结束后调用）
            [self setTitle:@"获取验证码" forState:UIControlStateNormal];
             self.enabled = YES;
            self.backgroundColor = UIColorFromHex(0x33C0A2);

        });
    }
}
@end
