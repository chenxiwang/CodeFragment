//
//  NSObject+Swizzing.h
//  RunTimeDemo
//
//  Created by wcx on 2018/9/4.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface NSObject (Swizzing)
+ (void)methodSwizzlingWithOriginalSelector:(SEL)originalSelector
                         bySwizzledSelector:(SEL)swizzledSelector;
@end
