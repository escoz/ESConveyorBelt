//
// Created by Eduardo Scoz on 6/8/13.
// Copyright (c) 2013 ESCOZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ESConveyorAdapter;


@interface ESConveyorController : UICollectionViewController
@property(nonatomic, strong) ESConveyorAdapter *adapter;

- (id)initWithPages:(NSInteger)numberOfPages elements:(NSArray *)elements;

- (void)scrollToNextPage;
@end