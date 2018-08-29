//
//  People.m
//  TextFieldText
//
//  Created by wcx on 2018/8/14.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "People.h"

@implementation People

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initalize];
    }
    return self;
}

- (void)initalize{
    NSLog(@"people initalize");
}
@end
