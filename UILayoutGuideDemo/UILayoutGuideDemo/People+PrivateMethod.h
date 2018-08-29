//
//  People+PrivateMethod.h
//  UILayoutGuideDemo
//
//  Created by wcx on 2018/8/21.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "People.h"

/**
 隐藏私有方法，同时让子类可以继承、重写 私有方法
 也可以让分类使用私有的属性，方法
 */
@interface People ()
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy  ) NSString *name;
@property (nonatomic, assign) BOOL sex;
- (void)sayHello;
- (void)eatSomeThing;
@end
