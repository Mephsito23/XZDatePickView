# XZDatePickView

 简单的多风格时间选择器,支持的格式有 yyyy-MM-dd HH:mm ,yyyy-MM-dd,MM-dd HH:mm, MM-DD,HH-mm<br>

# 效果:
![](https://github.com/Mephsito23/XZDatePickView/blob/master/XZPickViewGif.gif)
 
# 导入:
支持cocoapods 导入,在Podfile中添加以下代码
 ```
 pod 'XZDatePickView'
```
# 使用方法:
 ## 导入头文件:<br>
 ```
 #import <XZDatePickView/XZDatePickView.h>
 ```
 ## 在需要弹出时间选择器的方法里面实现以下方法:
 ``` Objective-C
     XZDatePickView *datepicker=[[XZDatePickView alloc]initWithCurrentDate:[NSDate date] CompleteBlock:^(NSDate *startDate) {

                   NSLog(@"\n选择的时间： %@",startDate);
      }];

      datepicker.datePickerStyle = DateStyleShowYearMonthDay;
      datepicker.minLimitDate = [NSDate date:@"1980-2-28 12:22" WithFormat:@"yyyy-MM-dd HH:mm"];
      datepicker.maxLimitDate = [NSDate date];
      [datepicker show];
 ```
 ## 支持自定义头部视图:
 ### 创建时间选择器
 ``` Objective-C 
       
        CGRect headViewFrame=CGRectMake(0, 0, kScreenWidth, 40);
        
        XZDatePickView *datepicker=[[XZDatePickView alloc]initWithHeadView:self.headView headViewFrame:headViewFrame];
        
        datepicker.datePickerStyle = DateStyleShowYearMonthDayHourMinute;
        datepicker.minLimitDate = [NSDate date:@"1980-2-28 12:22" WithFormat:@"yyyy-MM-dd HH:mm"];
        datepicker.maxLimitDate = [NSDate date];
        [datepicker show];
        self.datepicker=datepicker;
        datepicker.maxLimitDate = [NSDate date];
 ```
 ### 创建头部视图
  ``` Objective-C 
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
```

  ### 通过提供的方法获取选择的时间
  ``` Objective-C 
    - (void)btnClick:(UIButton *)btn{
         if (btn.tag==53) {

             NSString * timeStr=[[self.datepicker getPickViewSelectDate] stringWithFormat:@"yyyy-MM-dd"];
             NSLog(@"\n开始时间： %@",timeStr);
         }
         [self.datepicker dismiss];
    }
  ```
 
