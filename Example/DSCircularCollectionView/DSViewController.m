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

@interface DSViewController ()

@end

@implementation DSViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    [self setCircularLayout];
}

-(void)setCircularLayout{
    DSCircularLayout *circularLayout = [[DSCircularLayout alloc] init];
    [circularLayout initWithCentre:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2)
                            radius:SCREEN_WIDTH/2 - ITEM_WIDTH/2
                          itemSize:CGSizeMake(ITEM_WIDTH, ITEM_HEIGHT)
                 andAngularSpacing:20];
    [circularLayout setStartAngle:M_PI endAngle:0];
    circularLayout.mirrorX = NO;
    circularLayout.mirrorY = NO;
    circularLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self.collectionView setCollectionViewLayout:circularLayout];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 50;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DSCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.lbl.text = [NSString stringWithFormat:@"%d",(int)indexPath.item + 1];
    return cell;
}

@end
