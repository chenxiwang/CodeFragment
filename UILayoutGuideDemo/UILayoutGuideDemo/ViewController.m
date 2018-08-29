//
//  ViewController.m
//  UILayoutGuideDemo
//
//  Created by wcx on 2018/8/17.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "ViewController.h"
#import "Man.h"
#import "People+AddPlayMehtod.h"
#import "People+Work.h"
#import "Car.h"
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

@interface ViewController ()
@property (nonatomic, strong) UIButton *noButton;
@property (nonatomic, strong) UIButton *yesButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    


   self.noButton = [self getBtn:@"改变颜色"];
   self.yesButton = [self getBtn:@"跳转到下一页"];

    [self.view addSubview:self.noButton];
    [self.view addSubview:self.yesButton];

    self.noButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.yesButton.translatesAutoresizingMaskIntoConstraints = NO;
  //  self.view.translatesAutoresizingMaskIntoConstraints = NO; // 不需要设置，因为 xib 里面已经设置过了（and，此处设置此属性会出现诡异黑屏问题。。。）
    
    
    //[self normalConstrain];
    
    [self archorMethod];

    if (@available(iOS 9.0, *)) {
        UILabel *text = [UILabel new];
        text.text = @"this is Injectiondfdfdf";
        text.backgroundColor = [UIColor yellowColor];
        text.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:text];
        
        [text.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
        [text.centerYAnchor constraintEqualToAnchor:self.view.topAnchor constant:100].active = YES;
    }
   
    
    if ([UIDevice currentDevice].systemVersion.floatValue > 9.0f) {
          NSLog(@"UIStackView可用");
    }else{
          NSLog(@"UIStackView不可用");
    }
    
    if ([UIStackView class]) {
        NSLog(@"UIStackView可用");
    }else{
         NSLog(@"UIStackView不可用");
    }
  
    
    if (@available(iOS 9.0, *)) {
          NSLog(@"UIStackView 可用");
    } else {
          NSLog(@"UIStackView 不可用");
    }
    
    if ([UIView instancesRespondToSelector:@selector(rightAnchor)]) {
        NSLog(@"rightAnchor 可用");
    }else{
        NSLog(@"rightAnchor 不可用");
    }
    
    NSOperatingSystemVersion version = [[NSProcessInfo processInfo] operatingSystemVersion];
    NSLog(@"major--->%ld,minjor--->%ld,patch--->%ld",version.majorVersion,version.minorVersion,version.patchVersion);
    
    
    NSOperatingSystemVersion v = (NSOperatingSystemVersion){9,0,0};
    // 判断操作系统是否大于等于v版本
    BOOL isRight = [[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:v];
    if (isRight) {
        NSLog(@"当前版本大于指定版本");
    }
    else
    {
        NSLog(@"当前版本小于指定版本");
    }
    
    
//    Man *man = [Man new];
//    [man work];
//    NSLog(@"man:%@",man);
    
    Car *car = [Car new];
    [car theUsageOfThisVehicle];
    float cost = [car theCostOfThisVehicle];
    NSLog(@"cart cost : %f",cost);
    
}




/**
 */
- (void)normalConstrain{
    
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.noButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:-20];
    
    NSLayoutConstraint *constraint2 =  [NSLayoutConstraint constraintWithItem:self.noButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    NSLayoutConstraint *constraint3 =   [NSLayoutConstraint constraintWithItem:self.yesButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:10];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.yesButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    
    
  //  [self.view addConstraints:@[constraint1, constraint2, constraint3, constraint4]]; 这个方法被废弃了
    
    [NSLayoutConstraint activateConstraints:@[constraint1, constraint2, constraint3, constraint4]]; // constraint 默认是deactive 的
}


/**
 anchor 提供了一个便利的方式，创建NSLayoutConstraint；
 */
- (void)archorMethod{
    
    if (@available(iOS 9.0, *)) {
        [self.noButton.rightAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:-20].active = YES;
        [self.noButton.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
        [self.yesButton.leftAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:10].active = YES;
        [self.yesButton.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
         NSLog(@"rightAnchor 可用");
    } else {
         NSLog(@"rightAnchor 不可用");
    }
    
    
   
}

- (UIButton *)getBtn:(NSString *)title{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor yellowColor]];
    return btn;
    
}

- (void)injected
{
    NSLog(@"I've been injected: %@", self);
}


@end






