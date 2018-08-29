//
//  People+AddPlayMehtod.h
//  UILayoutGuideDemo
//
//  Created by wcx on 2018/8/21.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "People.h"

/**
 类别，将一批目的相同的方法分离成一个类别，减少主类的代码量，使类设计更加清晰
 */
@interface People (AddPlayMehtod)

- (void)play;
@end
