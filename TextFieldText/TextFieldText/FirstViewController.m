//
//  FirstViewController.m
//  TextFieldText
//
//  Created by wcx on 2018/8/10.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "FirstViewController.h"
#import "HeaderView.h"
#import "FooterView.h"
#import "Masonry.h"
@interface FirstViewController ()
@property (nonatomic, copy  ) NSString *name;
@end

@implementation FirstViewController

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

/**
 You can override this method in order to create your views manually. If you choose to do so, assign the root view of your view hierarchy to the view property. The views you create should be unique instances and should not be shared with any other view controller object. Your custom implementation of this method should not call super.
 */
- (void)loadView{
    [super loadView];
      NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
   //  self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 300)];
     self.view.backgroundColor = [UIColor whiteColor];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@ 类 %@ 方法 调用了",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    
    
    HeaderView *view = [[HeaderView alloc] init];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.right.equalTo(self.view);
    }];
    
    
    
   
}


@end
