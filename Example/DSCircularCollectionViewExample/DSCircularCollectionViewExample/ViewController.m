//
//  ViewController.m
//  DSCircularCollectionViewExample
//
//  Created by Srinivasan Dodda on 04/07/16.
//  Copyright © 2016 Srinivasan Dodda. All rights reserved.
//

#import "ViewController.h"
#import "DSCircularLayout.h"
#import "CircularCollectionViewCell.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define ITEM_WIDTH 50
#define ITEM_HEIGHT 50

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DSCircularLayout *circularLayout = [[DSCircularLayout alloc] init];
    [circularLayout initWithCentre:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT)
                            radius:SCREEN_WIDTH/2 - ITEM_WIDTH/2
                          itemSize:CGSizeMake(ITEM_WIDTH, ITEM_HEIGHT)
                 andAngularSpacing:20];
    [circularLayout setStartAngle:M_PI endAngle:0];
    circularLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self.collectionView setCollectionViewLayout:circularLayout];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 50;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CircularCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.lbl.text = [NSString stringWithFormat:@"%d",(int)indexPath.item + 1];
    return cell;
}

@end
