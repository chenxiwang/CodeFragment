//
//  Person.m
//  LoadDemo
//
//  Created by wcx on 2018/8/28.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Person.h"

@implementation Person
+(void)load{
    NSLog(@"person load overwrite");
}

+ (void)initialize{
    
    NSLog(@"Person initialize called");
}
@end
