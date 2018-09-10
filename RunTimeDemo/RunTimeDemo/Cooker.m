//
//  Cooker.m
//  RunTimeDemo
//
//  Created by wcx on 2018/9/7.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Cooker.h"

@implementation Cooker
- (void)cook{
    NSLog(@"i am a cooker,i make food! instanceMethod");
}

+ (void)cook{
    NSLog(@"i am a cooker,i make food! classMehtod");
}
@end
