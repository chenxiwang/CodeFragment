//
//  BeingOneRichGuyProtocol.h
//  PropertyProtocolDemo
//
//  Created by wcx on 2018/8/22.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BeingOneRichGuyProtocol <NSObject>

@required

@property (nonatomic, assign) float money;
@property (nonatomic, copy  ) NSString *car;
@property (nonatomic, copy  ) NSString *house;

- (float)makeMoney;

- (void)spendMoney;
@end
