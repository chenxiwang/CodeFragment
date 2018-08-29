//
//  HeaderView.m
//  TextFieldText
//
//  Created by wcx on 2018/8/9.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "HeaderView.h"
#import "Masonry.h"
@implementation HeaderView

//- (instancetype)initFromXib{
//     return [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:nil options:nil] firstObject];
//}

//+ (instancetype)createView{
//   // return [[self alloc] initFromXib];
//    return [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:nil options:nil] firstObject];
//}

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
         NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
          [self initalize];
    }
    return self;
}

- (void)initalize{
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil] firstObject];
    [self addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    
}


/**
 You must call the super implementation of awakeFromNib to give parent classes the opportunity to perform any additional initialization they require
 */
- (void)awakeFromNib{
    [super awakeFromNib];
     NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}



@end
