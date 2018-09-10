//
//  Walker.m
//  RunTimeDemo
//
//  Created by wcx on 2018/9/7.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Walker.h"

@implementation Walker
- (void)walk{
    NSLog(@"i am walking instanceMethod");
}

+ (void)walk{
     NSLog(@"i am walking classMethod");
}
@end
