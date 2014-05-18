//
// Created by Eduardo Scoz on 6/8/13.
// Copyright (c) 2013 ESCOZ. All rights reserved.
//

#import "ESConveyorView.h"
#import "ESConveyorElement.h"


@interface ESConveyorView ()
@property(nonatomic, strong) UIView *currentView;
@end

@implementation ESConveyorView
{

}

- (void)setCarrousselObject:(ESConveyorElement *)object
{
    self.backgroundColor = object.color;
    if (self.currentView==object.view)
        return;

    [object.view removeFromSuperview];
    self.currentView = object.view;
    [self addSubview:object.view];
    [self bringSubviewToFront:object.view];
}

- (void)prepareForReuse
{
    [super prepareForReuse];

    [self.currentView removeFromSuperview];
    self.currentView = nil;
}

@end