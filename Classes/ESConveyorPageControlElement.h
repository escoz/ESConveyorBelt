//
// Created by Eduardo Scoz on 6/8/13.
// Copyright (c) 2013 ESCOZ. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "ESConveyorElement.h"


@interface ESConveyorPageControlElement : ESConveyorElement

@property(nonatomic, strong) UIPageControl *pageControl;

- (id)initWithClass:(Class)pClass center:(CGPoint)center;
@end