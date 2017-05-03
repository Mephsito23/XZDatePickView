//
//  XZDatePickView.m
//  TeYouDian
//
//  Created by mac on 17/4/25.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "XZDatePickView.h"
#import "PickViewCommon.h"
#import "HeadView.h"


typedef void(^doneBlock)(NSDate *);

@interface XZDatePickView()<UIGestureRecognizerDelegate,
                            HeadViewDelegate>

@property (nonatomic, strong)UIView *contentV;

@property (nonatomic, strong)HeadView *titleV;

@property (nonatomic, strong)DatePickView *datePicker;

@property (nonatomic,strong)doneBlock doneBlock;

@end

@implementation XZDatePickView

static const CGFloat PopViewHeight = 250;

-(instancetype)initWithCompleteBlock:(void(^)(NSDate *))completeBlock {
    return [self initWithCurrentDate:nil CompleteBlock:completeBlock];
}

- (instancetype)initWithHeadView:(UIView *)headView
                   headViewFrame:(CGRect)headViewFrame{
    self = [super initWithFrame:kScreenBound];
    if (self) {
        
        [self creatSubViews];
        [self.titleV removeFromSuperview];
        [self.contentV addSubview:headView];
        headView.frame=headViewFrame;
        self.datePicker.frame=CGRectMake(0, 44, kScreenWidth, PopViewHeight-headViewFrame.size.height);
        self.datePicker.top=headView.bottom;
        
    }
    return self;
    
}

-(instancetype)initWithCurrentDate:(NSDate *)currentDate CompleteBlock:(void (^)(NSDate *))completeBlock {
    self = [super initWithFrame:kScreenBound];
    if (self) {
        
        
        [self creatSubViews];
        
        self.defaultShowDate=currentDate;
        
        if (completeBlock) {
            self.doneBlock = ^(NSDate *startDate) {
                completeBlock(startDate);
            };
        }
    }
    return self;
}

- (void)creatSubViews{
    
    self.themeColor = RGB(247, 133, 51);
    
    [self addSubview:self.contentV];
    [self.contentV addSubview:self.titleV];
    [self.contentV addSubview:self.datePicker];
    
    //点击背景是否影藏
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
    
    self.backgroundColor = RGBA(0, 0, 0, 0);
    [self layoutIfNeeded];
    
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:self];
    
    [self layoutPageSubViews];
    
}

- (void)layoutPageSubViews{
    
    self.contentV.frame=CGRectMake(0, kScreenHeight-PopViewHeight, kScreenWidth, PopViewHeight);
    
    self.titleV.frame=CGRectMake(0, 0, kScreenWidth, 44);
    
    self.datePicker.frame=CGRectMake(0, 44, kScreenWidth, self.contentV.height-self.titleV.height);
    self.datePicker.datePickerStyle=self.datePickerStyle;
}

#pragma mark  - action
-(void)show {
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:.3 animations:^{
        
        self.backgroundColor = RGBA(0, 0, 0, 0.4);
    }];
}
-(void)dismiss {
    [UIView animateWithDuration:.3 animations:^{
       
        self.backgroundColor = RGBA(0, 0, 0, 0);
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self removeFromSuperview];
    }];
}

- (void)headViewBtnClick:(UIButton *)btn{
    
    if (btn.tag==Okbtn) self.doneBlock([self.datePicker getSelectDate]);
    
    [self dismiss];
}

- (NSDate *)getPickViewSelectDate{
    return [self.datePicker getSelectDate];
}

#pragma mark  - getter and setter

- (UIView *)contentV{
    if (_contentV==nil) {
        _contentV=[UIView new];
        _contentV.backgroundColor=[UIColor whiteColor];
    }
    return _contentV;
}

- (HeadView *)titleV{
    if (_titleV==nil) {
        
        _titleV=[HeadView viewWithDelegate:self];
        _titleV.backgroundColor=ColorMain;
        
    }
    return _titleV;
}

- (DatePickView *)datePicker{
    if (_datePicker==nil) {
        _datePicker=[[DatePickView alloc]init];
    }
    return _datePicker;
}

-(void)setMinLimitDate:(NSDate *)minLimitDate {
    _minLimitDate = minLimitDate;
    self.datePicker.minLimitDate=self.minLimitDate;

}

-(void)setMaxLimitDate:(NSDate *)maxLimitDate {
    _maxLimitDate = maxLimitDate;
    self.datePicker.maxLimitDate=self.maxLimitDate;

}

- (void)setDefaultShowDate:(NSDate *)defaultShowDate{
    _defaultShowDate=defaultShowDate;
    self.datePicker.defaultShowDate=self.defaultShowDate;

}

- (void)setDatePickerStyle:(XZDataStyle)datePickerStyle{
    _datePickerStyle=datePickerStyle;
    self.datePicker.datePickerStyle=datePickerStyle;
    
}

@end
