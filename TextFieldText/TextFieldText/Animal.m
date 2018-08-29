//
//  Animal.m
//  TextFieldText
//
//  Created by wcx on 2018/8/13.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Animal.h"

@implementation Animal


/**
 1 是 NSObject 的init方法

 @param name <#name description#>
 @return <#return value description#>
 */
- (instancetype)initWithName:(NSString *)name{
    NSLog(@"---2--- class:%@ method:%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    self = [super init];
    if (self) {
        _name = name;
      
    }
    return self;
}

- (instancetype)init{
    NSLog(@"---3--- class:%@ method:%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    return [self initWithName:@"Animal"];
    
}
@end
