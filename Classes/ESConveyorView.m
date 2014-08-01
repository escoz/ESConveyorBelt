//
// Created by Eduardo Scoz on 6/8/13.
// Copyright (c) 2013 ESCOZ. All rights reserved.
//

#import "ESConveyorView.h"
#import "ESConveyorElement.h"
#import "ESConveyorBeltAttributes.h"


@interface ESConveyorView ()
@end

@implementation ESConveyorView
{

}

- (void)setCurrentView:(UIView *)currentView
{
    for (UIView *view in self.subviews)
        [view removeFromSuperview];


    [self addSubview:currentView];
    [self setNeedsLayout];
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    ESConveyorBeltAttributes *attrs = (ESConveyorBeltAttributes *) layoutAttributes;
    [super applyLayoutAttributes:layoutAttributes];
    self.currentView = attrs.element.view;
}

@end