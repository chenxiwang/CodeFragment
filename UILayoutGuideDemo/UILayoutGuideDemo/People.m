//
//  People.m
//  UILayoutGuideDemo
//
//  Created by wcx on 2018/8/21.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "People.h"
#import "People+PrivateMethod.h"
@implementation People
- (instancetype)init{
    self = [super init];
    if (self) {
        self.name = @"people";
        self.age = 100;
        self.sex = YES;
        [self sayHello];
        [self eatSomeThing];
    }
    return self;
}

- (void)sayHello{
    
   NSLog(@"People say hello");
}


- (void)eatSomeThing{
    NSLog(@"People eat lunch");
}
@end
