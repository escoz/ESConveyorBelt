//
// Created by Eduardo Scoz on 6/8/13.
// Copyright (c) 2013 ESCOZ. All rights reserved.
//

#import "ESConveyorAdapter.h"
#import "ESConveyorController.h"
#import "ESConveyorView.h"
#import "ESConveyorFlowLayout.h"
#import "ESConveyorView.h"
#import "ESConveyorElement.h"
#import "ESConveyorPageCell.h"


static NSString *const ESConveyorElementReuseIdentifier = @"ESConveyorElementReuseIdentifier";
NSString *kESConveyorCell = @"ESConveyorCell";

@interface ESConveyorAdapter ()
@property(nonatomic, weak) UICollectionView *collectionView;
@end

@implementation ESConveyorAdapter
{

}
- (id)initWithCollectionView:(UICollectionView *)collectionView numberOfPages:(NSInteger)pages elements:(NSArray *)elements
{

    self = [super init];
    if (self)
    {
        self.collectionView = collectionView;
        self.numberOfPages = pages;
        self.elements = elements;

        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.pagingEnabled = YES;

        [self.collectionView registerClass:[ESConveyorPageCell class] forCellWithReuseIdentifier:kESConveyorCell];
        [self.collectionView registerClass:[ESConveyorView class] forSupplementaryViewOfKind:NSStringFromClass(ESConveyorElement.class) withReuseIdentifier:ESConveyorElementReuseIdentifier];

    }

    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.numberOfPages;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([ESConveyorElementKind isEqualToString:kind]) {
        return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:ESConveyorElementReuseIdentifier forIndexPath:indexPath];
    }

    NSAssert(NO, @"This should never happen");
    return nil;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [collectionView dequeueReusableCellWithReuseIdentifier:kESConveyorCell forIndexPath:indexPath];
}

@end