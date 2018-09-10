//
//  Sark.m
//  RunTimeDemo
//
//  Created by wcx on 2018/8/31.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Sark.h"
#import <objc/runtime.h>
@interface Sark(){
    NSInteger _height;
}
@property (nonatomic, copy  ) NSString *address;
@end
@implementation Sark
- (void)speak
{
    unsigned int numberOfIvars = 0;
    Ivar *ivars = class_copyIvarList([self class], &numberOfIvars);
    for(const Ivar *p = ivars; p < ivars+numberOfIvars; p++) {
        Ivar const ivar = *p;
        ptrdiff_t offset = ivar_getOffset(ivar);
        const char *name = ivar_getName(ivar);
        NSLog(@"Sark ivar name = %s, offset = %td", name, offset);
    }
//    NSLog(@"my name is %p", &_name);
//    NSLog(@"my name is %@", *(&_name));
}

- (void)logProperty{
     unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i=0; i<count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"property---->%@", [NSString stringWithUTF8String:propertyName]);
    }
    
}
@end
