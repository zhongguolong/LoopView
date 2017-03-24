
//
//  GLCollectionViewCell.m
//  04-ImageTurns
//
//  Created by 钟国龙 on 2017/3/24.
//  Copyright © 2017年 guolong. All rights reserved.
//

#import "GLCollectionViewCell.h"

@implementation GLCollectionViewCell
{
    UIImageView *_imageView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self.contentView addSubview:imageView];
    _imageView = imageView;
}

- (void)setImageUrl:(NSURL *)imageUrl
{
    _imageUrl = imageUrl;
    
    NSData *data = [NSData dataWithContentsOfURL:imageUrl];
    
    _imageView.image = [UIImage imageWithData:data];
}

@end
