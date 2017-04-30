//
//  ViewController.m
//  WYPassWord
//
//  Created by jieku on 2017/4/30.
//  Copyright © 2017年 TSM. All rights reserved.
//

#import "ViewController.h"

#import "WYPassWordView.h"

@interface ViewController ()

@property (nonatomic, strong)WYPassWordView *password;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    self.password = [[WYPassWordView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-256.5)/2, 193.5, 256.5, 39)];
    self.password.elementCount = 6;
    self.password.elementColor= [UIColor redColor];
    self.password.placeholderArray = @[@"1",@"2",@"1",@"2",@"1",@"2"];
    self.password.elementMargin = 10;
    
    [self.view addSubview:self.password];
    
    __weak typeof(self) weakSelf = self;
    self.password.passwordBlock = ^(NSString *password) {
        if (password.length==6) {
            NSLog(@"%@--密码输入错误清空文本",password);
            //输入错误时 清空文本框
            [weakSelf.password clearText];
        }
        
    };
}





@end
