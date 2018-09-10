//
//  UIButton+LimitTap.h
//  RunTimeDemo
//
//  Created by wcx on 2018/8/31.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import <UIKit/UIKit.h>
/// 防止 button 多次点击
@interface UIButton (LimitTap)
@property (nonatomic, assign) NSInteger acceptEventInterval;
@property (nonatomic, assign) BOOL ignoreEvent;
@end
