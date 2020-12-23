//
//  ViewController.m
//  UIButton+SVCode
//
//  Created by 卿伟 on 2018/4/11.
//  Copyright © 2018年 卿伟. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+Code.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)action_sendCode:(UIButton *)sender {
    
    [sender setCountdown:10];
    [sender setCountdown:20 keywords:@"loginCode"];
}



@end
