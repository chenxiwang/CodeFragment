//
//  ViewController.m
//  RunTimeDemo
//
//  Created by wcx on 2018/8/30.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "ViewController.h"
#import "Son.h"
#import "Father+AddName.h"
//#import "NSArray+CrashHandle.h"
#import "Student.h"
#import "Sark.h"
#import "SarkSon.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 

    
    // 消息转发步骤一//
//    Father *f = [[Father alloc] init];
//    [f performSelector:@selector(eat) withObject:nil];
    
    // 消息转发步骤二//
//    Father *f = [[Father alloc] init];
//    [f performSelector:NSSelectorFromString(@"swim")];
  
    // 消息转发步骤二//
      Father *f = [[Father alloc] init];
      [f performSelector:NSSelectorFromString(@"cook")];
    [f performSelector:NSSelectorFromString(@"walk")];
   
    
}

- (void)handleCrash{
    NSArray *array = @[@1,@2];
    NSLog(@"third:%@",[array objectAtIndex:2]);
}

/**
 自动归解档
 */
- (void)autoArchiverAndUnArchiver{
    
    Student *stu1 = [Student new];
    stu1.name = @"lily";
    stu1.age = 18;
    
    Student *stu2 = [Student new];
    stu2.name = @"Cook";
    stu2.age = 28;
    
    NSArray *_array = @[stu1,stu2];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_array];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"kkk"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    NSData *getdata = [[NSUserDefaults standardUserDefaults] objectForKey:@"kkk"];
    NSArray *getArray = [NSKeyedUnarchiver unarchiveObjectWithData:getdata];
    NSLog(@"object:%@",getArray);
}


@end
