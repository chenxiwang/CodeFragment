//
//  Student.h
//  RunTimeDemo
//
//  Created by wcx on 2018/9/4.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "BaseArchiveModel.h"

@interface Student : BaseArchiveModel
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@end
