//
//  NSArray+CrashHandle.m
//  RunTimeDemo
//
//  Created by wcx on 2018/8/31.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "NSArray+CrashHandle.h"
#import <objc/runtime.h>
@implementation NSArray (CrashHandle)

+(void)load{
    
    Method originalMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
    Method swizzledMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(cx_objectAtIndex:));
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

-(id)cx_objectAtIndex:(NSUInteger)index{
    
    if (self.count -1 < index) {
        @try {
            return [self cx_objectAtIndex:index];
        } @catch (NSException *exception) {
            // 在崩溃后会打印崩溃信息。如果是线上，可以在这里将崩溃信息发送到服务器
            NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
            NSLog(@"%@", [exception callStackSymbols]);
            return nil;
            
        } @finally {}
    }else{
      return [self cx_objectAtIndex:index];
    }
}
@end
