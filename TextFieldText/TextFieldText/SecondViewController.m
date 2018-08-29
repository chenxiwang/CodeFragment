//
//  SecondViewController.m
//  TextFieldText
//
//  Created by wcx on 2018/8/10.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (nonatomic, copy  ) NSString *name;
@end

@implementation SecondViewController
- (instancetype)initWithName:(NSString *)name{
    self = [super init];
    if (self) {
        self.name = name;
        NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    }
    return self;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self =  [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    }
    return self;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    }
    return self;
}
// 此方法如果重写，那么即使该vc有对应的xib文件，也不会加载出来
// If you use Interface Builder to create your views and initialize the view controller, you must not override this method.
//- (void)loadView{
//    [super loadView];
//    if (!self.viewIfLoaded) {
//    NSLog(@"%@ 类 %@ 方法 调用了 view 未加载",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
//    }else{
//        NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
//    }
//}

- (void)awakeFromNib{
    [super awakeFromNib];
    NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    
}



@end
