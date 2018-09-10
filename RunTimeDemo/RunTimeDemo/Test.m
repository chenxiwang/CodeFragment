//
//  Test.m
//  RunTimeDemo
//
//  Created by wcx on 2018/8/31.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Test.h"
#import <objc/runtime.h>
#import "Sark.h"
@implementation Test

- (instancetype)init{
    self =[super init];
    if (self) {
        unsigned int count;
        //获取属性列表
        objc_property_t *propertyList = class_copyPropertyList([self class], &count);
        for (unsigned int i=0; i<count; i++)
        { const char *propertyName = property_getName(propertyList[i]);
            NSLog(@"property---->%@", [NSString stringWithUTF8String:propertyName]);
            
        }
        //获取方法列表
        Method *methodList = class_copyMethodList([self class], &count);
        for (unsigned int i =0; i<count; i++)
        { Method method = methodList[i];
            NSLog(@"method---->%@", NSStringFromSelector(method_getName(method)));
            
        }
        //获取成员变量列表
        Ivar *ivarList = class_copyIvarList([self class], &count);
        for (unsigned int i =0; i<count; i++)
        { Ivar myIvar = ivarList[i]; const char *ivarName = ivar_getName(myIvar); NSLog(@"Ivar---->%@", [NSString stringWithUTF8String:ivarName]); }
        //获取协议列表
        __unsafe_unretained Protocol **protocolList = class_copyProtocolList([self class], &count);
        for (unsigned int i =0; i < count; i++) {
            Protocol *myProtocal = protocolList[i];
            const char *protocolName = protocol_getName(myProtocal);
            NSLog(@"protocol---->%@", [NSString stringWithUTF8String:protocolName]);
        }
        
        // void* 和 id 的转换
        id obj = [[NSObject alloc] init];
        
        void *p = (__bridge void *)obj;
        
        id o = (__bridge id)p;
    }
    return self;
}
@end
