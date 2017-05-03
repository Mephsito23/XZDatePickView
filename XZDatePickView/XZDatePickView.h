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
#import "DatePickView.h"

@interface XZDatePickView : UIView

/**时间选择的样式*/
@property (nonatomic,assign)XZDataStyle datePickerStyle;

@property (nonatomic,strong)UIColor *themeColor;

/**限制最大时间（没有设置默认2049）*/
@property (nonatomic, retain) NSDate *maxLimitDate;

/**限制最小时间（没有设置默认1970）*/
@property (nonatomic, retain) NSDate *minLimitDate;

/**设置默认显示时间*/
@property (nonatomic, retain) NSDate *defaultShowDate;


/**
 自定义头标题

 @param headView      传入的头视图
 @param headViewFrame 传入的头试图 frame

 @return 返回的时间选择器
 */
- (instancetype)initWithHeadView:(UIView *)headView
                   headViewFrame:(CGRect)headViewFrame;

-(instancetype)initWithCompleteBlock:(void(^)(NSDate *))completeBlock;

/**
 *   设置打开选择器时的默认时间，
 *   minLimitDate < currentDate < maxLimitDate  显示 currentDate;
 *   currentDate < minLimitDate ||  currentDate > maxLimitDate   显示minLimitDate;
 */
-(instancetype)initWithCurrentDate:(NSDate *)currentDate CompleteBlock:(void(^)(NSDate *))completeBlock;

-(void)show;
-(void)dismiss;

/**获取选中的时间*/
- (NSDate *)getPickViewSelectDate;


@end
