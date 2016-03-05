//
//  UIView+AddCorner.m
//  TestsDemo
//
//  Created by mac-mini-ios on 16/3/5.
//  Copyright © 2016年 mac-mini-ios. All rights reserved.
//

#import "UIView+AddCorner.h"

@implementation UIView (AddCorner)

//    发放四(为UIView添加圆角)
- (void)addCornerWithRadius:(CGFloat)radius
{
    [self AddCornerWithRadius:radius andBorderWidth:1 andBackgroundColor:[UIColor clearColor] andBorderColor:[UIColor blackColor]];
}

- (void)AddCornerWithRadius:(CGFloat)radius andBorderWidth:(CGFloat)borderWidth andBackgroundColor:(UIColor *)backgroundColor andBorderColor:(UIColor *)borderColor
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[self imageDrawRectWithRoundedCornerWithRadius:radius andBorderWidth:borderWidth andBackgroundColor:backgroundColor andBorderColor:borderColor]];
    [self insertSubview:imageView atIndex:0];
}

- (UIImage *)imageDrawRectWithRoundedCornerWithRadius:(CGFloat)radius andBorderWidth:(CGFloat)borderWidth andBackgroundColor:(UIColor *)backgroundColor andBorderColor:(UIColor *)borderColor
{
    CGSize sizeToFit = CGSizeMake([self pixedWithNum:self.bounds.size.width], self.bounds.size.height);
    CGFloat halfBorderWidth = borderWidth / 2.0;
    
    UIGraphicsBeginImageContextWithOptions(sizeToFit, false, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, borderWidth);
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    
    CGFloat width = sizeToFit.width;
    CGFloat height = sizeToFit.height;
    CGContextMoveToPoint(context, width - halfBorderWidth, radius + halfBorderWidth);// 开始坐标右边开始
    CGContextAddArcToPoint(context, width - halfBorderWidth, height - halfBorderWidth, width - radius - halfBorderWidth, height - halfBorderWidth, radius);//右下角角度
    CGContextAddArcToPoint(context, halfBorderWidth, height - halfBorderWidth, halfBorderWidth, height - radius - halfBorderWidth, radius);//左下角角度
    CGContextAddArcToPoint(context, halfBorderWidth, halfBorderWidth, width - halfBorderWidth, halfBorderWidth, radius);//左上角
    CGContextAddArcToPoint(context, width - halfBorderWidth, halfBorderWidth, width - halfBorderWidth, radius + halfBorderWidth, radius);//右上角
    
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (double)pixedWithNum:(double)num
{
    double unit;
    switch ((int)[UIScreen mainScreen].scale) {
        case 1 :
        {
            unit = 1.0 / 1.0;
        }
            break;
        case 2 :
        {
            unit = 1.0 / 2.0;
        }
            break;
        case 3 :
        {
            unit = 1.0 / 3.0;
        }
            break;
        default: unit = 0.0;
            break;
    }
    return [self roundbuunitWithNum:num adnUnit:unit];
}

- (double)roundbuunitWithNum:(double)num adnUnit:(double)unit
{
    double remain = modf(num, &unit);
    if (remain > unit / 2.0) {
        return [self ceilbuunitWithNum:num andUnit:unit];
    }
    else
    {
        return [self floorbyunitWithNum:num andUnit:unit];
    }
}

- (double)ceilbuunitWithNum:(double)num andUnit:(double)unit
{
    return num - modf(num, &unit) + unit;
}

- (double)floorbyunitWithNum:(double)num andUnit:(double)unit
{
    return num - modf(num, &unit);
}

@end
