//
//  ViewController.m
//  PropertyProtocolDemo
//
//  Created by wcx on 2018/8/22.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "ViewController.h"
#import "Daniel.h"
#import "Lili.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Daniel *dan = [Daniel new];
    dan.car = @"Mercedes-Benz";
    dan.house = @"汤臣一品";
    dan.money = 99999999;
    
    if ([dan conformsToProtocol:@protocol(BeingOneRichGuyProtocol)]) {
        NSLog(@"dan 遵循 BeingOneRichGuyProtocol 协议");
    }else{
        NSLog(@"dan 不遵循 BeingOneRichGuyProtocol 协议");
    }
    
    Lili *li = [Lili new];
    [li wannaMarryARichMan:dan];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
