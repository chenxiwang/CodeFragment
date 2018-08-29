//
//  CustomViewTwo.m
//  TextFieldText
//
//  Created by wcx on 2018/8/13.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "CustomViewTwo.h"
#import "Masonry.h"
@implementation CustomViewTwo

- (instancetype)initCustomView{
     NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self initalize];
    }
    return self;
}

+ (instancetype)getCustomView{
     NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    return [[self alloc] initCustomView];
}

- (instancetype)initWithFrame:(CGRect)frame{
     NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    return [self initCustomView];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
     NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    return [self initCustomView];
}

- (void)initalize{
     NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"CustomViewTwo" owner:self options:nil] firstObject];
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    
}
@end
