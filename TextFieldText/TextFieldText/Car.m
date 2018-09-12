//
//  Car.m
//  TextFieldText
//
//  Created by wcx on 2018/9/12.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Car.h"

@implementation Car
- (instancetype)init{
    self =  [super init];
    if (self) {
       // NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
         NSLog(@"Car 类 init 方法 调用了");
        [self play];
    }
    return self;
}

- (void)sayMyName{
    NSLog(@"i am Car");
}

- (void)play{
    NSLog(@"driving is fun");
}
@end
