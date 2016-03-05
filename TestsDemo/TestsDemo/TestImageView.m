//
//  TestImageView.m
//  TestsDemo
//
//  Created by mac-mini-ios on 16/3/4.
//  Copyright © 2016年 mac-mini-ios. All rights reserved.
//

#import "TestImageView.h"
#import "UIImage+ImageRoundedCorner.h"

@implementation TestImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib
{
   
//    方法一  失败 fps 30左右
//    self.layer.cornerRadius = self.frame.size.width / 2.0;
//    self.layer.masksToBounds = YES;
    
//    加上这两句后反倒掉的更多了(目前不知道原因 文章链接http://www.cocoachina.com/ios/20150803/12873.html) fps在22左右 还是失败
//    self.layer.shouldRasterize = YES;
//    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    //方法二 重写drawRect方法
//    首先，我们应该尽量避免重写 drawRect 方法。不恰当的使用这个方法会导致内存暴增。举个例子，iPhone6 上与屏幕等大的 UIView，即使重写一个空的 drawRect 方法，它也至少占用 750 * 1134 * 4 字节 ≈ 3.4 Mb 的内存。在 内存恶鬼drawRect 及其后续中，作者详细介绍了其中原理，据他测试，在 iPhone6 上空的、与屏幕等大的视图重写 drawRect 方法会消耗 5.2 Mb 内存。总之，能避免重写 drawRect 方法就尽可能避免。
//    其次，这种方法本质上是用遮罩层 mask 来实现，因此同样无可避免的会导致离屏渲染。我试着将此前 34 个视图的圆角改用这种方法实现，结果 fps 掉到 11 左右。已经属于卡出翔的节奏了
//    [self drawRect:self.bounds];
    
    // 方法三 成功 (为 UIImageView 添加圆角 文章链接http://www.cocoachina.com/ios/20160301/15486.html) 58左右 YES
//    self.image = [self.image imageAddCornerWithRadius:15 andSize:self.bounds.size];

}

//    方法二(重写drawRect方法) 失败 fps 22左右
//- (void)drawRect:(CGRect)rect
//{
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(10, 10)];
//    CAShapeLayer *maskLayer = [CAShapeLayer layer];
//    maskLayer.frame = self.bounds;
//    maskLayer.path = maskPath.CGPath;
//    self.layer.mask = maskLayer;
//}


@end
