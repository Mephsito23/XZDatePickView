//
//  ViewController.m
//  XZDatePickViewDemo
//
//  Created by mac on 17/4/27.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "ViewController.h"
#import "XZDatePickView.h"
#import "PickViewCommon.h"

@interface ViewController ()

@property (nonatomic, strong)UIView *headView;
@property (nonatomic, strong)XZDatePickView *datepicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame=CGRectMake(50, 50, 60, 60);
    btn.tag=15;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(creatPickView:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnTwo=[UIButton buttonWithType:UIButtonTypeContactAdd];
    btnTwo.tag=16;
    btnTwo.frame=CGRectMake(100, 50, 60, 60);
    [self.view addSubview:btnTwo];
    [btnTwo addTarget:self action:@selector(creatPickView:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)creatPickView:(UIButton *)btn{
    
    if (btn.tag==15) {
        
        XZDatePickView *datepicker=[[XZDatePickView alloc]initWithCurrentDate:[NSDate date] CompleteBlock:^(NSDate *startDate) {
            NSString * timeStr=[startDate stringWithFormat:@"yyyy-MM-dd"];
            NSLog(@"\n开始时间： %@",timeStr);
        }];
        datepicker.datePickerStyle = DateStyleShowMonthDayHourMinute;
        datepicker.minLimitDate = [NSDate date:@"1980-2-28 12:22" WithFormat:@"yyyy-MM-dd HH:mm"];
        datepicker.maxLimitDate = [NSDate date];
        [datepicker show];
        
    }else{
        
        CGRect headViewFrame=CGRectMake(0, 0, kScreenWidth, 40);
        
        XZDatePickView *datepicker=[[XZDatePickView alloc]initWithHeadView:self.headView headViewFrame:headViewFrame];
        datepicker.datePickerStyle = DateStyleShowYearMonthDayHourMinute;
        datepicker.minLimitDate = [NSDate date:@"1980-2-28 12:22" WithFormat:@"yyyy-MM-dd HH:mm"];
        datepicker.maxLimitDate = [NSDate date];
        [datepicker show];
        self.datepicker=datepicker;
    }
    
    
}

- (void)btnClick:(UIButton *)btn{
    
    if (btn.tag==53) {
        
        NSString * timeStr=[[self.datepicker getPickViewSelectDate] stringWithFormat:@"yyyy-MM-dd"];
        NSLog(@"\n开始时间： %@",timeStr);
    }
    [self.datepicker dismiss];
    
}

- (UIView *)headView{
    if (_headView==nil) {
        
        CGRect headViewFrame=CGRectMake(0, 0, kScreenWidth, 40);
        _headView=[[UIView alloc]initWithFrame:headViewFrame];
        
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(5, 0, 60, 44)];
        [btn setTitle:@"按钮1" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_headView addSubview:btn];
        btn.tag=51;
        btn.centerY=_headView.centerY;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btnTwo=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 44)];
        [_headView addSubview:btnTwo];
        [btnTwo setTitle:@"按钮2" forState:UIControlStateNormal];
        [btnTwo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btnTwo.centerX=self.view.centerX;
        btnTwo.tag=52;
        btnTwo.centerY=_headView.centerY;
        [btnTwo addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btnThree=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 44)];
        [_headView addSubview:btnThree];
        [btnThree setTitle:@"完成" forState:UIControlStateNormal];
        [btnThree setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btnThree.right=kScreenWidth-15;
        btnThree.tag=53;
        btnThree.centerY=_headView.centerY;
        [btnThree addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 2)];
        line.backgroundColor=ColorLine;
        line.bottom=_headView.bottom;
        [_headView addSubview:line];
        
        
    }
    return _headView;
}


@end
