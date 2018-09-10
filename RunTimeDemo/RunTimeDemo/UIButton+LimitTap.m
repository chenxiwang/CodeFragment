//
//  UIButton+LimitTap.m
//  RunTimeDemo
//
//  Created by wcx on 2018/8/31.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "UIButton+LimitTap.h"
#import <objc/runtime.h>
@implementation UIButton (LimitTap)

- (void)setAcceptEventInterval:(NSInteger)acceptEventInterval{
    objc_setAssociatedObject(self, @selector(acceptEventInterval), @(acceptEventInterval), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger )acceptEventInterval{
    return [objc_getAssociatedObject(self, @selector(acceptEventInterval)) integerValue];
}

- (void)setIgnoreEvent:(BOOL)ignoreEvent{
    objc_setAssociatedObject(self, @selector(ignoreEvent), @(ignoreEvent), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)ignoreEvent{
    return [objc_getAssociatedObject(self, @selector(ignoreEvent)) boolValue];
}

+(void)load{
    
    Method originalMethod = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method swizzledMethod = class_getInstanceMethod(self, @selector(swizzled_sendAction:to:forEvent:));
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
    
    
}

- (void)swizzled_sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event{
    
    if (self.ignoreEvent) {
        return;
    }
    
    if (self.acceptEventInterval>0) {
        self.ignoreEvent = YES;
        
        [self performSelector:@selector(donext) withObject:nil afterDelay:self.acceptEventInterval];
    }
}

- (void)donext{
    self.ignoreEvent = NO;
}

@end
