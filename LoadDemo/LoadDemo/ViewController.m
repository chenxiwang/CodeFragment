//
//  ViewController.m
//  LoadDemo
//
//  Created by wcx on 2018/8/28.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Son.h"
@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *array;
;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *p1 = [Person new];
    
    Person *p2 = [Person new];
    
    Son *s = [Son new];
    if ([s isKindOfClass:[Person class]]) {
        NSLog(@"s is Person class");
    }else{
         NSLog(@"s is not Person class");
    }
    
    if ([s isKindOfClass:[Son class]]) {
        NSLog(@"s is son class");
    }else{
        NSLog(@"s is not son class");
    }
    
    if ([p1 isKindOfClass:[Son class]]) {
        NSLog(@"p1 is Son class");
    }else{
         NSLog(@"p1 is not Son class");
    }
    
    if ([s isMemberOfClass:[Person class]]) {
        NSLog(@"s is member Person class");
    }else{
        NSLog(@"s is not member Person class");
    }
    
    if ([s isMemberOfClass:[Son class]]) {
        NSLog(@"s is member Person class");
    }else{
        NSLog(@"s is not member Person class");
    }
    
    
    
  // [self simpleUsage];
   
    [self callBackUsage];
   
    
}

- (void)simpleUsage{
    Son *s = [Son new];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    if ([s respondsToSelector:@selector(play:)]) {
        [s performSelector:@selector(play:) withObject:@"游戏"];
    }
#pragma clang diagnostic pop
    
    self.array = [NSMutableArray array];
    
    SEL selector = @selector(study:with:);
    
    
    NSMethodSignature *signature = [Son instanceMethodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = s;
    invocation.selector = selector;
    NSString *name = @"lilei";
    NSString *lan = @"Python";
    [invocation setArgument:&lan atIndex:2];
    [invocation setArgument:&name atIndex:3];
    [invocation retainArguments];
    [self.array addObject:invocation];
    
    //  [self.invocation invoke];
    NSInvocation *invocation1 = [NSInvocation invocationWithMethodSignature:signature];
    invocation1.target = s;
    invocation1.selector = selector;
    NSString *name1 = @"lucy";
    NSString *lan1 = @"Swift";
    [invocation1 setArgument:&lan1 atIndex:2];
    [invocation1 setArgument:&name1 atIndex:3];
    // 防止提前释放参数
    [invocation1 retainArguments];
    [self.array addObject:invocation1];
}

- (IBAction)clickAction:(UIButton *)sender {
    
//    [self.array enumerateObjectsUsingBlock:^(NSInvocation *invocation, NSUInteger idx, BOOL * _Nonnull stop) {
//        [invocation invoke];
//    }];
    [self.array makeObjectsPerformSelector:@selector(invoke)];
}


/**
 可以用来callback
 */
- (void)callBackUsage{
    
    SEL selector = NSSelectorFromString(@"testMethod:arg2:");
    
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:selector];
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = selector;
    
    [self someAsynMethodWithInvocation:invocation];
}

- (void)someAsynMethodWithInvocation:(NSInvocation *)invocation{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSString *arg1 = @"参数1";
        NSString *arg2 = @"参数2";
        
        [invocation setArgument:&arg1 atIndex:2];
        [invocation setArgument:&arg2 atIndex:3];
        [invocation invoke];
        
        
    });
    
}

- (void)testMethod:(NSString *)arg1 arg2:(NSString *)arg2{
    NSLog(@"testMethod was called,arg1:%@ arg2:%@",arg1,arg2);
}


@end
