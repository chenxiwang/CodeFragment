//
//  Whale.m
//  TextFieldText
//
//  Created by wcx on 2018/8/13.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Whale.h"

@implementation Whale
-(instancetype)initWale{
    NSLog(@"---7--- class:%@ method:%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    self = [super initWithName:@"Whale" andLegs:0];
    if (self) {
        
        _canSwim = YES;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name andLegs:(NSInteger)numberOfLegs{
    NSLog(@"---8--- class:%@ method:%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    return [self initWale];
}

- (NSString *)description{
    return [NSString stringWithFormat:@"Name:%@,Numberof Legs: %zd, canSwim: %@",_name,_numberOfLegs,_canSwim ? @YES:@NO];
}
@end
