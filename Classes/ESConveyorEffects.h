//
// Created by Eduardo Scoz on 6/8/13.
// Copyright (c) 2013 ESCOZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ESConveyorElement;


@interface ESConveyorEffects : NSObject

- (UICollectionViewLayoutAttributes *)getAttributesForPage:(NSUInteger)page atOffset:(CGPoint)offset pageWidth:(CGSize)pageSize index:(NSUInteger)index progress:(CGFloat)progress element:(ESConveyorElement *)element;

@end
