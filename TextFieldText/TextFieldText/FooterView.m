//
//  FooterView.m
//  TextFieldText
//
//  Created by wcx on 2018/8/9.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "FooterView.h"
#import "Masonry.h"
@implementation FooterView

- (instancetype)initWithFrame:(CGRect)frame{
    self =  [super initWithFrame:frame];
    if (self) {
        NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
         [self initalize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self =[super initWithCoder:aDecoder];
    if (self) {
        [self initalize];
        NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    }
    return self;
}

- (void)initalize{
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:self options:nil] firstObject];
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    
}

- (void)awakeFromNib{
    [super awakeFromNib];
     NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}
@end
