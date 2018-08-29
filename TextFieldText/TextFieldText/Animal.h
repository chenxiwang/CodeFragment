//
//  Animal.h
//  TextFieldText
//
//  Created by wcx on 2018/8/13.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject{
    NSString *_name;
}

- (instancetype)initWithName:(NSString *)name NS_DESIGNATED_INITIALIZER;


@end
