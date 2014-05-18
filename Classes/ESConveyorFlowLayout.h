//
// Created by Eduardo Scoz on 6/8/13.
// Copyright (c) 2013 ESCOZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ESConveyorElement;
@class ESConveyorAdapter;
@class EZConveyorEffects;


@interface ESConveyorFlowLayout : UICollectionViewFlowLayout


@property(nonatomic, weak) ESConveyorAdapter *adapter;
@end