//
//  WYPassWordView.h
//  WYPassWord
//
//  Created by jieku on 2017/4/30.
//  Copyright © 2017年 TSM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYPassWordView : UIView

//回调
@property (nonatomic, copy) void(^passwordBlock)(NSString *password);

//存放所有输入框
@property (nonatomic, strong) NSMutableArray *dataSource;

//输入框个数
@property (nonatomic, assign) NSUInteger elementCount;

//输入框颜色
@property (nonatomic, strong) UIColor *elementColor;

//输入框间距
@property (nonatomic, assign) NSUInteger elementMargin;

//父输入框
@property(nonatomic, weak) UITextField *textField;

//设置placeholder
@property(nonatomic, strong)NSArray *placeholderArray;

//输入错误时候 清空所有文字
- (void)clearText;
@end
