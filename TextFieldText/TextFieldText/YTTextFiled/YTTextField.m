//
//  YTTextField.m
//  RentalYi
//
//  Created by yezhibiao on 13-9-23.
//  Copyright (c) 2013年 尹建军. All rights reserved.
//

//#import "YTImageUtils.h"
#import "YTTextField.h"

//#import "UITextView+YTExtension.h"

@interface YTTextField ()

/** X按钮 */
@property (nonatomic, strong) UIButton *doneButton;
@property (nonatomic, assign) BOOL willShowKeyboard;
@property (nonatomic, assign) BOOL displayingKeyboard;
/** notification */
@property (nonatomic, strong) NSNotification *notification;

@end

@implementation YTTextField

/**
 *  释放
 */
- (void)dealloc {
    //注销通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/**
 *  初始化
 */
- (id)init {
    return [self initWithFrame:CGRectZero];
}

/**
 *  初始化方法
 *
 *  @param frame Frame
 *  @param hide  是否隐藏键盘的按钮
 *
 *  @return return value description
 */
- (id)initWithFrame:(CGRect)frame hideKeyBoard:(BOOL)hide {
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor = [UIColor clearColor];
        // 垂直居中
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        
        if (!hide) {
            // 不隐藏
            UIView *accessoryView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, [[UIScreen mainScreen] bounds].size.width, 29.0)];
            self.inputAccessoryView = accessoryView;

            UIButton *keyBoardHideButton = [[UIButton alloc] initWithFrame:CGRectMake(self.inputAccessoryView.frame.size.width - 36.0, 0.0, 36.0, 29.0)];
            keyBoardHideButton.alpha = 0.70;
            self.keyboardAppearance = UIKeyboardAppearanceDefault;

            UIImage *normalImage = [UIImage imageNamed:@"KeyBoard_Hide_iOS7"];
            [keyBoardHideButton setImage:normalImage forState:UIControlStateNormal];
            [keyBoardHideButton addTarget:self action:@selector(pressedButton:) forControlEvents:UIControlEventTouchUpInside];
            [accessoryView addSubview:keyBoardHideButton];

            normalImage = nil;
            keyBoardHideButton = nil;
            accessoryView = nil;
        }
    }
    return self;
}

- (void)setup {
    self.keyboardType = UIKeyboardTypeNumberPad;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeginShow:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillEndShow:) name:UITextFieldTextDidEndEditingNotification object:nil];
}

/**
 *  按钮触摸事件
 */
- (void)pressedButton:(UIButton *)sender {
    // 发送resignFirstResponder.
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

/**
 注意不是身份证号码键盘不需要加通知
 */
//- (void)setInputFormatType:(InputFormatType)inputFormatType {
//    _inputFormatType = inputFormatType;
//    if (_inputFormatType == InputFormatIDCardNumberType) {
//        [self setup];
//    }
//}

/**
 占位
 */
- (void)setPlaceholder:(NSString *)placeholder {
    [super setPlaceholder:placeholder];
}

/**
 *  Description
 */
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, self.edgeInsets.left, self.edgeInsets.right);
}

/**
 *  Description
 */
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, self.edgeInsets.left, self.edgeInsets.right);
}

/**
 *  Description
 */
- (void)setEdgeInsets:(UIEdgeInsets)edgeInsets {
    _edgeInsets = edgeInsets;
    [self setNeedsLayout];
}

/**
 *  Description
 */
- (void)setTextcolor:(UIColor *)textcolor {
    _textcolor = textcolor;
    self.textColor = self.textcolor;
}

/**
 *  背景色
 */
- (void)setBackgroundcolor:(UIColor *)backgroundcolor {
    _backgroundcolor = backgroundcolor;
    self.backgroundColor = self.backgroundcolor;
}

/**
 *  占位颜色
 */
- (void)setPlaceholdercolor:(UIColor *)placeholdercolor {
    _placeholdercolor = placeholdercolor;
    [self setValue:self.placeholdercolor forKeyPath:@"_placeholderLabel.textColor"];
}

