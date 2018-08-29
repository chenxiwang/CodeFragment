//
//  YTUncaughtExceptionHandler.m
//  TestLabelDemo
//
//  Created by wcx on 2018/7/10.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "YTUncaughtExceptionHandler.h"
#import "DeviceInfoManager.h"
#import <UIKit/UIKit.h>
NSString * applicationDocumentsDirectory(){
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

// 崩溃时的回调函数
void UncaughtExceptionHandler(NSException * exception) {
    NSArray * arr = [exception callStackSymbols];
    NSString * reason = [exception reason]; // // 崩溃的原因  可以有崩溃的原因(数组越界,字典nil,调用未知方法...) 崩溃的控制器以及方法
    NSString * name = [exception name];
    NSString * url = [NSString stringWithFormat:@"========异常错误报告========\nname:%@\nreason:\n%@\n date:%f \n callStackSymbols:\n%@ ",name,reason,[NSDate date].timeIntervalSince1970,[arr componentsJoinedByString:@"\n"]];
    NSString * path = [applicationDocumentsDirectory() stringByAppendingPathComponent:@"Exception.txt"];
    // 将一个txt文件写入沙盒
    [url writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
}
@implementation YTUncaughtExceptionHandler

+ (void)setDefaultHandler {
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
    
    [self uploadCrashLog];
}

+ (NSUncaughtExceptionHandler *)getHandler {
    return NSGetUncaughtExceptionHandler();
}

+ (void)uploadCrashLog{
    // 发送崩溃日志
    NSString *dataPath = [applicationDocumentsDirectory() stringByAppendingPathComponent:@"Exception.txt"];
    NSData *data = [NSData dataWithContentsOfFile:dataPath];
    if (data != nil) {
      //  [self sendExceptionLogWithData:data path:dataPath];
        NSString *content = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"崩溃内容-->%@ \n",content);
       const NSString *deviceName = [[DeviceInfoManager sharedManager] getDeviceName];
        NSLog(@"设备型号-->%@\n", deviceName);
        
        NSString *systemName = [UIDevice currentDevice].systemName;
        NSLog(@"当前系统名称-->%@\n", systemName);
        
        NSString *systemVersion = [UIDevice currentDevice].systemVersion;
        NSLog(@"当前系统版本号-->%@\n", systemVersion);
        
        NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
        
        // 获取App的版本号
        NSString *appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
        NSLog(@"App的版本号-->%@\n",appVersion);
        // 获取App的build版本
        NSString *appBuildVersion = [infoDic objectForKey:@"CFBundleVersion"];
         NSLog(@"App的build版本-->%@\n",appBuildVersion);
       

    }
}


@end
