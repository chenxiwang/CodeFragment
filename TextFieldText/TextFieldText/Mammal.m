//
//  Mammal.m
//  TextFieldText
//
//  Created by wcx on 2018/8/13.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Mammal.h"

@implementation Mammal

- (instancetype)initWithName:(NSString *)name andLegs:(NSInteger )numberOfLegs{
    NSLog(@"---4--- class:%@ method:%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    self = [super initWithName:name];
    if (self) {
        
        _numberOfLegs = numberOfLegs;
    }
    return self;
}


/**
 便利初始化方式不能直接调用父类的指定初始化方法，但可以调用本类的指定初始化方法或另一个便利初始化方法

 @param numberOfLegs <#numberOfLegs description#>
 @return <#return value description#>
 */
- (instancetype)initWithLegs:(NSInteger )numberOfLegs{
     NSLog(@"---5--- class:%@ method:%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    self = [self initWithName:@"Mammal"];
    if (self) {
        
        _numberOfLegs = numberOfLegs;
    }
    return self;
}


/**
 父类的指定初始化方法 自动成为子类的便利初始化方法

 @param name <#name description#>
 @return <#return value description#>
 */
- (instancetype)initWithName:(NSString *)name{
      NSLog(@"---6--- class:%@ method:%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    return [self initWithName:name andLegs:4];
}
@end
