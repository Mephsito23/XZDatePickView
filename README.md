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
 ### 创建时间选择器(具体代码见demo)
 ``` Objective-C 
       
        CGRect headViewFrame=CGRectMake(0, 0, kScreenWidth, 40);
        
        XZDatePickView *datepicker=[[XZDatePickView alloc]initWithHeadView:self.headView headViewFrame:headViewFrame];
        
        datepicker.datePickerStyle = DateStyleShowYearMonthDayHourMinute;
        datepicker.minLimitDate = [NSDate date:@"1980-2-28 12:22" WithFormat:@"yyyy-MM-dd HH:mm"];
        datepicker.maxLimitDate = [NSDate date];
        self.datepicker=datepicker;
        [datepicker show];
 ```
 
 
