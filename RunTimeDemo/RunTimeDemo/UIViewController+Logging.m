//
//  UIViewController+Logging.m
//  RunTimeDemo
//
//  Created by wcx on 2018/8/31.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "UIViewController+Logging.h"
#import <objc/runtime.h>
@implementation UIViewController (Logging)
+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzleMethod([self class], @selector(viewDidAppear:), @selector(swizzled_viewDidAppear:));
    });
   
}

- (void)swizzled_viewDidAppear:(BOOL )animated{
    // call original implementation
    [self swizzled_viewDidAppear:animated];
    
    NSLog(@"%@ ",NSStringFromClass([self class]));
}

void swizzleMethod(Class class,SEL originalSelector,SEL swizzledSelector){
    
    // the method might not exist in the class, but in its superclass
    Method originalMehtod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
     // class_addMethod will fail if original method already exists
    BOOL addMethod =class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
     // the method doesn’t exist and we just added one
    if (addMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMehtod), method_getTypeEncoding(originalMehtod));
    }else{
        method_exchangeImplementations(originalMehtod, swizzledMethod);
    }
}
@end
