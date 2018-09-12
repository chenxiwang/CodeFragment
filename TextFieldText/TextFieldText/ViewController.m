//
//  ViewController.m
//  TextFieldText
//
//  Created by wcx on 2018/6/12.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "ViewController.h"
#import "YTTextField.h"
#import "HeaderView.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "Whale.h"
#import "CustomViewOne.h"
#import "CustomViewTwo.h"
#import "Masonry.h"
#import "Man.h"
#import "BMW.h"
@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *lastBtn;

@property (weak, nonatomic) IBOutlet CustomViewTwo *customViewTwo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 指定初始化方法 https://www.cnblogs.com/smileEvday/p/designated_initializer.html
    // https://mp.weixin.qq.com/s?__biz=MzI5NjAwNjg1Nw==&mid=2457137147&idx=1&sn=aa963bee21e907479f68956880f2cc09&chksm=fbcaaa5dccbd234b74aa1462931dea4652f60f0de630b064a6a9f579d2894887ac49b89f9e88#rd
    // 7-4-2-1
//    Whale *whale1 = [[Whale alloc] initWale];
//    NSLog(@"whale1: %@",whale1);
    // 6-8-7-4-2-1
//    Whale *whale2 = [[Whale alloc] initWithName:@"Whale"];
//    NSLog(@"whale1: %@",whale2);
    
    // 3-6-8-7-4-2-1
//    Whale *whale3 = [[Whale alloc] init];
//    NSLog(@"whale3 %@", whale3);
    
    // 5-6-8-7-4-2-1
//    Whale *whale4 = [[Whale alloc] initWithLegs:4];
//    NSLog(@"whale4 %@", whale4);
    
    // 8-7-4-2-1
    Whale *whale5 = [[Whale alloc] initWithName:@"Whale" andLegs:8];   
    NSLog(@"whale5 %@", whale5);
    
    // 只有这一种初始化方法
    CustomViewOne *one = [[CustomViewOne alloc]initWithFrame:CGRectMake(200, 80, 100, 40) name:@"指定初始化方法"];
    [self.view addSubview:one];
    
//    // 第一种初始话方法
//    CustomViewTwo *two = [CustomViewTwo getCustomView];
//    [self.view addSubview:two];
    
    // 第二种初始话方法
//    CustomViewTwo *two = [[CustomViewTwo alloc] initCustomView];
//    [self.view addSubview:two];
    
//    // 第三种初始话方法
//    CustomViewTwo *two = [[CustomViewTwo alloc] init];
//    [self.view addSubview:two];
    
    // 第四种初始话方法
//    CustomViewTwo *two = [[CustomViewTwo alloc] initWithFrame:CGRectZero];
//    [self.view addSubview:two];
//    
//    [two mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.lastBtn.mas_bottom).offset(20);
//        make.left.right.equalTo(self.view);
//    }];
    
    // 第五种 从xib 加载
   self.customViewTwo.translatesAutoresizingMaskIntoConstraints = NO;
//
//    Man *man = [[Man alloc] initWithNoArgument];
    
    BMW *b = [[BMW alloc] init];
    
}

- (IBAction)firstBtnAction:(UIButton *)sender {
    
    FirstViewController *vc = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
//    SecondViewController *vc = [[SecondViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
//    ThirdViewController *vc = [[ThirdViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)secondBtnAction:(id)sender {
    
    FirstViewController *vc = [[FirstViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    
//        SecondViewController *vc = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
//        [self.navigationController pushViewController:vc animated:YES];
    

//    ThirdViewController *vc = [[ThirdViewController alloc] initWithNibName:nil bundle:nil];
//    [self.navigationController pushViewController:vc animated:YES];
    
    
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    ThirdViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ThirdViewController"];
//    [self.navigationController pushViewController:vc animated:YES];
    
  
    
}


- (IBAction)thirdBtnAction:(id)sender {
    
    FirstViewController *vc = [[FirstViewController alloc] initWithName:@"李磊"];
    [self.navigationController pushViewController:vc animated:YES];
    
//    SecondViewController *vc = [[SecondViewController alloc] initWithName:@"李磊"];
//    [self.navigationController pushViewController:vc animated:YES];
    
//    ThirdViewController *vc = [[ThirdViewController alloc] initWithName:@"李磊"];
//    [self.navigationController pushViewController:vc animated:YES];
}



@end
