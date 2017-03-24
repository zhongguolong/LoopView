//
//  ViewController.m
//  04-ImageTurns
//
//  Created by 钟国龙 on 2017/3/24.
//  Copyright © 2017年 guolong. All rights reserved.
//

#import "ViewController.h"

#import "GLLoopView.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSArray<NSURL *> *_urls;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    [self setupUI];
}

- (void)setupUI
{
    GLLoopView *loopView = [[GLLoopView alloc] initWithUrls:_urls];
    loopView.frame = CGRectMake(20, 20, self.view.bounds.size.width - 40, 200);
    
    [self.view addSubview:loopView];
}

- (void)loadData
{
    NSMutableArray *arrM = [NSMutableArray array];
    
    for (int i = 0; i < 3; i++)
    {
        NSString *str = [NSString stringWithFormat:@"%02zd.jpg",i + 1];
        
        NSURL *url = [[NSBundle mainBundle] URLForResource:str withExtension:nil];
        
        [arrM addObject:url];
    }
    _urls = arrM.copy;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
