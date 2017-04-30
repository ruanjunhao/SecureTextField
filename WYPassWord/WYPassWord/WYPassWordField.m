//
//  WYPassWordField.m
//  WYPassWord
//
//  Created by jieku on 2017/4/30.
//  Copyright © 2017年 TSM. All rights reserved.
//

#import "WYPassWordField.h"

@implementation WYPassWordField


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置线的颜色
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    //设置线宽
    CGContextSetLineWidth(context, 5.0);
    //起始点设置为(0,0):注意这是上下文对应区域中的相对坐标，
    CGContextMoveToPoint(context, 0, self.frame.size.height);
    //设置下一个坐标点
    CGContextAddLineToPoint(context,100,self.frame.size.height);
    //连接上面定义的坐标点，也就是开始绘图
    CGContextStrokePath(context);
}


@end
