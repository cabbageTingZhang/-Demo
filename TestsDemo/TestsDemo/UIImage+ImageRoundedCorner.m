//
//  UIImage+ImageRoundedCorner.m
//  CornerRadius
//
//  Created by 张星宇 on 16/3/3.
//  Copyright © 2016年 zxy. All rights reserved.
//

#import "UIImage+ImageRoundedCorner.h"

@implementation UIImage (ImageRoundedCorner)

//无论使用上面哪种方法，你都需要小心使用背景颜色。因为此时我们没有设置 masksToBounds，因此超出圆角的部分依然会被显示。因此，你不应该再使用背景颜色，可以在绘制圆角矩形时设置填充颜色来达到类似效果。
//在为 UIImageView 添加圆角时，请确保 image 属性不是 nil，否则这个设置将会无效。

- (UIImage *)imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CGContextAddPath(ctx,path.CGPath);
    CGContextClip(ctx);
    [self drawInRect:rect];
    CGContextDrawPath(ctx, kCGPathFillStroke);
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
