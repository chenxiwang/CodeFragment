//
//  CustomViewOne.m
//  TextFieldText
//
//  Created by wcx on 2018/8/13.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "CustomViewOne.h"
#import "Masonry.h"
@interface CustomViewOne(){
    NSString *_name;
}

@end
@implementation CustomViewOne

- (instancetype)initWithFrame:(CGRect )frame name:(NSString *)name{
    self = [super initWithFrame:frame];
    if (self) {
        _name = name;
        [self iniatize];
    }
    return self;
}

- (void)iniatize{
    self.backgroundColor = [UIColor greenColor];
    
    UILabel *label = [UILabel new];
    label.text = _name;
    [self addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
}

@end
