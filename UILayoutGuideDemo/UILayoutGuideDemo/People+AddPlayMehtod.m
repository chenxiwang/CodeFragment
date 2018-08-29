//
//  People+AddPlayMehtod.m
//  UILayoutGuideDemo
//
//  Created by wcx on 2018/8/21.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "People+AddPlayMehtod.h"
#import "People+PrivateMethod.h"
@implementation People (AddPlayMehtod)
- (void)play{
    NSLog(@"my name is:%@,i am %ld age ,i am a %@, would u want to play with me?",self.name,(long)self.age,self.sex ?@"girl":@"boy");
}
@end
