//
// Created by Eduardo Scoz on 6/8/13.
// Copyright (c) 2013 ESCOZ. All rights reserved.
//

#import "ESConveyorEffects.h"
#import "ESConveyorBelt.h"
#import "ESConveyorElement.h"
#import "ESConveyorBeltAttributes.h"


@implementation ESConveyorEffects
{

}

- (UICollectionViewLayoutAttributes *)getAttributesForPage:(NSUInteger)page atOffset:(CGPoint)offset pageWidth:(CGSize)pageSize index:(NSUInteger)index progress:(CGFloat)progress element:(ESConveyorElement *)element
{
    ESConveyorBeltAttributes *attr = [ESConveyorBeltAttributes layoutAttributesForSupplementaryViewOfKind:ESConveyorElementKind withIndexPath:[NSIndexPath indexPathForItem:(NSInteger) index inSection:0]];
    attr.center = CGPointMake(offset.x + element.center.x, offset.y + element.center.y);
    attr.element = element;
    attr.size = element.size;
    attr.alpha = 1;

    NSArray *effects;
    BOOL exitingPage = offset.x > page * pageSize.width;
    BOOL exitingPreviousPage = offset.x > page-1 * pageSize.width;

    BOOL exiting = NO;

    if (page==element.inPage && !exitingPage)
        effects = element.inEffects;

    else if (page-1==element.outPage && exitingPreviousPage)
    {
        effects = element.outEffects;
        progress = 1 - progress;
        exiting = YES;
        page = page -1;
    }
    else
        effects = element.paginationEffects;

    if (effects==nil)
        return attr;

    if ([effects containsObject:@(ESConveyorEffectParallax10)])
        [self doParallax:page pageSize:pageSize progress:progress attr:attr ratio:10 direction:exiting element:element];

    if ([effects containsObject:@(ESConveyorEffectParallax20)])
        [self doParallax:page pageSize:pageSize progress:progress attr:attr ratio:5 direction:exiting element:element];

    if ([effects containsObject:@(ESConveyorEffectParallax33)])
        [self doParallax:page pageSize:pageSize progress:progress attr:attr ratio:3.3 direction:exiting element:element];

    if ([effects containsObject:@(ESConveyorEffectParallax40)])
        [self doParallax:page pageSize:pageSize progress:progress attr:attr ratio:2.5 direction:exiting element:element];

    if ([effects containsObject:@(ESConveyorEffectParallax50)])
        [self doParallax:page pageSize:pageSize progress:progress attr:attr ratio:2 direction:exiting element:element];

    if ([effects containsObject:@(ESConveyorEffectParallax150)])
        [self doParallax:page pageSize:pageSize progress:progress attr:attr ratio:0.75 direction:exiting element:element];

    if ([effects containsObject:@(ESConveyorEffectParallax200)])
        [self doParallax:page pageSize:pageSize progress:progress attr:attr ratio:0.5 direction:exiting element:element];

    if ([effects containsObject:@(ESConveyorEffectFade)])
    {
        attr.alpha = progress;
    }

    if ([effects containsObject:@(ESConveyorEffectEdgeTop)])
    {
        CGFloat start = - element.size.height / 2;
        CGFloat current = offset.y + ((element.center.y - start) * progress) + start;
        CGPoint newCenter = attr.center;
        newCenter.y = current;
        attr.center = newCenter;
    }

    if ([effects containsObject:@(ESConveyorEffectEdgeLeft)])
    {
        CGFloat start = - (element.size.width / 2);
        CGFloat current = ((element.center.x - start) * progress) + start;
        CGPoint newCenter = attr.center;
        newCenter.x = offset.x +current;
        attr.center = newCenter;
    }

    if ([effects containsObject:@(ESConveyorEffectEdgeRight)])
    {
        CGFloat start = pageSize.width + (element.size.width / 2);
        CGFloat current = ((element.center.x - start) * progress) + start;
        CGPoint newCenter = attr.center;
        newCenter.x =  offset.x +current;
        attr.center = newCenter;
    }

    if ([effects containsObject:@(ESConveyorEffectEdgeBottom)])
    {
        CGFloat start = pageSize.height + (element.size.height / 2);
        CGFloat current = ((element.center.y - start) * progress) + start;
        CGPoint newCenter = attr.center;
        newCenter.y =  offset.y + current;
        attr.center = newCenter;
    }

    return attr;
}


- (void)doParallax:(NSUInteger)page pageSize:(CGSize)pageSize progress:(CGFloat)progress attr:(UICollectionViewLayoutAttributes *)attr ratio:(CGFloat)speed direction:(BOOL)exiting element:(ESConveyorElement *)element
{
    CGFloat pixelsPerPage = pageSize.width / speed;
    CGFloat pixelsToMove = ((NSInteger)page - element.inPage) * pixelsPerPage;
    pixelsToMove = pixelsToMove - ( (pixelsPerPage * (1-progress)) * (exiting ? -1 : 1 ));

    CGPoint newCenter = attr.center;
    newCenter.x = newCenter.x - pixelsToMove;
    attr.center = newCenter;
}


@end
