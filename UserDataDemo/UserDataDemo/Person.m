//
//  Person.m
//  UserDataDemo
//
//  Created by wcx on 2018/8/27.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age forKey:@"age"];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntegerForKey:@"age"];
    }
    return self;
}
- (NSString *)description{
    return [NSString stringWithFormat:@"name:%@--age:%ld",self.name,(long)self.age];
}
@end
