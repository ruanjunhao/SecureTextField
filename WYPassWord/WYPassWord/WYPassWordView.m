//
//  WYPassWordView.m
//  WYPassWord
//
//  Created by jieku on 2017/4/30.
//  Copyright © 2017年 TSM. All rights reserved.
//

#import "WYPassWordView.h"
#import "WYPassWordField.h"

@implementation WYPassWordView


- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithCapacity:self.elementCount];
    }
    return _dataSource;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UITextField *textField = [[UITextField alloc] initWithFrame:self.bounds];
        textField.hidden = YES;
        
        textField.keyboardType = UIKeyboardTypeNumberPad;
        [textField addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
        [self addSubview:textField];
        self.textField = textField;
        self.textField.tag=20;
        [self.textField becomeFirstResponder];
    }
    return self;
}

- (void)setElementCount:(NSUInteger)elementCount {
    _elementCount = elementCount;
    for (int i = 0; i < self.elementCount; i++)
    {
        WYPassWordField *pwdTextField = [[WYPassWordField alloc] init];
        pwdTextField.layer.borderColor = _elementColor.CGColor;
        pwdTextField.enabled = NO;
        pwdTextField.tag=i+1;
        pwdTextField.backgroundColor=[UIColor whiteColor];
        pwdTextField.textAlignment = NSTextAlignmentCenter;
        pwdTextField.secureTextEntry = NO;//设置密码模式
        pwdTextField.placeholder = _placeholderArray[i];    //设置placeholder
        //        pwdTextField.layer.borderWidth = 0.5;         //设置文本框的borderWidth
        pwdTextField.userInteractionEnabled = NO;
        [self insertSubview:pwdTextField belowSubview:self.textField];
        [self.dataSource addObject:pwdTextField];
    }
}

//设置边框颜色
//- (void)setElementColor:(UIColor *)elementColor {
//    _elementColor = elementColor;
//    for (NSUInteger i = 0; i < self.dataSource.count; i++) {
//        UITextField *pwdTextField = [_dataSource objectAtIndex:i];
//        pwdTextField.layer.borderColor = self.elementColor.CGColor;
//    }
//}


- (void)setElementMargin:(NSUInteger)elementMargin {
    _elementMargin = elementMargin;
    [self setNeedsLayout];
}

#pragma mark - 文本框内容改变
- (void)textChange:(UITextField *)textField {
    NSString *password = textField.text;
    if (password.length > self.elementCount) {
        return;
    }
    
    for (int i = 0; i < _dataSource.count; i++)
    {
        UITextField *pwdTextField= [_dataSource objectAtIndex:i];
        if (i < password.length) {
            NSString *pwd = [password substringWithRange:NSMakeRange(i, 1)];
            pwdTextField.text = pwd;
        } else {
            pwdTextField.text = nil;
        }
        
    }
    
    if (password.length == _dataSource.count)
    {
        [textField resignFirstResponder];//隐藏键盘
    }
    
    !self.passwordBlock ? : self.passwordBlock(textField.text);
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = (self.bounds.size.width - (self.elementCount - 1) * self.elementMargin) / self.elementCount;
    CGFloat h = self.bounds.size.height;
    for (NSUInteger i = 0; i < self.dataSource.count; i++) {
        UITextField *pwdTextField = [_dataSource objectAtIndex:i];
        x = i * (w + self.elementMargin);
        pwdTextField.frame = CGRectMake(x, y, w, h);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textField becomeFirstResponder];
}

- (void)clearText{
    self.textField.text = nil;
    [self textChange:self.textField];
}


@end
