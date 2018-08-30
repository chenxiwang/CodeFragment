//
//  ViewController.m
//  UserDataDemo
//
//  Created by wcx on 2018/8/27.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Person+AddProperty.h"
static NSString * const kkName = @"kkName";
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self mutableArchiver];
    
    Person * jack = [Person new];
    jack.name =@"jack";
    jack.address = @"Tokyo";
    jack.height = 85;
    Person *lucy = [Person new];
    lucy.name = @"lucy";
    jack.relativeP =lucy;
    
    NSLog(@"person name:%@ height:%ld relative.name:%@",jack.name,(long)jack.height,jack.relativeP.name);
    
    
    SEL selecter = @selector(eat);
    
    [self getInstance:jack sel:selecter];
    
    [self performSelectorInBackground:<#(nonnull SEL)#> withObject:<#(nullable id)#>];
   
}

- (void)getInstance:(id)instance sel:(SEL)sel{
    [instance performSelector:sel];
}


- (void)simpleArchiver{
    NSArray * array = @[@1,@2,@3];
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    NSString *filePath =[documentPath stringByAppendingPathComponent:@"testFile.plist"];
    BOOL success = [NSKeyedArchiver archiveRootObject:array toFile:filePath];
    NSLog(@"success:%@ \n\n",success ?@"YES":@"NO");
    NSLog(@"filePath:%@",filePath);
}

- (void)simpleUnarchiver{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath =[documentPath stringByAppendingPathComponent:@"testFile.plist"];
   NSArray *array =[NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"array:%@",array);
}

- (void)mutableArchiver{
    NSMutableData *data = [NSMutableData dataWithCapacity:0];
    NSArray *array = @[@1,@2,@3];
    
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:array forKey:@"array"];
    [archiver encodeObject:@4 forKey:@"last"];
    [archiver finishEncoding];
    
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath =[documentPath stringByAppendingPathComponent:@"testFile1.plist"];
    BOOL success = [data writeToFile:filePath atomically:YES];
    NSLog(@"success:%@ \n\n",success ?@"YES":@"NO");
    
    
   
}

- (void)mutableUnArchiver{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath =[documentPath stringByAppendingPathComponent:@"testFile1.plist"];
    
    NSKeyedUnarchiver *unArchiver = [NSKeyedUnarchiver  unarchiveObjectWithFile:filePath];
    NSArray *array =[unArchiver decodeObjectForKey:@"array"];
    NSInteger last = [unArchiver decodeIntForKey:@"last"];
    NSLog(@"array:%@---last:%ld",array,(long)last);
}

- (IBAction)saveAction:(UIButton *)sender {
    
    Person *p1 = [Person new];
    p1.name = @"张三";
    p1.age = 18;
    
    Person *p2 = [Person new];
    p2.name = @"李四";
    p2.age = 28;
    
    NSArray *array = @[p1,p2];
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:array];
    
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:kkName];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}


- (IBAction)getAction:(UIButton *)sender {
    
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:kkName];
    
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    NSLog(@"array:%@",array);
    
}


@end
