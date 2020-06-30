//
//  HeadView.m
//  XZDatePickViewDemo
//
//  Created by mac on 17/5/3.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "HeadView.h"
#import "UIView+Extension.h"

@interface HeadView()

@property (nonatomic, strong)UIButton *okBtn;
@property (nonatomic, strong)UIButton *cancelBtn;

@end

@implementation HeadView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    if (self) {
        [self addSubview:self.okBtn];
        [self addSubview:self.cancelBtn];
    }
    return self;
}

- (instancetype)initWithDelegate:(id<HeadViewDelegate>)delegate{
    self=[super init];
    if (self) {
        self.delegate=delegate;
    }
    return self;
}

+ (instancetype)viewWithDelegate:(id<HeadViewDelegate>)delegate{
    return [[self alloc]initWithDelegate:delegate];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.okBtn.centerY=self.centerY;
    self.okBtn.right=self.right;
    self.cancelBtn.centerY=self.centerY;
}

- (void)btnClick:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(headViewBtnClick:)]) {
        [self.delegate headViewBtnClick:btn];
    }
}

// MARK:  懒加载
- (UIButton *)okBtn {
    if (_okBtn == nil) {
        UIButton* okBtn =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 64, 40)];
        [okBtn setTitle:@"确定" forState:UIControlStateNormal];
        [okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        okBtn.tag=Okbtn;
        [okBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _okBtn = okBtn;
    }
    return _okBtn;
}

- (UIButton *)cancelBtn {
    if(_cancelBtn == nil){
        UIButton * cancelBtn =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 64, 40)];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        cancelBtn.tag=CancelBtn;
        [cancelBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _cancelBtn = cancelBtn;
    }
    return _cancelBtn;
}




@end
