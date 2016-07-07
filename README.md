# iOS Circular Collection View Layout
Circular Collection View Layout for iOS layouts the collectionview items in a circular patterns.<br>
You can customise the angle of the circle to be visible. Check out set up for customization

<br>

![](http://res.cloudinary.com/dm6lqaxjt/image/upload/c_scale,h_392/v1467874733/circular%20collection%20view%20layout.png)

##Features

- Universal device support (iPhone + iPad)
- Easily stylable
- Nice set of configuration options
- Lightweight, simple and readable code.

##Installation

####Manual Installation

1. Download the zip
2. Add the files under DSCircularCollectionView into your project.
3. 

##Setup

```
    DSCircularLayout *circularLayout = [[DSCircularLayout alloc] init];
    [circularLayout initWithCentre:CGPointMake(160, 160)
                            radius:120
                          itemSize:CGSizeMake(50, 50)
                 andAngularSpacing:20];
    [circularLayout setStartAngle:M_PI endAngle:0];
    circularLayout.mirrorX = NO;
    circularLayout.mirrorY = NO;
    circularLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [collectionView setCollectionViewLayout:circularLayout];
```
