//
//  Vehicle.h
//  UILayoutGuideDemo
//
//  Created by wcx on 2018/8/21.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import <Foundation/Foundation.h>
// 交通工具
@interface Vehicle : NSObject
@property (nonatomic, copy  ) NSString *name;
@end

@interface Vehicle(Usage)

- (void)theUsageOfThisVehicle;
@end

@interface Vehicle(Cost)

- (float)theCostOfThisVehicle;
@end
