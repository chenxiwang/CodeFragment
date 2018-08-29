//
//  ContainerView.m
//  TextFieldText
//
//  Created by wcx on 2018/8/9.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "ContainerView.h"
#import "Masonry.h"
@implementation ContainerView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initalize];
          NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
          [self initalize];
          NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    }
    return self;
}

/**
 You must call the super implementation of awakeFromNib to give parent classes the opportunity to perform any additional initialization they require
 */
- (void)awakeFromNib{
    [super awakeFromNib];
    NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

- (void)initalize{
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"ContainerView" owner:self options:nil] firstObject];
    [self addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
}

@end
