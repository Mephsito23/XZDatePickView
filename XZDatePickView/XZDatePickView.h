//
//  XZDatePickView.h
//  TeYouDian
//
//  Created by mac on 17/4/25.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSDate+Extension.h"
#import "UIView+Extension.h"

typedef enum{
    DateStyleShowYearMonthDayHourMinute  = 0,
    DateStyleShowMonthDayHourMinute,
    DateStyleShowYearMonthDay,
    DateStyleShowMonthDay,
    DateStyleShowHourMinute
    
}XZDataStyle;

@interface XZDatePickView : UIView

@property (nonatomic,assign)XZDataStyle datePickerStyle;

@property (nonatomic,strong)UIColor *themeColor;

@property (nonatomic, retain) NSDate *maxLimitDate;//限制最大时间（没有设置默认2049）
@property (nonatomic, retain) NSDate *minLimitDate;//限制最小时间（没有设置默认1970）
@property (nonatomic, retain) NSDate *defaultShowDate;//设置默认显示时间

-(instancetype)initWithCompleteBlock:(void(^)(NSDate *))completeBlock;

/**
 *   设置打开选择器时的默认时间，
 *   minLimitDate < currentDate < maxLimitDate  显示 currentDate;
 *   currentDate < minLimitDate ||  currentDate > maxLimitDate   显示minLimitDate;
 */
-(instancetype)initWithCurrentDate:(NSDate *)currentDate CompleteBlock:(void(^)(NSDate *))completeBlock;

-(void)show;


@end
