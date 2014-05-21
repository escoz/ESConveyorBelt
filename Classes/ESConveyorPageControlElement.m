//
// Created by Eduardo Scoz on 6/8/13.
// Copyright (c) 2013 ESCOZ. All rights reserved.
//

#import "ESConveyorPageControlElement.h"


@interface ESConveyorPageControlElement ()
@property(nonatomic, strong) UIPageControl *pageControl;
@end

@implementation ESConveyorPageControlElement
{

}
- (id)initWithClass:(Class)pClass center:(CGPoint)center
{
    if (self = [super init])
    {
        self.center = center;
        self.size = CGSizeMake(300, 44);

        self.pageControl = [pClass new];
        self.pageControl.frame = CGRectMake(0, 0, self.size.width, self.size.height);
        self.pageControl.numberOfPages = 10;
        self.pageControl.currentPage = 1;
        self.view = self.pageControl;
        
    }
    return self;
}

- (void)updateForPage:(NSUInteger)page totalPages:(NSInteger)numberOfPages progress:(CGFloat)progress offset:(CGPoint)offset
{
    [super updateForPage:page totalPages:numberOfPages progress:progress offset:offset];

    NSUInteger newPage = progress > 0.5f? page : page - 1;
    self.pageControl.currentPage = newPage <= 0 ? 0 : (NSInteger)newPage;
    self.pageControl.numberOfPages = numberOfPages;
}

@end