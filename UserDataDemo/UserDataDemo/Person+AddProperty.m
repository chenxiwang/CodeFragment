//
//  Person+AddProperty.m
//  UserDataDemo
//
//  Created by wcx on 2018/8/29.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Person+AddProperty.h"
#import <objc/runtime.h>
@implementation Person (AddProperty)
- (void)setAddress:(NSString *)address{
    //这里使用方法的指针地址作为唯一的key
    objc_setAssociatedObject(self, @selector(address), address, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)address{
    return  objc_getAssociatedObject(self, @selector(address));
}
- (void)setHeight:(NSInteger)height{
    objc_setAssociatedObject(self, @selector(height), @(height), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)height{
     return [objc_getAssociatedObject(self, @selector(height)) integerValue];
}

- (void)setRelativeP:(Person *)relativeP{
    objc_setAssociatedObject(self, @selector(relativeP), relativeP, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (Person *)relativeP{
    return objc_getAssociatedObject(self, @selector(relativeP));
}
@end
