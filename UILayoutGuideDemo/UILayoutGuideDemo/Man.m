//
//  Man.m
//  UILayoutGuideDemo
//
//  Created by wcx on 2018/8/21.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Man.h"
#import "People+PrivateMethod.h"
@implementation Man

- (instancetype)init{
    self = [super init];
    if (self) {
        self.name = @"liLei";
        self.age = 18;
        self.sex = NO;
    }
    return self;
}
- (void)sayHello{
    [super sayHello];
    
    NSLog(@"man say hello");
}

- (void)eatSomeThing{
    [super eatSomeThing];
    
     NSLog(@"man eatSomeThing");
    
    
}
@end
