//
//  Mammal.h
//  TextFieldText
//
//  Created by wcx on 2018/8/13.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Animal.h"

@interface Mammal : Animal{
    NSInteger _numberOfLegs;
}

- (instancetype)initWithName:(NSString *)name andLegs:(NSInteger )numberOfLegs NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithLegs:(NSInteger )numberOfLegs;
@end
