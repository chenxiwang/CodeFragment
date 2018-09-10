//
//  Sark.h
//  RunTimeDemo
//
//  Created by wcx on 2018/8/31.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sark : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
- (void)speak;

- (void)logProperty;
@end
