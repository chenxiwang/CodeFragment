//
//  BMW.m
//  TextFieldText
//
//  Created by wcx on 2018/9/12.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "BMW.h"

@implementation BMW
- (instancetype)init{
    self =  [super init];
    if (self) {
        //NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
        NSLog(@"BMW 类 init 方法 调用了");
        [self sayMyName];
    }
    return self;
}

- (void)sayMyName{
    NSLog(@"i am BMW");
}

@end
