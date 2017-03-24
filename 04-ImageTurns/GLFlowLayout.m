//
//  GLFlowLayout.m
//  04-ImageTurns
//
//  Created by 钟国龙 on 2017/3/24.
//  Copyright © 2017年 guolong. All rights reserved.
//

#import "GLFlowLayout.h"

@implementation GLFlowLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    self.itemSize = self.collectionView.bounds.size;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
}

@end
