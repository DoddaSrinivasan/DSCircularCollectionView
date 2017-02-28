//
//  DSCircularLayout.m
//  DSCircularCollection-ViewExample
//
//  Created by Srinivasan Dodda on 04/07/16.
//  Copyright © 2016 Srinivasan Dodda. All rights reserved.
//

#import "DSCircularLayout.h"

@implementation DSCircularLayout{
    CGFloat angleOfEachItem;
    CGFloat angleForSpacing;
    CGFloat circumference;
    long cellCount;
    CGFloat maxNoOfCellsInCircle;
    
    CGFloat _startAngle;
    CGFloat _endAngle;
}

- (id)init {
    self = [super init];
    if (self) {
        _startAngle = M_PI;
        _endAngle = 0;
    }
    return self;
}

-(void)initWithCentre:(CGPoint)centre radius:(CGFloat)radius itemSize:(CGSize)itemSize andAngularSpacing:(CGFloat)angularSpacing{
    _centre = centre;
    _radius = radius;
    _itemSize = itemSize;
    _angularSpacing = angularSpacing;
}

-(void)setStartAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle{
    _startAngle = startAngle;
    _endAngle = endAngle;
    if(_startAngle == 2*M_PI){
        _startAngle = 2*M_PI - M_PI/180;
    }
    if(_endAngle == 2*M_PI){
        _endAngle = 2*M_PI - M_PI/180;
    }
}

-(void)prepareLayout{
    [super prepareLayout];
    cellCount = [self.collectionView numberOfItemsInSection:0];
    circumference = ABS(_startAngle - _endAngle)*_radius;
    maxNoOfCellsInCircle =  circumference/(MAX(_itemSize.width, _itemSize.height) + _angularSpacing/2);
    angleOfEachItem = ABS(_startAngle - _endAngle)/maxNoOfCellsInCircle;
}

-(CGSize)collectionViewContentSize{
    CGFloat visibleAngle = ABS(_startAngle - _endAngle);
    long remainingItemsCount = cellCount > maxNoOfCellsInCircle ? cellCount - maxNoOfCellsInCircle : 0;
    CGFloat scrollableContentWidth = (remainingItemsCount+1)*angleOfEachItem*_radius/(2*M_PI/visibleAngle);
    CGFloat height = _radius + (MAX(_itemSize.width, _itemSize.height)/2);
    
    if(_scrollDirection == UICollectionViewScrollDirectionVertical)
    {
        return CGSizeMake(height, scrollableContentWidth + self.collectionView.bounds.size.height);
    }
    return CGSizeMake(scrollableContentWidth + self.collectionView.bounds.size.width, height);
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(_scrollDirection == UICollectionViewScrollDirectionVertical)
    {
        return [self layoutAttributesForVerticalScrollForItemAtIndexPath:indexPath];
    }
    return [self layoutAttributesForHorozontalScrollForItemAtIndexPath:indexPath];
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForHorozontalScrollForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat offset = self.collectionView.contentOffset.x;
    offset = offset == 0 ? 1 : offset;
    CGFloat offsetPartInMPI = offset/circumference;
    CGFloat angle = 2*M_PI*offsetPartInMPI;
    CGFloat offsetAngle = angle;
    
    attributes.size = _itemSize;
    int mirrorX = _mirrorX ? -1 : 1;
    int mirrorY = _mirrorY ? -1 : 1;
    
    CGFloat x = _centre.x + offset + mirrorX*(_radius*cosf(indexPath.item*angleOfEachItem - offsetAngle + angleOfEachItem/2 - _startAngle));
    CGFloat y = _centre.y + mirrorY*(_radius*sinf(indexPath.item*angleOfEachItem - offsetAngle + angleOfEachItem/2 - _startAngle));
    
    CGFloat cellCurrentAngle = (indexPath.item*angleOfEachItem + angleOfEachItem/2 - offsetAngle);
    if(cellCurrentAngle >= -angleOfEachItem/2 && cellCurrentAngle <= ABS(_startAngle - _endAngle) + angleOfEachItem/2){
        attributes.alpha = 1;
    }else{
        attributes.alpha = 0;
    }
    
    attributes.center = CGPointMake(x, y);
    attributes.zIndex = cellCount - indexPath.item;
    if(_rotateItems){
        if(_mirrorY){
            attributes.transform = CGAffineTransformMakeRotation(M_PI - cellCurrentAngle - M_PI/2);
        }else{
            attributes.transform = CGAffineTransformMakeRotation(cellCurrentAngle - M_PI/2);
        }
    }
    return attributes;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForVerticalScrollForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat offset = self.collectionView.contentOffset.y;
    offset = offset == 0 ? 1 : offset;
    CGFloat offsetPartInMPI = offset/circumference;
    CGFloat angle = 2*M_PI*offsetPartInMPI;
    CGFloat offsetAngle = angle;
    
    attributes.size = _itemSize;
    int mirrorX = _mirrorX ? -1 : 1;
    int mirrorY = _mirrorY ? -1 : 1;
    
    CGFloat x = _centre.x + mirrorX*(_radius*cosf(indexPath.item*angleOfEachItem - offsetAngle + angleOfEachItem/2 - _startAngle));
    CGFloat y = _centre.y + offset + mirrorY*(_radius*sinf(indexPath.item*angleOfEachItem - offsetAngle + angleOfEachItem/2 - _startAngle));
    
    CGFloat cellCurrentAngle = indexPath.item*angleOfEachItem + angleOfEachItem/2 - offsetAngle;
    
    if(cellCurrentAngle >= -angleOfEachItem/2 && cellCurrentAngle <= ABS(_startAngle - _endAngle) + angleOfEachItem/2){
        attributes.alpha = 1;
    }else{
        attributes.alpha = 0;
    }
    
    attributes.center = CGPointMake(x, y);
    attributes.zIndex = cellCount - indexPath.item;
    if(_rotateItems){
        if(_mirrorX){
            attributes.transform = CGAffineTransformMakeRotation(2*M_PI - cellCurrentAngle);
        }else{
            attributes.transform = CGAffineTransformMakeRotation(cellCurrentAngle);
        }
    }
    
    return attributes;
}

-(NSArray <__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray<__kindof UICollectionViewLayoutAttributes *> *attributes = [NSMutableArray array];
    for(NSInteger i=0; i < cellCount; i++){
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UICollectionViewLayoutAttributes *cellAttributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        if(CGRectIntersectsRect(rect, cellAttributes.frame) && cellAttributes.alpha != 0){
            [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
        }
    }
    return attributes;
}

- (UICollectionViewLayoutAttributes*)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes *attributes = [super initialLayoutAttributesForAppearingItemAtIndexPath:itemIndexPath];
    attributes.center = CGPointMake(_centre.x + self.collectionView.contentOffset.x, _centre.y + self.collectionView.contentOffset.y);
    attributes.alpha = 0.2;
    attributes.transform = CGAffineTransformMakeScale(0.5, 0.5);
    return attributes;
    
}

- (UICollectionViewLayoutAttributes*)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes *attributes = [super finalLayoutAttributesForDisappearingItemAtIndexPath:itemIndexPath];
    attributes.center = CGPointMake(_centre.x + self.collectionView.contentOffset.x, _centre.y + self.collectionView.contentOffset.y);
    attributes.alpha = 0.2;
    attributes.transform = CGAffineTransformMakeScale(0.5, 0.5);
    return attributes;
    
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

@end
