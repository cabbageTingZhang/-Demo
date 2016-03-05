//
//  TestTableViewCell.m
//  TestsDemo
//
//  Created by mac-mini-ios on 16/3/4.
//  Copyright © 2016年 mac-mini-ios. All rights reserved.
//

#import "TestTableViewCell.h"
#import "UIView+AddCorner.h"
@interface TestTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *img_one;///<第一张图片
@property (weak, nonatomic) IBOutlet UIImageView *img_two;///<第二张图片
@property (weak, nonatomic) IBOutlet UIImageView *img_three;
@property (weak, nonatomic) IBOutlet UIImageView *img_four;
@property (weak, nonatomic) IBOutlet UIImageView *img_five;
@property (weak, nonatomic) IBOutlet UIImageView *img_six;

@end

@implementation TestTableViewCell

- (void)awakeFromNib
{
//    self.img_one = [self.img_one addCornerWithRadius:8];
    [self.img_one addCornerWithRadius:20];
    [self.img_two addCornerWithRadius:20];
    [self.img_three addCornerWithRadius:20];
    [self.img_four addCornerWithRadius:20];
    [self.img_five addCornerWithRadius:20];
    [self.img_six addCornerWithRadius:20];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
