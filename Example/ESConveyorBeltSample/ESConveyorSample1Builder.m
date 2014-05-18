//
// Created by Eduardo Scoz on 5/17/14.
// Copyright (c) 2014 ESCOZ. All rights reserved.
//

#import "ESConveyorSample1Builder.h"
#import "ESConveyorBelt.h"
#import "ESConveyorSampleViewController.h"

@interface ESTitleLabel : UILabel
@end
@implementation ESTitleLabel
- (id)init
{
    self = [super init];
    if (self) {
        self.font = [UIFont fontWithName:@"Noteworthy-Bold" size:40];
        self.textAlignment = NSTextAlignmentCenter;
        self.layer.shadowColor = [UIColor colorWithRed:0.6291 green:0.6290 blue:0.6291 alpha:1.0000].CGColor;
        self.layer.shadowOffset = CGSizeMake(2, 2);
        self.layer.shadowRadius = 1.0f;
        self.layer.shadowOpacity = 1.0f;
    }
    return self;
}
@end

@interface ESCloseButton : UIButton
@end
@implementation ESCloseButton
- (id)init
{
    self = [super init];
    if (self) {
        self.titleLabel.font = [UIFont fontWithName:@"Noteworthy-Bold" size:40];
        self.layer.shadowColor = [UIColor colorWithRed:0.6291 green:0.6290 blue:0.6291 alpha:1.0000].CGColor;
        self.layer.shadowOffset = CGSizeMake(2, 2);
        self.layer.shadowRadius = 1.0f;
        self.layer.shadowOpacity = 1.0f;
    }
    return self;
}

@end

@implementation ESConveyorSample1Builder


+ (NSArray *)buildTutorialWithTarget:(id)target
{
    [[UIButton appearance] setTitleColor:[UIColor colorWithRed:0.4237 green:0.2847 blue:0.1927 alpha:1.0000] forState:UIControlStateNormal];

    [UIPageControl appearance].pageIndicatorTintColor = [UIColor colorWithRed:0.4237 green:0.2847 blue:0.1927 alpha:1.0000];
    [UIPageControl appearance].currentPageIndicatorTintColor = [UIColor colorWithRed:0.1328 green:0.6916 blue:0.8866 alpha:1.0000];


    ESConveyorElement *title1 = [ESConveyorElement elementForLabelOfClass:[ESTitleLabel class] text:@"It's beach time!" center:CGPointMake(270, 60) size:CGSizeMake(440, 60)];
    [title1 setInEffects:@[@(ESConveyorEffectEdgeTop)] outEffects: @[@(ESConveyorEffectFade)]];
    title1.page = 0;
    ((UILabel *)title1.view).textColor = [UIColor colorWithRed:0.4237 green:0.2847 blue:0.1927 alpha:1.0000];

    ESConveyorElement *title2 = [ESConveyorElement elementForLabelOfClass:[ESTitleLabel class] text:@"How about a Drink?" center:CGPointMake(270, 60) size:CGSizeMake(440, 60)];
    [title2 setInEffects:@[@(ESConveyorEffectFade)] outEffects:@[@(ESConveyorEffectEdgeTop)]];
    title2.page = 1;
    ((UILabel *)title2.view).textColor = [UIColor colorWithRed:0.4237 green:0.2847 blue:0.1927 alpha:1.0000];

    ESConveyorElement *title3 = [ESConveyorElement elementForLabelOfClass:[ESTitleLabel class] text:@"Take your shoes off!" center:CGPointMake(270, 520) size:CGSizeMake(440, 60)];
    [title3 setInEffects:@[@(ESConveyorEffectEdgeBottom), @(ESConveyorEffectFade)] outEffects:@[@(ESConveyorEffectEdgeLeft)]];
    title3.page = 2;
    ((UILabel *)title3.view).textColor = [UIColor colorWithRed:0.1328 green:0.6916 blue:0.8866 alpha:1.0000];

    ESConveyorElement *title4 = [ESConveyorElement elementForLabelOfClass:[ESTitleLabel class] text:@"Lets ride the waves, man!" center:CGPointMake(270, 520) size:CGSizeMake(440, 60)];
    [title4 setInEffects:@[@(ESConveyorEffectEdgeRight)] outEffects:@[@(ESConveyorEffectFade)]];
    title4.page = 3;
    ((UILabel *)title4.view).textColor = [UIColor colorWithRed:0.1328 green:0.6916 blue:0.8866 alpha:1.0000];

    ESConveyorElement *bg = [ESConveyorElement elementForImageNamed:@"beach_bg"];
    bg.inEffects = @[@(ESConveyorEffectParallax10), @(ESConveyorEffectFade)];
    bg.outEffects = @[@(ESConveyorEffectParallax10), @(ESConveyorEffectFade)];
    bg.paginationEffects = @[@(ESConveyorEffectParallax10)];
    bg.inPage = 0;
    bg.outPage = 4;

    ESConveyorElement *img1 = [ESConveyorElement elementForImageNamed:@"umbrella" center:CGPointMake(260, 200)];
    img1.inEffects = @[@(ESConveyorEffectEdgeBottom), @(ESConveyorEffectFade)];
    img1.outEffects = @[@(ESConveyorEffectFade)];
    img1.page = 0;
    ESConveyorElement *img2 = [ESConveyorElement elementForImageNamed:@"cocktail" center:CGPointMake(150, 200)];
    img2.inEffects = @[@(ESConveyorEffectEdgeTop), @(ESConveyorEffectFade)];
    img2.outEffects = @[@(ESConveyorEffectFade)];
    img2.page = 1;
    ESConveyorElement *img3 = [ESConveyorElement elementForImageNamed:@"flip_flops" center:CGPointMake(350, 400)];
    img3.inEffects = @[@(ESConveyorEffectEdgeLeft), @(ESConveyorEffectFade)];
    img3.outEffects = @[@(ESConveyorEffectFade)];
    img3.page = 2;
    ESConveyorElement *img4 = [ESConveyorElement elementForImageNamed:@"surfboard" center:CGPointMake(300, 400)];
    img4.inEffects = @[@(ESConveyorEffectEdgeRight), @(ESConveyorEffectFade)];
    img4.outEffects = @[@(ESConveyorEffectFade)];
    img4.page = 3;

    ESConveyorElement *btExit = [ESConveyorElement elementForButtonOfClass:[ESCloseButton class] title:@"Lets go!" target:target action:@selector(buttonAction:) center:CGPointMake(270, 240)];
    [btExit setInEffects:@[@(ESConveyorEffectEdgeBottom)] outEffects:@[@(ESConveyorEffectEdgeBottom)]];
    btExit.inPage = 4;
    btExit.outPage = 4;

    ESConveyorPageControlElement *pagination = [[ESConveyorPageControlElement alloc] initWithClass:[UIPageControl class] center:CGPointMake(270, 580)];
    pagination.inPage = 0;
    pagination.outPage = 5;
    [pagination setInEffects:@[@(ESConveyorEffectFade)] outEffects:nil];

    NSArray *elements = @[bg, title1, img1, title2, img2, title3, img3, title4, img4, pagination, btExit];
    return elements;
}

@end