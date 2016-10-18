//
//  DSViewController.m
//  DSCircularCollectionView
//
//  Created by Dodda Srinivasan on 07/07/2016.
//  Copyright (c) 2016 Dodda Srinivasan. All rights reserved.
//

#import "DSViewController.h"
#import "DSCircularLayout.h"
#import "DSCollectionViewCell.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define ITEM_WIDTH 50
#define ITEM_HEIGHT 50

@interface DSViewController (){
    int count;
}

@end

@implementation DSViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    count = 0;
    [self setCircularLayout];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self.collectionView performBatchUpdates:^{
        [self.collectionView insertItemsAtIndexPaths:[NSArray arrayWithObjects:
                                                      [NSIndexPath indexPathForRow:0 inSection:0],
                                                      [NSIndexPath indexPathForRow:1 inSection:0],
                                                      [NSIndexPath indexPathForRow:2 inSection:0],
                                                      [NSIndexPath indexPathForRow:3 inSection:0],
                                                      [NSIndexPath indexPathForRow:4 inSection:0],
                                                      [NSIndexPath indexPathForRow:5 inSection:0],
                                                      [NSIndexPath indexPathForRow:6 inSection:0],
                                                      [NSIndexPath indexPathForRow:7 inSection:0],
                                                      [NSIndexPath indexPathForRow:8 inSection:0],
                                                      [NSIndexPath indexPathForRow:9 inSection:0],
                                                      [NSIndexPath indexPathForRow:10 inSection:0],
                                                      [NSIndexPath indexPathForRow:11 inSection:0],
                                                      [NSIndexPath indexPathForRow:12 inSection:0],
                                                      [NSIndexPath indexPathForRow:13 inSection:0],
                                                      [NSIndexPath indexPathForRow:14 inSection:0],
                                                      [NSIndexPath indexPathForRow:15 inSection:0],
                                                      [NSIndexPath indexPathForRow:16 inSection:0],
                                                      [NSIndexPath indexPathForRow:17 inSection:0],
                                                      [NSIndexPath indexPathForRow:18 inSection:0],
                                                      [NSIndexPath indexPathForRow:19 inSection:0],
                                                      nil]];
        count = 20;
    } completion:^(BOOL finished) {
        [self.collectionView reloadData];
    }];
}

-(void)setCircularLayout{
    DSCircularLayout *circularLayout = [[DSCircularLayout alloc] init];
    [circularLayout initWithCentre:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT)
                            radius:SCREEN_WIDTH/2 - ITEM_WIDTH/2
                          itemSize:CGSizeMake(ITEM_WIDTH, ITEM_HEIGHT)
                 andAngularSpacing:20];
    [circularLayout setStartAngle:M_PI endAngle:0];
    circularLayout.mirrorX = NO;
    circularLayout.mirrorY = NO;
    circularLayout.rotateItems = YES;
    circularLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self.collectionView setCollectionViewLayout:circularLayout];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DSCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.lbl.text = [NSString stringWithFormat:@"%d",(int)indexPath.item + 1];
    return cell;
}

@end
