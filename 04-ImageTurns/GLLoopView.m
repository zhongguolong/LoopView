//
//  GLLoopView.m
//  04-ImageTurns
//
//  Created by 钟国龙 on 2017/3/24.
//  Copyright © 2017年 guolong. All rights reserved.
//

#import "GLLoopView.h"
#import "GLFlowLayout.h"
#import "GLCollectionViewCell.h"

static NSString *const cellID = @"cellID";

@interface GLLoopView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation GLLoopView
{
    NSArray *_urls;
}

- (instancetype)initWithUrls:(NSArray *)urls
{
    self = [super initWithFrame:CGRectZero collectionViewLayout:[[GLFlowLayout alloc] init]];
    
    if (self)
    {
        self.dataSource = self;
        self.delegate = self;
        
        [self registerClass:[GLCollectionViewCell class] forCellWithReuseIdentifier:cellID];
        _urls = urls;
        
        //主队列异步，保证数据源方法执行完成
        dispatch_async(dispatch_get_main_queue(), ^{
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_urls.count inSection:0];
            [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        });
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _urls.count * 100;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    cell.imageUrl = _urls[indexPath.item % _urls.count];
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger offset = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    if (offset == 0 || offset == [self numberOfItemsInSection:0] - 1)
    {
        if (offset == 0)
        {
            offset = _urls.count;
        }
        else
        {
            offset = _urls.count - 1;
        }
        scrollView.contentOffset = CGPointMake(offset * scrollView.bounds.size.width, 0);
    }
}

@end
