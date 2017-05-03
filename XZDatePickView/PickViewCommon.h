//
//  PickViewCommon.h
//  XZDatePickViewDemo
//
//  Created by mac on 17/5/3.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#ifndef PickViewCommon_h
#define PickViewCommon_h

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenBound [UIScreen mainScreen].bounds
#define kPickerSize self.datePicker.frame.size
#define RGBA(r, g, b, a) ([UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a])
#define RGB(r, g, b) RGBA(r,g,b,1)
#define ColorMain RGB(250, 197, 50)
#define ColorLine RGB(236, 236, 236)


#define MAXYEAR 2050
#define MINYEAR 1970


#endif /* PickViewCommon_h */
