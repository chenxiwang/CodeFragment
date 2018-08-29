//
//  Car.h
//  UILayoutGuideDemo
//
//  Created by wcx on 2018/8/21.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Vehicle.h"

@interface Car : Vehicle

@end

@interface Car(GasConsume)
- (float)gasConsumeForHundredMiles;
@end
