//
// Created by Eduardo Scoz on 6/8/13.
// Copyright (c) 2013 ESCOZ. All rights reserved.
//

#import "ESConveyorFlowLayout.h"
#import "ESConveyorElement.h"
#import "ESConveyorBelt.h"
#import "ESConveyorAdapter.h"
#import "ESConveyorEffects.h"


@interface ESConveyorFlowLayout ()
@property(nonatomic, strong) NSMutableSet *processedElements;
@property(nonatomic, strong) ESConveyorEffects *effects;
@end

@implementation ESConveyorFlowLayout
{

}

- (id)init
{
    self = [super init];
    if (self) {
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.effects = [ESConveyorEffects new];
    }

    return self;
}

- (void)prepareLayout
{
    [super prepareLayout];

    self.itemSize = self.collectionView.frame.size;
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *items = [super layoutAttributesForElementsInRect:rect];

    items = [items arrayByAddingObjectsFromArray:[self createDecorationItems]];
    return items;
}

- (NSArray *)createDecorationItems
{
    self.processedElements = [NSMutableSet new];
    NSMutableArray *items = [NSMutableArray new];
    CGPoint offset = self.collectionView.contentOffset;

    [self createDecorationItems:items page:(NSUInteger) self.nextPage offset:offset elements:[self.adapter elements]];

    self.processedElements = nil;
    return items;
}

- (void)createDecorationItems:(NSMutableArray *)items page:(NSUInteger)page offset:(CGPoint)offset elements:(NSArray *)elements
{
    NSInteger zIndex = 0;
    for (ESConveyorElement *element in elements)
    {
        CGFloat progress = [self pageTransitionProgressForPage:page];

        BOOL showItem = [element isVisibleInPage:page];
        if (!showItem)
            continue;

        [element updateForPage:page totalPages:self.adapter.numberOfPages progress:progress offset:offset];

        UICollectionViewLayoutAttributes *attr= [self.effects getAttributesForPage:page
                                                                          atOffset:offset
                                                                         pageWidth:self.collectionView.frame.size
                                                                             index:[elements indexOfObject:element]
                                                                          progress:progress
                                                                           element:element];
        attr.zIndex = (NSInteger)zIndex+1;
        [items addObject:attr];

        zIndex ++;

    }
}
- (CGFloat)pageTransitionProgressForPage:(NSUInteger)page
{
    CGFloat finalPoint = self.collectionView.frame.size.width * page;
    CGFloat result = ((int)self.collectionView.contentOffset.x - finalPoint)/ self.collectionView.frame.size.width;
    return 1 - (result < 0 ? - result : result > 1 ? 1 : result);
}

- (NSInteger)previousPage
{
    return (NSInteger) (self.collectionView.contentOffset.x / self.collectionView.frame.size.width);
}

- (NSInteger)nextPage
{
    return (NSInteger)  ceil((self.collectionView.contentOffset.x / self.collectionView.frame.size.width));
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (void)prepareForAnimatedBoundsChange:(CGRect)oldBounds
{
    [super prepareForAnimatedBoundsChange:oldBounds];

    if( !CGRectEqualToRect( self.collectionView.bounds, oldBounds ) )
    {
        [self invalidateLayout];
    }
}

@end
