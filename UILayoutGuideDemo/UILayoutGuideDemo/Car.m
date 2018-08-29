//
//  Car.m
//  UILayoutGuideDemo
//
//  Created by wcx on 2018/8/21.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Car.h"

@implementation Car
- (instancetype)init{
    self = [super init];
    if (self) {
        self.name = @"Car";
    }
    return self;
}


@end

@implementation Car(Usage)
- (void)theUsageOfThisVehicle{
    NSLog(@"%@ can drive far away",self.name);
}
@end

@implementation Car(Cost)
- (float)theCostOfThisVehicle{
    return 1000;
}
@end

@implementation Car(GasConsume)
- (float)gasConsumeForHundredMiles{
    return 300;
}
@end
