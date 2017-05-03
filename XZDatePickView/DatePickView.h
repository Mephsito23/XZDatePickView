//
//  DatePickView.h
//  XZDatePickViewDemo
//
//  Created by mac on 17/5/3.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    DateStyleShowYearMonthDayHourMinute  = 0,
    DateStyleShowMonthDayHourMinute,
    DateStyleShowYearMonthDay,
    DateStyleShowMonthDay,
    DateStyleShowHourMinute
    
}XZDataStyle;

@interface DatePickView : UIPickerView

@property (nonatomic,assign)XZDataStyle datePickerStyle;

/**
 限制最大时间（没有设置默认2049）
 */
@property (nonatomic, retain) NSDate *maxLimitDate;

/**
 限制最小时间（没有设置默认1970）
 */
@property (nonatomic, retain) NSDate *minLimitDate;

/**
 设置默认显示时间
 */
@property (nonatomic, retain) NSDate *defaultShowDate;

- (NSDate *)getSelectDate;

@end