/**
 *  限制长度
 */
- (void)setTextLength:(NSInteger)textLength {
    _textLength = textLength;

    [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)setIsCustomDeleteBtn:(BOOL)isCustomDeleteBtn {
    _isCustomDeleteBtn = isCustomDeleteBtn;

    if (_isCustomDeleteBtn) {
        UIImage *image = [UIImage imageNamed:@"Register/Delete"];
        UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [deleteBtn setBackgroundImage:image forState:UIControlStateNormal];
        deleteBtn.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        [deleteBtn addTarget:self action:@selector(deleteText:) forControlEvents:UIControlEventTouchUpInside];

        self.rightView = deleteBtn;
        self.rightViewMode = UITextFieldViewModeWhileEditing;
        [self addTarget:self action:@selector(textChangeNew:) forControlEvents:UIControlEventEditingChanged];
    } else {
        [self removeTarget:self action:@selector(textChangeNew:) forControlEvents:UIControlEventEditingChanged];
        self.rightView = nil;
        self.rightViewMode = UITextFieldViewModeNever;
    }
}

- (void)deleteText:(UIButton *)button {
    self.text = @"";
    self.rightViewMode = UITextFieldViewModeNever;

    if (self.tapDeleteButton) {
        self.tapDeleteButton();
    }
}


- (void)textChangeNew:(UITextField *)textField {
    if (textField.text.length == 0) {
        self.rightViewMode = UITextFieldViewModeNever;
    } else {
        self.rightViewMode = UITextFieldViewModeWhileEditing;
    }
}

/**
 *  限制字符长度
 */
- (void)textFieldDidChange:(UITextField *)textField {

    NSInteger kTextFieldLengthLimit = _textLength;
    NSString *toBeString = textField.text;

    // 键盘输入模式(判断输入模式的方法是iOS7以后用到的)
    NSArray *currentar = [UITextInputMode activeInputModes];
    UITextInputMode *current = [currentar firstObject];

    if ([current.primaryLanguage isEqualToString:@"zh-Hans"]) {
        // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];
        // 获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length > kTextFieldLengthLimit) {
                textField.text = [toBeString substringToIndex:kTextFieldLengthLimit];
            }
        } else {
            // 有高亮选择的字符串，则暂不对文字进行统计和限制
        }
    } else {
        // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        if (toBeString.length > kTextFieldLengthLimit) {
            textField.text = [toBeString substringToIndex:kTextFieldLengthLimit];
        }
    }

    toBeString = textField.text;
    // inputFormat
//    if (self.inputFormatType == InputFormatNumberType) {
//        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
//        NSArray *stringArray = [toBeString componentsSeparatedByCharactersInSet:cs];
//        textField.text = [stringArray componentsJoinedByString:@""];
//    } else if (self.inputFormatType == InputFormatUNormalType) {
//        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"-0123456789"] invertedSet];
//        NSArray *stringArray = [toBeString componentsSeparatedByCharactersInSet:cs];
//        textField.text = [stringArray componentsJoinedByString:@""];
//    } else if (self.inputFormatType == InputFormatFloatNumberType) {
//        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@".0123456789"] invertedSet];
//        NSArray *stringArray = [toBeString componentsSeparatedByCharactersInSet:cs];
//        textField.text = [stringArray componentsJoinedByString:@""];
//    } else if (self.inputFormatType == InputFormatIDCardNumberType) {
//        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"X0123456789"] invertedSet];
//        NSArray *stringArray = [toBeString componentsSeparatedByCharactersInSet:cs];
//        textField.text = [stringArray componentsJoinedByString:@""];
//    }
}

#pragma mark - 通知事件
- (void)keyboardWillBeginShow:(NSNotification *)notification {
    if (self.keyboardType != UIKeyboardTypeNumberPad) return;
    self.willShowKeyboard = notification.object == self;
    //    NSLog(@"%@ --- %zd", notification, self.willShowKeyboard);
    if (self.willShowKeyboard) {
        // 发出通知
        if (@available(iOS 11.0, *)) {
            if (self.notification) {
                [self setupDownKey];
            }
        }
        // 发出通知
        if ([[[UIDevice currentDevice] systemVersion] floatValue] < 9.0) {
            if (self.notification) {
                [self setupDownKey];
            }
        }
    }
}

