//
//  ViewController.h
//  FZImageSlider
//
//  Created by macbook on 31/01/2014.
//  Copyright (c) 2014 faraz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>{
    NSMutableArray *arrAlbumPhotos;
    int indexCurrent;

}
@property (nonatomic, strong) IBOutlet UICollectionView *collectionViewSlider;


- (IBAction)leftButtonMethod:(id)sender;
- (IBAction)rightButtonMethod:(id)sender;

@end
