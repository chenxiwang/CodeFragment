//
//  UILayoutGuideViewController.m
//  UILayoutGuideDemo
//
//  Created by wcx on 2018/8/20.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "UILayoutGuideViewController.h"

API_AVAILABLE(ios(9.0))
@interface UILayoutGuideViewController ()
@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UIView *midView;
@property (nonatomic, strong) UIView *rightView;

@property (nonatomic, strong) UILayoutGuide *layoutGuideOne;
@property (nonatomic, strong) UILayoutGuide *layoutGuideTwo;


@end

@implementation UILayoutGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // source code
   
    self.leftView = [self getViewWithColor:[UIColor yellowColor]];
    self.midView = [self getViewWithColor:[UIColor greenColor]];
    self.rightView = [self getViewWithColor:[UIColor purpleColor]];
    
    if (@available(iOS 9.0, *)) {
        UILayoutGuide *layoutGuideOne = [UILayoutGuide new];
        UILayoutGuide *layoutGuideTwo = [UILayoutGuide new];
       
        
        [self.view addLayoutGuide:layoutGuideOne];
        [self.view addLayoutGuide:layoutGuideTwo];
      
        
        self.layoutGuideOne = layoutGuideOne;
        self.layoutGuideTwo = layoutGuideTwo;
       
    }
    
    
    if (@available(iOS 9.0, *)) {
        
        [self.layoutGuideOne.leadingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.leadingAnchor].active = YES;
        
        [self.leftView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
        [self.leftView.rightAnchor constraintEqualToAnchor:self.layoutGuideOne.leftAnchor].active = YES;
        [self.layoutGuideOne.rightAnchor constraintEqualToAnchor:self.midView.leftAnchor].active = YES;
        
        [self.midView.rightAnchor constraintEqualToAnchor:self.layoutGuideTwo.leftAnchor].active = YES;
        [self.layoutGuideTwo.rightAnchor constraintEqualToAnchor:self.rightView.leftAnchor].active = YES;
        
      
        [self.rightView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
        [self.leftView.widthAnchor constraintEqualToAnchor:self.midView.widthAnchor].active = YES;
        [self.leftView.widthAnchor constraintEqualToAnchor:self.rightView.widthAnchor].active = YES;

        // uilayoutguide 当占位图的时候，只设置有用的 width 属性就行；
        [self.layoutGuideOne.widthAnchor constraintEqualToAnchor:self.layoutGuideTwo.widthAnchor].active = YES;
        [self.layoutGuideTwo.widthAnchor constraintEqualToConstant:50].active = YES;
//        [self.layoutGuideOne.heightAnchor constraintEqualToConstant:100];
//        [self.layoutGuideTwo.heightAnchor constraintEqualToConstant:100];
//        [self.layoutGuideOne.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
//        [self.layoutGuideTwo.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
        
        
        [self.leftView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
        [self.rightView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
        [self.midView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
        
        [self.leftView.heightAnchor constraintEqualToConstant:100].active = YES;
        [self.rightView.heightAnchor constraintEqualToConstant:100].active = YES;
        [self.midView.heightAnchor constraintEqualToConstant:100].active = YES;


        UILabel *text = [UILabel new];
        text.text = @"this is Injection";
        text.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:text];

        [text.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
        [text.centerYAnchor constraintEqualToAnchor:self.view.topAnchor constant:100].active = YES;

        UILabel *label = [UILabel new];
        label.text = @"我是一个聪明的傻瓜dfdfdf";
        label.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:label];
        
        [label.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
        [label.topAnchor constraintEqualToAnchor:text.bottomAnchor constant:15].active = YES;
        
        
    }
   
}

- (UIView *)getViewWithColor:(UIColor *)color{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = color;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:view];
    return view;
}



@end
