//
//  Person+AddProperty.h
//  UserDataDemo
//
//  Created by wcx on 2018/8/29.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "Person.h"

@interface Person (AddProperty)
@property (nonatomic, copy  ) NSString *address;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, strong) Person *relativeP;
@end