- (void)keyboardWillEndShow:(NSNotification *)notification {
    if (self.keyboardType != UIKeyboardTypeNumberPad) return;
    self.willShowKeyboard = NO;
    
    NSDictionary *userInfo = [notification userInfo];
    CGFloat animationDuration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    NSInteger animationCurve = [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    // 添加动画
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];
    self.doneButton.transform = CGAffineTransformIdentity;
    [self.doneButton removeFromSuperview];
    [UIView commitAnimations];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    if (self.keyboardType != UIKeyboardTypeNumberPad) return;
    
    // 获取到最上层的window,这句代码很关键
    UIWindow *tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) {
        tempWindow = [[[UIApplication sharedApplication] windows] lastObject];
    }
    
    // 通过图层查看系统的键盘有UIKeyboardAutomatic这个View，第三方的对应位置的view为_UISizeTrackingView
    // 只有iOS 8.0以上需要
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        if (![self ff_foundViewInView:tempWindow clazzName:@"UIKeyboardAutomatic"]) return;
    }
    
    self.notification = notification;
    [self setupDownKey];
}

- (void)setupDownKey {
    if (!self.willShowKeyboard) {
        self.displayingKeyboard = YES;
        return;
    }
    //    NSLog(@"%zd", self.displayingKeyboard);
    [self.doneButton removeFromSuperview];
    self.doneButton = nil;
    
    NSDictionary *userInfo = [self.notification userInfo];
    
    // 动画时间
    CGFloat animationDuration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    // 键盘的Frame
    CGRect kbEndFrame = [self.notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat kbHeight = kbEndFrame.size.height;
    
    //    NSLog(@"%f -- 291 --- 216", kbHeight);
    // 这里因为用了第三方的键盘顶部，所有加了44
//    if (self.adjustTextFeildH) {
//        kbHeight = kbEndFrame.size.height - 44;
//    }
    
    // 动画的轨迹
    NSInteger animationCurve = [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    
    // 按钮的位置计算
    CGFloat doneButtonX = 0;
    CGFloat doneButtonW = 0;
    CGFloat doneButtonH = 0;
    // 为了适配不同屏幕
    if ([UIScreen mainScreen].bounds.size.width == 320) {
        doneButtonW = ([UIScreen mainScreen].bounds.size.width - 6) / 3;
        doneButtonH = (kbHeight - 2) / 4;
    } else if ([UIScreen mainScreen].bounds.size.width == 375) {
        doneButtonW = ([UIScreen mainScreen].bounds.size.width - 8) / 3;
        doneButtonH = (kbHeight - 2) / 4;
    } else if ([UIScreen mainScreen].bounds.size.width == 414) {
        doneButtonW = ([UIScreen mainScreen].bounds.size.width - 7) / 3;
        doneButtonH = kbHeight / 4;
    }
    CGFloat doneButtonY = 0;
    if (self.displayingKeyboard) {
        doneButtonY = [UIScreen mainScreen].bounds.size.height - doneButtonH;
    } else {
        doneButtonY = [UIScreen mainScreen].bounds.size.height + kbHeight - doneButtonH;
    }
//    if (iPhoneX) {
//        doneButtonH = (kbHeight - 75 - 2) / 4;
//        if (self.displayingKeyboard) {
//            doneButtonY = [UIScreen mainScreen].bounds.size.height - doneButtonH;
//        } else {
//            doneButtonY = [UIScreen mainScreen].bounds.size.height + kbHeight - doneButtonH;
//        }
//        doneButtonY -= 75;
//    }
    UIButton *doneButton = [[UIButton alloc] initWithFrame:CGRectMake(doneButtonX, doneButtonY, doneButtonW, doneButtonH)];
    
    doneButton.titleLabel.font = [UIFont systemFontOfSize:27];
    [doneButton setTitle:@"X" forState:(UIControlStateNormal)];
    [doneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    if (@available(iOS 11.0, *)) {
        if (self.displayingKeyboard) {
            doneButton.alpha = 0.0;
            [UIView animateWithDuration:0.1 animations:^{
                doneButton.alpha = 1.0;
            }];
        }
    } else {
        [doneButton setBackgroundImage:[self createImageWithColor:[UIColor whiteColor]] forState:UIControlStateHighlighted];
    }
    [doneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];
    self.doneButton = doneButton;
    
    // 获取到最上层的window,这句代码很关键
    UIWindow *tempWindow = tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) {
        tempWindow = [[[UIApplication sharedApplication] windows] lastObject];
    }
    
    // 添加按钮
    [tempWindow addSubview:doneButton];
    
    if (!self.displayingKeyboard) {
        // 添加动画
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:animationDuration];
        [UIView setAnimationCurve:animationCurve];
        doneButton.transform = CGAffineTransformTranslate(doneButton.transform, 0, -kbHeight);
        [UIView commitAnimations];
    }
    self.displayingKeyboard = YES;
    
}

- (void)keyboardWillHide:(NSNotification *)notification {
    if (self.keyboardType != UIKeyboardTypeNumberPad) return;
    self.displayingKeyboard = NO;
    self.notification = nil;
}

#pragma mark - 私有方法
/**
 *  按钮点击
 */
- (void)doneButton:(UIButton *)doneButton{
    // 获得光标所在的位置
    NSUInteger insertIndex = [self selectedRange].location;
    if (insertIndex < _textLength) { // 长度要小于11个
        // 强行调用代理，如果有需要调用代理方法，在这里自己调用
        if ([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
            BOOL allowChange = [self.delegate textField:self shouldChangeCharactersInRange:NSMakeRange(insertIndex, 0) replacementString:doneButton.currentTitle];
            if (!allowChange) {
                return;
            }
        }
        
        NSMutableString *string = [NSMutableString stringWithString:self.text];
        
        [string replaceCharactersInRange:self.selectedRange withString:doneButton.currentTitle];
        
        // 重新赋值
        self.text = string;
        
        // 让光标回到插入文字后面
        [self setSelectedRange:NSMakeRange(insertIndex + 1, 0)];
        
        // 发出通知
        [[NSNotificationCenter defaultCenter] postNotificationName:UITextFieldTextDidChangeNotification object:self];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [[UIDevice currentDevice] playInputClick];
        });
    }
}

