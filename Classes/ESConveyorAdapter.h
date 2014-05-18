//
// Created by Eduardo Scoz on 6/8/13.
// Copyright (c) 2013 ESCOZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ESConveyorController;


@interface ESConveyorAdapter : NSObject <UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic) NSInteger numberOfPages;

@property(nonatomic, strong) NSArray *elements;

- (id)initWithCollectionView:(UICollectionView *)collectionView numberOfPages:(NSInteger)pages elements:(NSArray *)elements;

@end