//
//  Daniel.m
//  PropertyProtocolDemo
//
//  Created by wcx on 2018/8/22.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Daniel.h"

@implementation Daniel

@synthesize car,house,money;


- (float)makeMoney {
    return 10000;
}

- (void)spendMoney {
    NSLog(@"就爱花钱");
}


@end
