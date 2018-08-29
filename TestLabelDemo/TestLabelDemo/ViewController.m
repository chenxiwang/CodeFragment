//
//  ViewController.m
//  TestLabelDemo
//
//  Created by wcx on 2018/6/26.
//  Copyright © 2018年 wcx. All rights reserved.
//

#import "ViewController.h"
@interface ShapeView : UIView

@end

// .m
@implementation ShapeView

+ (Class)layerClass {
    return [CAShapeLayer class];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        ((CAShapeLayer *)self.layer).fillColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:1.0].CGColor;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(10,10)];
    ((CAShapeLayer *)self.layer).path = maskPath.CGPath;
    
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    ((CAShapeLayer *)self.layer).fillColor = backgroundColor.CGColor;
}
@end

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *testView;
@property (nonatomic, strong) CAShapeLayer *maskLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.testView.layer.shadowColor = [UIColor redColor].CGColor;
    self.testView.layer.shadowRadius = 5.f;
    self.testView.layer.shadowOffset = CGSizeMake(2.f, 2.f);
    self.testView.layer.shadowOpacity = 1.f;
    self.testView.backgroundColor = [UIColor clearColor];
    
    
    
   // self.testView.layer.mask = layer;
    
   // self.testView.layer.shadowColor = [UIColor yellowColor].CGColor;
    
    
    // 准备对象
    NSString *urlString = @"https://wx.tenpay.com/cgi-bin/mmpayweb-bin/checkmweb?prepay_id=wx10110035186653b40de438e60059863718&package=2427355591&redirect_url=szhomeforum.th5sd.yuedu.163.com://?weixinback=1";
    NSString * regExpStr = @"(?<=redirect_url=).*(?=\\?)";
    NSString * replacement = @"替换成功啦";
    // 创建 NSRegularExpression 对象,匹配 正则表达式
    NSRegularExpression *regExp = [[NSRegularExpression alloc] initWithPattern:regExpStr
                                                                       options:NSRegularExpressionCaseInsensitive
                                                                         error:nil];
    // 替换匹配的字符串为 searchStr
  NSString *resultStr = [regExp stringByReplacingMatchesInString:urlString
                                                 options:NSMatchingReportProgress
                                                   range:NSMakeRange(0, urlString.length)
                                            withTemplate:replacement];
    NSLog(@"\\urlString = %@  \n resultStr = %@",urlString,resultStr);
    
   
    
}

- (IBAction)crashOne:(id)sender {
    NSArray *array = @[@"22"];
    NSInteger bb = [array[2] integerValue];
}


-(void)viewDidLayoutSubviews{
    NSLog(@"调我几次啦");
    if (self.maskLayer) {
        [self.maskLayer removeFromSuperlayer];
        self.maskLayer = nil;
    }
    
    CGRect rect = self.testView.frame;
    CGFloat radius = 10;
    CGPoint center1 = CGPointMake(10, 10);
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(0, 10)];
    [path addArcWithCenter:center1 radius:radius startAngle:M_PI endAngle:1.5*M_PI clockwise:YES];
    [path addLineToPoint:CGPointMake(rect.size.width-radius, 0)];
    CGPoint center2 = CGPointMake(rect.size.width-10, 10);
    [path addArcWithCenter:center2 radius:radius startAngle:1.5*M_PI endAngle:0 clockwise:YES];
    
    // 凹陷圆弧
    CGFloat arcRadius = 5;
    CGPoint center5 = CGPointMake(rect.size.width, rect.size.height/2-arcRadius);
    [path addArcWithCenter:center5 radius:arcRadius startAngle:1.5*M_PI endAngle:0.5*M_PI clockwise:NO];
    
    
    [path addLineToPoint:CGPointMake(rect.size.width, rect.size.height-radius)];
    CGPoint center3 = CGPointMake(rect.size.width-10, rect.size.height-10);
    [path addArcWithCenter:center3 radius:radius startAngle:0 endAngle:0.5*M_PI clockwise:YES];
    [path addLineToPoint:CGPointMake(10, rect.size.height)];
    CGPoint center4 = CGPointMake(radius, rect.size.height-radius);
    [path addArcWithCenter:center4 radius:radius startAngle:0.5*M_PI endAngle:M_PI clockwise:YES];
    
    // 凹陷圆弧
    CGPoint center6 = CGPointMake(0, rect.size.height/2-arcRadius);
    [path addArcWithCenter:center6 radius:arcRadius startAngle:0.5*M_PI endAngle:1.5*M_PI clockwise:NO];
    
    [path closePath];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.path = path.CGPath;
    layer.lineWidth = 1;
    layer.strokeColor = [UIColor blackColor].CGColor;
    layer.fillColor = [UIColor greenColor].CGColor;
    [self.testView.layer addSublayer:layer];
    self.maskLayer = layer;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
