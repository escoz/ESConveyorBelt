//
// Created by Eduardo Scoz on 5/17/14.
// Copyright (c) 2014 ESCOZ. All rights reserved.
//

#import "ESConveyorBelt.h"
#import "ESConveyorSample2Builder.h"
#import "ESConveyorSampleViewController.h"

@implementation ESConveyorSample2Builder


+ (NSArray *)buildTutorialWithTarget:(id)target
{

    [UIPageControl appearance].pageIndicatorTintColor = [UIColor blueColor];
    [UIPageControl appearance].currentPageIndicatorTintColor = [UIColor greenColor];

    ESConveyorElement *bt1 = [ESConveyorElement elementForButtonOfClass:[UIButton class] title:@"Here's my button" target:target action:@selector(buttonAction:) center:CGPointMake(270, 540)];
    bt1.inEffects = @[@(ESConveyorEffectEdgeBottom)];
    bt1.outEffects = @[@(ESConveyorEffectEdgeBottom)];
    bt1.inPage = 1;
    bt1.outPage = 2;

    ESConveyorElement *p1 = [ESConveyorElement elementForImageNamed:@"goldengate.jpg"];
    p1.center = CGPointMake(p1.center.x - 80, p1.center.y);
    [p1 setInEffects:@[@(ESConveyorEffectFade), @(ESConveyorEffectParallax20)] outEffects:@[@(ESConveyorEffectParallax20), @(ESConveyorEffectFade)]];
    p1.paginationEffects = @[@(ESConveyorEffectParallax20)];
    p1.inPage = 0;
    p1.outPage = 2;

    ESConveyorElement *p2 = [ESConveyorElement elementForImageNamed:@"bacon" center:CGPointMake(400, 100)];
    [p2 setEffects:@[@(ESConveyorEffectFade), @(ESConveyorEffectParallax20)]];
    p2.paginationEffects = @[ @(ESConveyorEffectParallax20)];
    p2.inPage = 0;
    p2.outPage = 3;

    ESConveyorElement *p3 = [ESConveyorElement elementForImageNamed:@"bacon" center:CGPointMake(400, 240)];
    [p3 setEffects:@[@(ESConveyorEffectParallax33), @(ESConveyorEffectFade)]];
    p3.paginationEffects = @[ @(ESConveyorEffectParallax33)];
    p3.inPage = 0;
    p3.outPage = 2;

    ESConveyorElement *p4 = [ESConveyorElement elementForImageNamed:@"bacon" center:CGPointMake(400, 380)];
    [p4 setEffects:@[@(ESConveyorEffectParallax40), @(ESConveyorEffectFade)]];
    p4.paginationEffects = @[ @(ESConveyorEffectParallax40)];
    p4.inPage = 0;
    p4.outPage = 1;

    ESConveyorElement *p5 = [ESConveyorElement elementForImageNamed:@"bacon" center:CGPointMake(400, 520)];
    [p5 setEffects:@[@(ESConveyorEffectParallax50), @(ESConveyorEffectFade)]];
    p5.paginationEffects = @[ @(ESConveyorEffectParallax50)];
    p5.inPage = 0;
    p5.outPage = 0;

    ESConveyorElement *p6 = [ESConveyorElement elementForImageNamed:@"bacon" center:CGPointMake(150, 400)];
    [p6 setEffects:@[@(ESConveyorEffectParallax200), @(ESConveyorEffectFade)]];
    p6.paginationEffects = @[@(ESConveyorEffectParallax200)];
    p6.page = 0;
    p6.outPage = 2;

    ESConveyorElement *p7 = [ESConveyorElement elementForImageNamed:@"bacon" center:CGPointMake(150, 520)];
    [p7 setEffects:@[@(ESConveyorEffectParallax150), @(ESConveyorEffectFade)]];
    p7.paginationEffects = @[ @(ESConveyorEffectParallax150)];
    p7.page = 0;
    p7.outPage = 2;

    ESConveyorElement *bacon1 = [ESConveyorElement elementForImageNamed:@"bacon" center:CGPointMake(150, 400)];
    bacon1.inEffects = @[@(ESConveyorEffectEdgeBottom), @(ESConveyorEffectFade)];
    bacon1.outEffects = @[@(ESConveyorEffectFade)];
    bacon1.page = 4;
    ESConveyorElement *bacon2 = [ESConveyorElement elementForImageNamed:@"bacon" center:CGPointMake(150, 200)];
    bacon2.inEffects = @[@(ESConveyorEffectEdgeTop), @(ESConveyorEffectFade)];
    bacon2.outEffects = @[@(ESConveyorEffectFade)];
    bacon2.page = 4;
    ESConveyorElement *bacon3 = [ESConveyorElement elementForImageNamed:@"bacon" center:CGPointMake(350, 200)];
    bacon3.inEffects = @[@(ESConveyorEffectEdgeLeft), @(ESConveyorEffectFade)];
    bacon3.outEffects = @[@(ESConveyorEffectFade)];
    bacon3.page = 4;
    ESConveyorElement *bacon4 = [ESConveyorElement elementForImageNamed:@"bacon" center:CGPointMake(350, 400)];
    bacon4.inEffects = @[@(ESConveyorEffectEdgeRight), @(ESConveyorEffectFade)];
    bacon4.outEffects = @[@(ESConveyorEffectFade)];
    bacon4.page = 4;

    ESConveyorPageControlElement *pagination = [[ESConveyorPageControlElement alloc] initWithClass:[UIPageControl class] center:CGPointMake(270, 600)];
    pagination.inPage = 0;
    pagination.outPage = 5;
    [pagination setInEffects:@[@(ESConveyorEffectFade)] outEffects:nil];

    NSArray *elements = @[p1, p2, p3, p4, p5, p6, p7, bt1, bacon1, bacon2, bacon3, bacon4,  pagination];
    return elements;
}

@end