
//
//  Son.m
//  LoadDemo
//
//  Created by wcx on 2018/8/28.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Son.h"

@implementation Son

- (void)play:(NSString *)str{
    NSLog(@"老子偷偷的玩:%@",str);
}

- (void)study:(NSString *)language with:(NSString *)name{
    NSLog(@"老子和%@ 一起学习%@",name,language);
}
@end
