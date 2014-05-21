//
// Created by Eduardo Scoz on 6/8/13.
// Copyright (c) 2013 ESCOZ. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString *const ESConveyorElementKind;

@interface ESConveyorElement : NSObject

@property(nonatomic) CGSize size;
@property(nonatomic) CGPoint center;
@property(nonatomic, strong) UIColor *color;
@property(nonatomic, strong) UIView *view;

@property(nonatomic, strong) NSArray *inEffects;
@property(nonatomic, strong) NSArray *outEffects;

@property(nonatomic) NSInteger inPage;
@property(nonatomic) NSInteger outPage;


@property(nonatomic, strong) NSArray *paginationEffects;

+ (ESConveyorElement *)elementForImageNamed:(NSString *)string;
+ (ESConveyorElement *)elementForImageNamed:(NSString *)imageName center:(CGPoint)center;

+ (ESConveyorElement *)elementForImage:(UIImage *)image center:(CGPoint)center;

+ (ESConveyorElement *)elementForButtonOfClass:(Class)pClass title:(NSString *)title target:(id)target action:(SEL)action center:(CGPoint)center;
+ (ESConveyorElement *)elementForLabelOfClass:(Class)pClass text:(NSString *)text center:(CGPoint)center size:(CGSize)size;

- (void)setEffects:(NSArray *)effects;

- (void)setInEffects:(NSArray *)inEffects outEffects:(NSArray *)effects;
- (void)setPage:(NSInteger)page;

- (void)updateForPage:(NSUInteger)page totalPages:(NSInteger)pages progress:(CGFloat)progress offset:(CGPoint)offset;

- (BOOL)isVisibleInPage:(NSUInteger)page;
@end