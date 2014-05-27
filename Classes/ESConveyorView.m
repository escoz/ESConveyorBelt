//
// Created by Eduardo Scoz on 6/8/13.
// Copyright (c) 2013 ESCOZ. All rights reserved.
//

#import "ESConveyorView.h"
#import "ESConveyorElement.h"
#import "ESConveyorBeltAttributes.h"


@interface ESConveyorView ()
@property(nonatomic, strong) UIView *currentView;
@end

@implementation ESConveyorView
{

}

- (void)setCurrentView:(UIView *)currentView
{
    if (_currentView == currentView)
        return;
    
    if (_currentView!=nil)
        [_currentView removeFromSuperview];

    _currentView = currentView;

    [self addSubview:_currentView];
    [self setNeedsLayout];
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    ESConveyorBeltAttributes *attrs = (ESConveyorBeltAttributes *) layoutAttributes;
    [super applyLayoutAttributes:layoutAttributes];
    self.currentView = attrs.element.view;
}

@end