//
//  ThirdViewController.m
//  TextFieldText
//
//  Created by wcx on 2018/8/10.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (nonatomic, copy  ) NSString *name;
@end

@implementation ThirdViewController

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

- (void)loadView{
    [super loadView];
    NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
   // self.view.backgroundColor = [UIColor greenColor];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}



@end
