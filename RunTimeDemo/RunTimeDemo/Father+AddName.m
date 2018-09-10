//
//  Father+AddName.m
//  RunTimeDemo
//
//  Created by wcx on 2018/8/31.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Father+AddName.h"
#import <objc/runtime.h>
@implementation Father (AddName)

- (void)setName:(NSString *)name{
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name{
    return objc_getAssociatedObject(self, @selector(name));
}
@end
