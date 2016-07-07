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

####Cocoa pods
DSCircularCollectionView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DSCircularCollectionView"
```

####Manual Installation

1. Download the zip
2. Add the files under DSCircularCollectionView into your project.
<br>

##Setup

####Theory
![](http://res.cloudinary.com/dm6lqaxjt/image/upload/c_scale,h_336/v1467878560/Circular%20collection%20view%20theory.png)

####Basic
```
DSCircularLayout *circularLayout = [[DSCircularLayout alloc] init];
[circularLayout initWithCentre:CGPointMake(160, 160)
radius:120
itemSize:CGSizeMake(50, 50)
andAngularSpacing:20];
[circularLayout setStartAngle:M_PI endAngle:0];
circularLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
[collectionView setCollectionViewLayout:circularLayout];
```

* Init the DSCircularLayout object with centre of the circle, radius of the circle, item size and spacing between each collection view cell
* Set the visible angle in the circle with start and end angle. specify startAngle to endAndle in clock wise. (Default M_PI to 0)
* Set the scrollDirection to UICollectionViewScrollDirectionHorizontal/Vertical (Default Vertical)
*

####Advanced

```
@property (nonatomic, assign) UICollectionViewScrollDirection scrollDirection;

@property (nonatomic, assign) BOOL mirrorX;

@property (nonatomic, assign) BOOL mirrorY;
```

#####- scrollDirection
Based on the angle of visibility choose the scroll direction (Horizintal or Vertical). 
For a visibility angle between M_PI to 0 horizontal scroll works, where as for M_PI/2 to 3M_PI.2 vertical scroll works. So choose scrollDirection wisely

#####- mirrorX, mirrorY
For a particular visibility angle(b/w start and end), it so happens that the scrolling behaves reverse. That is, the layout will scroll in the opposite direction to the user scroll. Supporting this odd begaviour would be too much of code with angles.

The best way is to find alternate visible angle and mirror it.

Reverse Scroll             |  Proper Scroll
:-------------------------:|:-------------------------:
`[circularLayout setStartAngle:2*M_PI endAngle:M_PI]; circularLayout.mirrorX = NO; circularLayout.mirrorY = NO;`| `[circularLayout setStartAngle:M_PI endAngle:0]; circularLayout.mirrorX = NO; circularLayout.mirrorY = YES;`
![](http://res.cloudinary.com/dm6lqaxjt/image/upload/c_scale,h_420/v1467884392/defect.gif)  |  ![](http://res.cloudinary.com/dm6lqaxjt/image/upload/c_scale,h_420/v1467884392/proper.gif)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first

## Author

Dodda Srinivasan, srinivasan.munna@gmail.com

## License

DSCircularCollectionView is available under the MIT license. See the LICENSE file for more info.

