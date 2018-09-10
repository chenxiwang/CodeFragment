//
//  Father.m
//  RunTimeDemo
//
//  Created by wcx on 2018/8/30.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Father.h"
#import "Father+AddName.h"
#import <objc/runtime.h>
#import "Swimmer.h"
#import "Cooker.h"
#import "Walker.h"
@implementation Father

void eat(id self,SEL sel){
    NSLog(@"转发啦 %@ %@",self,NSStringFromSelector(sel));
}

- (NSString*)description{
    
    return [NSString stringWithFormat:@"i am %@",self.name];
}


/**
 消息转发步骤一 动态方法解析 如果未处理，则跳到步骤二

 @param sel <#sel description#>
 @return <#return value description#>
 */
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == NSSelectorFromString(@"eat")) {
        class_addMethod(self, sel, (IMP)eat, "v@:");
        return YES;
    }
    return [super resolveClassMethod:sel];
}


/**
 消息转发步骤二 备用接收者

 @param aSelector <#aSelector description#>
 @return <#return value description#>
 */
- (id)forwardingTargetForSelector:(SEL)aSelector{
    NSString *methodString = NSStringFromSelector(aSelector);
    if ([methodString isEqualToString:@"swim"]) {
       // return [[Swimmer alloc] init]; // 转到实例方法
        return [Swimmer class]; // 转到类方法
    }
   return [super forwardingTargetForSelector:aSelector];
}

/**
 消息转发步骤三 完整消息转发 对象方法

 @param aSelector <#aSelector description#>
 @return <#return value description#>
 */
- (NSMethodSignature*)methodSignatureForSelector:(SEL)aSelector{
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        if ([Cooker instancesRespondToSelector:aSelector]) {
            signature = [Cooker instanceMethodSignatureForSelector:aSelector];
        }
        if ([Walker instancesRespondToSelector:aSelector]) {
            signature = [Walker instanceMethodSignatureForSelector:aSelector];
        }
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    if ([Cooker instancesRespondToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:[Cooker new]];
    }
    
    if ([Walker instancesRespondToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:[Walker class]];
    }
}






- (instancetype)init{
    self = [super init];
    if (self) {
        unsigned int count =0;
        Ivar *ivarList = class_copyIvarList([self class], &count);
        for (unsigned int i = 0; i<count; i++) {
            Ivar myIvar = ivarList[i];
            const char *ivarName = ivar_getName(myIvar);
            NSLog(@"Ivar---->%@", [NSString stringWithUTF8String:ivarName]);
        }
        free(ivarList);
       
    }
    return self;
}
@end
