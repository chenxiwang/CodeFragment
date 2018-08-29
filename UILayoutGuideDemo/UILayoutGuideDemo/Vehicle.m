//
//  Vehicle.m
//  UILayoutGuideDemo
//
//  Created by wcx on 2018/8/21.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Vehicle.h"

@implementation Vehicle
- (instancetype)init{
    self = [super init];
    if (self) {
        self.name = @"Vehicle";
    }
    return self;
}
@end

@implementation Vehicle(Usage)
- (void)theUsageOfThisVehicle{
    NSLog(@"no nothing");
}
@end

@implementation Vehicle(Cost)
- (float)theCostOfThisVehicle{
    return 0;
}
@end
