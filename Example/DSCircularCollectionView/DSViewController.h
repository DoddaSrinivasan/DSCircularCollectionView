//
//  DSViewController.h
//  DSCircularCollectionView
//
//  Created by Dodda Srinivasan on 07/07/2016.
//  Copyright (c) 2016 Dodda Srinivasan. All rights reserved.
//

@import UIKit;

@interface DSViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
