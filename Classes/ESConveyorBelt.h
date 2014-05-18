//
// Created by Eduardo Scoz on 6/8/13.
// Copyright (c) 2013 ESCOZ. All rights reserved.
//

#import "ESConveyorController.h"
#import "ESConveyorPageCell.h"
#import "ESConveyorElement.h"
#import "ESConveyorPageControlElement.h"
#import "ESConveyorController.h"


typedef NS_ENUM(NSUInteger, EZEffect) {
    ESConveyorEffectFade,
    ESConveyorEffectEdgeTop,
    ESConveyorEffectEdgeLeft,
    ESConveyorEffectEdgeRight,
    ESConveyorEffectEdgeBottom,
    ESConveyorEffectParallax10,
    ESConveyorEffectParallax20,
    ESConveyorEffectParallax33,
    ESConveyorEffectParallax40,
    ESConveyorEffectParallax50,
    ESConveyorEffectParallax150,
    ESConveyorEffectParallax200
};

