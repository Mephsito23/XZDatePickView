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
        
        [self creatSubViews];
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

- (void)creatSubViews{
    
    self.okBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 64, 40)];
    [self.okBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.okBtn.tag=Okbtn;
    [self addSubview:self.okBtn];
    [self.okBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.cancelBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 64, 40)];
    [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.cancelBtn.tag=CancelBtn;
    [self addSubview:self.cancelBtn];
    [self.cancelBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
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



@end
