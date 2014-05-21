//
// Created by Eduardo Scoz on 6/8/13.
// Copyright (c) 2013 ESCOZ. All rights reserved.
//

#import "ESConveyorElement.h"
#import "ESConveyorBelt.h"

NSString *const ESConveyorElementKind = @"ESConveyorElement";

@implementation ESConveyorElement
{

}

+ (ESConveyorElement *)elementForImageNamed:(NSString *)imageName center:(CGPoint)center
{
    ESConveyorElement *result = [ESConveyorElement new];
    UIImage *image = [UIImage imageNamed:imageName];
    result.view = [[UIImageView alloc] initWithImage:image];
    result.center = center;
    result.size = image.size;
    result.color = [UIColor clearColor];
    return result;
}


+ (ESConveyorElement *)elementForImage:(UIImage *)image center:(CGPoint)center
{
    ESConveyorElement *result = [ESConveyorElement new];
    result.view = [[UIImageView alloc] initWithImage:image];
    result.center = center;
    result.size = image.size;
    result.color = [UIColor clearColor];
    return result;
}

+ (ESConveyorElement *)elementForView:(UIView *)view center:(CGPoint)center
{
    ESConveyorElement *result = [ESConveyorElement new];
    result.view = view;
    result.center = center;
    result.size = view.frame.size;
    result.color = [UIColor clearColor];
    return result;
}

+ (ESConveyorElement *)elementForButtonOfClass:(Class)pClass title:(NSString *)title target:(id)target action:(SEL)action center:(CGPoint)center
{
    ESConveyorElement *result = [ESConveyorElement new];

    UIButton *button = [pClass new];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    result.view = button;
    result.center = center;
    [button setTitle:title forState:UIControlStateNormal];
    [button sizeToFit];
    result.size = button.frame.size;
    return result;
}


+ (ESConveyorElement *)elementForLabelOfClass:(Class)pClass text:(NSString *)text center:(CGPoint)center size:(CGSize)size
{
    ESConveyorElement *result = [ESConveyorElement new];

    UILabel *label = [pClass new];
    label.frame = CGRectMake(0, 0, size.width, size.height);
    result.view = label;
    result.center = center;
    result.size = size;
    label.backgroundColor = [UIColor clearColor];
    label.text = text;
    return result;
}

- (void)setEffects:(NSArray *)effects
{
    [self setInEffects:effects outEffects:effects];

}
- (void)setInEffects:(NSArray *)inEffects outEffects:(NSArray *)effects
{
    self.inEffects = inEffects;
    self.outEffects = effects;
}

+ (ESConveyorElement *)elementForImageNamed:(NSString *)string
{
    ESConveyorElement *element = [self elementForImageNamed:string center:CGPointZero];
    UIImageView *imageView = (UIImageView *) element.view;
    element.center = CGPointMake(imageView.image.size.width / 2 , imageView.image.size.height / 2);
    return element;
}

- (void)setPage:(NSInteger)page
{
    self.inPage = page;
    self.outPage = page;
}

- (void)updateForPage:(NSUInteger)page totalPages:(NSInteger)pages progress:(CGFloat)progress offset:(CGPoint)offset
{
    // do nothing
}

- (BOOL)isVisibleInPage:(NSUInteger)page
{
    return page >= self.inPage && page <= self.outPage + 1;
}

@end
