//
//  HeadView.h
//  XZDatePickViewDemo
//
//  Created by mac on 17/5/3.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, BtnType) {
    Okbtn = 125,
    CancelBtn
};

@protocol HeadViewDelegate <NSObject>
@optional

- (void)headViewBtnClick:(UIButton *)btn;

@end

@interface HeadView : UIView

@property(nonatomic,weak)id<HeadViewDelegate>delegate;

+ (instancetype)viewWithDelegate:(id<HeadViewDelegate>)delegate;
- (instancetype)initWithDelegate:(id<HeadViewDelegate>)delegate;


@end
