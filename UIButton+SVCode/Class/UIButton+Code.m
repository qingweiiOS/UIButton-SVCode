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
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    //每秒执行
    //得到当前时间
    NSTimeInterval startTime = time(NULL);
    NSTimeInterval endTime = startTime + timeOut;
    self.backgroundColor = [UIColor grayColor];
    dispatch_source_set_event_handler(_timer, ^{
        NSTimeInterval curtime = time(NULL);
        if(curtime>=endTime){ //倒计时结束，关闭
            [self cancelCountdown];
            
        }else{
            
            int seconds = endTime-curtime;
            NSLog(@"--%d",seconds);
            NSString *strTime = [NSString stringWithFormat:@"%d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:[NSString stringWithFormat:@"%@(%@)",COUNTDOWNTITLE,strTime] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
                
            });
            
        }
    });
    dispatch_resume(_timer);
    
}
- (void)cancelCountdown
{
    if(_timer)
    {
        
        dispatch_source_cancel(_timer);
        dispatch_async(dispatch_get_main_queue(), ^{
            //设置界面的按钮显示 根据自己需求设置（倒计时结束后调用）
             [self setTitle:GETCODETITLE forState:UIControlStateNormal];
             self.userInteractionEnabled = YES;
            
        });
    }
}

@end
