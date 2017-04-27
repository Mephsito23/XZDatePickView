//
//  ViewController.m
//  XZDatePickViewDemo
//
//  Created by mac on 17/4/27.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "ViewController.h"
#import "XZDatePickView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame=CGRectMake(50, 50, 60, 60);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(creatPickView) forControlEvents:UIControlEventTouchUpInside];
}

- (void)creatPickView{
    XZDatePickView *datepicker=[[XZDatePickView alloc]initWithCurrentDate:[NSDate date] CompleteBlock:^(NSDate *startDate) {
        
        NSString * timeStr=[startDate stringWithFormat:@"yyyy-MM-dd"];
        NSLog(@"\n开始时间： %@",timeStr);
    }];
    
    datepicker.datePickerStyle = DateStyleShowYearMonthDay;
    datepicker.minLimitDate = [NSDate date:@"1980-2-28 12:22" WithFormat:@"yyyy-MM-dd HH:mm"];
    datepicker.maxLimitDate = [NSDate date];
    [datepicker show];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
