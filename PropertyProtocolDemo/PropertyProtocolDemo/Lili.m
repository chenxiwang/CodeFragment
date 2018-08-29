//
//  Lili.m
//  PropertyProtocolDemo
//
//  Created by wcx on 2018/8/22.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Lili.h"

@implementation Lili
- (void)wannaMarryARichMan:(id<BeingOneRichGuyProtocol>)man{
    
    float money = [man makeMoney];
    NSLog(@"man get a car:%@ get a house:%@, save money:%ld, make money:%f",man.car,man.house,(long)man.money,money);
    [man spendMoney];
    
}
@end