- (UIView *)ff_foundViewInView:(UIView *)view clazzName:(NSString *)clazzName {
    // 递归出口
    if ([view isKindOfClass:NSClassFromString(clazzName)]) {
        return view;
    }
    // 遍历所有子视图
    for (UIView *subView in view.subviews) {
        UIView *foundView = [self ff_foundViewInView:subView clazzName:clazzName];
        if (foundView) {
            return foundView;
        }
    }
    return nil;
}

/**
 *  用颜色返回一张图片
 */
- (UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (NSRange)selectedRange {
    // 文首的位置
    UITextPosition *beginning = self.beginningOfDocument;
    
    // 内容为[start,end)，无论是否有选取区域，start都描述了光标的位置
    UITextRange *selectedRange = self.selectedTextRange;
    UITextPosition *selectionStart = selectedRange.start;
    UITextPosition *selectionEnd = selectedRange.end;
    
    // 获取以from为基准的to的偏移
    const NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStart];
    const NSInteger length = [self offsetFromPosition:selectionStart toPosition:selectionEnd];
    
    return NSMakeRange(location, length);
}

- (void)setSelectedRange:(NSRange)range  // 备注：YTTextField必须为第一响应者才有效
{
    UITextPosition *beginning = self.beginningOfDocument;
    
    UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition *endPosition = [self positionFromPosition:beginning offset:range.location + range.length];
    
    // 创建一个UITextRange
    UITextRange *selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    
    [self setSelectedTextRange:selectionRange];
}


@end
