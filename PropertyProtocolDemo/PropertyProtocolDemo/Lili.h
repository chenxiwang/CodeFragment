//
//  Lili.h
//  PropertyProtocolDemo
//
//  Created by wcx on 2018/8/22.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BeingOneRichGuyProtocol.h"
@interface Lili : NSObject

- (void)wannaMarryARichMan:(id<BeingOneRichGuyProtocol>)man;
@end
