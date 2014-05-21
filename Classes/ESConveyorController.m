//
// Created by Eduardo Scoz on 6/8/13.
// Copyright (c) 2013 ESCOZ. All rights reserved.
//

#import "ESConveyorController.h"
#import "ESConveyorFlowLayout.h"
#import "ESConveyorAdapter.h"
#import "ESConveyorElement.h"


@implementation ESConveyorController
{

}
- (instancetype)initWithPages:(NSInteger)numberOfPages elements:(NSArray *)elements
{
    ESConveyorFlowLayout *layout = [[ESConveyorFlowLayout alloc] init];

    self = [super initWithCollectionViewLayout:layout];
    if (self) {

        self.adapter = [[ESConveyorAdapter alloc] initWithCollectionView:self.collectionView numberOfPages:numberOfPages elements:elements];
        layout.adapter = self.adapter;

        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.showsVerticalScrollIndicator = NO;
        self.collectionView.backgroundColor = [UIColor whiteColor];
    }

    return self;
}


- (void)scrollToNextPage
{
    NSIndexPath *path = [NSIndexPath indexPathForItem:0 inSection:self.currentScrollPage+1];
    [self.collectionView scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
}

- (NSInteger)currentScrollPage
{
    return (NSInteger) roundf(self.collectionView.contentOffset.x/self.collectionView.bounds.size.width);
}

@end