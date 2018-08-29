//
//  LocalArchiverManager.m
//  UserDataDemo
//
//  Created by wcx on 2018/8/27.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "LocalArchiverManager.h"
#define Document [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define ArchiverFile    [Document stringByAppendingPathComponent:@"Archiver"]

@interface LocalArchiverManager()
@property(nonatomic, strong) NSFileManager *fileManager;
@end

@implementation LocalArchiverManager
+ (LocalArchiverManager *)shareManagement
{
    static LocalArchiverManager *manager = nil;
    static dispatch_once_t onceTocken;
    dispatch_once(&onceTocken, ^
                  {
                      manager = [[LocalArchiverManager alloc] init];
                  });
    return manager;
}

- (id)init
{
    self = [super init];
    if(self)
    {
        self.fileManager = [NSFileManager defaultManager];
    }
    return self;
}

#pragma mark private methods
// 检测path路径文件是否存在
- (BOOL)checkPathIsExist:(NSString *)path
{
    return [_fileManager fileExistsAtPath:path isDirectory:nil];
}

// 创建文件
- (void)createArchiverFile
{
    if (![self checkPathIsExist:ArchiverFile])
    {
        [self addNewFolder:ArchiverFile];
    }
}

//新建目录,path为目录路径(包含目录名)
- (void)addNewFolder:(NSString *)path
{
    [_fileManager createDirectoryAtPath:path
            withIntermediateDirectories:YES
                             attributes:nil
                                  error:nil];
}

#pragma mark public methods

- (void)clearArchiverData
{
    NSError *error;
    if([self.fileManager removeItemAtPath:ArchiverFile error:&error])
    {
        
    } else {
        NSLog(@"清除本地序列化的文件失败....:%@",error);
    }
}

// 保存数据
- (void)saveDataArchiver:(id)obj andAPIKey:(NSString *)key
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:obj forKey:key];
    [archiver finishEncoding];
    [self createArchiverFile];
    key = [key stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    NSString *path = [ArchiverFile stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.text",key]];
    BOOL isSuc = [data writeToFile:path atomically:YES];
    if(!isSuc) {
        NSLog(@"本地序列化失败key....:%@",key);
    }
}
// 获取数据
- (id)archiverQueryAPIKey:(NSString *)key
{
    NSString *str = [key stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    NSString *path = [ArchiverFile stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.text",str]];
    NSMutableData *data = [[NSMutableData alloc] initWithContentsOfFile:path];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    id content = [unarchiver decodeObjectForKey:key];
    [unarchiver finishDecoding];
    NSLog(@"content.....:%@",content);
    return content;
}


@end
