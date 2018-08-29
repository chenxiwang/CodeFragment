//
//  CustomViewOne.h
//  TextFieldText
//
//  Created by wcx on 2018/8/13.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomViewOne : UIView
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;


/**
 子类新建了自己的指定初始化方法，按照规则来讲，需要把父类的指定初始化方法降级成自己的便利初始化方法，以防止外面创建子类时使用的是父类的初始化方法，导致子类无法完成自己的初始化工作。
 BUT， 如果将父类的指定初始化方法用 NS_UNAVAILABLE 宏 在子类.h 文件中声明一下（也就是说限制外部使用父类的指定初始化方法创建子类对象），那么 即使不降级父类的指定初始化方法，编译器也没有警告

 @param frame <#frame description#>
 @param name <#name description#>
 @return <#return value description#>
 */
- (instancetype)initWithFrame:(CGRect )frame name:(NSString *)name NS_DESIGNATED_INITIALIZER;
@end
