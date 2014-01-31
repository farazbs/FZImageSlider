//
//  ViewController.m
//  FZImageSlider
//
//  Created by macbook on 31/01/2014.
//  Copyright (c) 2014 faraz. All rights reserved.
//
#import "CellMySelectedAlbum.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    arrAlbumPhotos = [[NSMutableArray alloc] initWithArray:[NSArray arrayWithObjects:@"1.png",@"2.png",@"3.png",@"4.png",@"5.png", nil]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - IBActions - 
- (IBAction)leftButtonMethod:(id)sender{

        if (indexCurrent-1 >= 0) {
            [_collectionViewSlider scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:(--indexCurrent) inSection:0]
                                        atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                                animated:YES];
        }

}
- (IBAction)rightButtonMethod:(id)sender{
    if (indexCurrent+1 < [arrAlbumPhotos count]) {
            [_collectionViewSlider scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:(++indexCurrent) inSection:0]
                                        atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                                animated:YES];
        }
}
- (IBAction)DeletePictureMethod:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Are you sure to delete picture" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes", nil];
    [alert show];
}
#pragma mark - UIAlertView Delegate -
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    // For Delete Picture
    if (buttonIndex == 1) {
        [arrAlbumPhotos removeObjectAtIndex:indexCurrent];
        [_collectionViewSlider deleteItemsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForItem:indexCurrent inSection:0]]];
    }
}
#pragma mark - CollectionView Delegate -
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CellMySelectedAlbum *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mySelectedAlbumCellIdentifier" forIndexPath:indexPath];
    [cell.imageViewCell setImage:[UIImage imageNamed:[arrAlbumPhotos objectAtIndex:indexPath.row]]];
    return cell;

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [arrAlbumPhotos count];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    indexCurrent = _collectionViewSlider.contentOffset.x/_collectionViewSlider.frame.size.width;
}
@end
