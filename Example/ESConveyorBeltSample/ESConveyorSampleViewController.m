//
// Created by Eduardo Scoz on 5/17/14.
// Copyright (c) 2014 ESCOZ. All rights reserved.
//

#import "ESConveyorSampleViewController.h"
#import "ESConveyorBelt.h"
#import "ESConveyorSample1Builder.h"
#import "ESConveyorSample2Builder.h"

@implementation ESConveyorSampleViewController
{

}

#pragma mark - Sample Actions

- (void)loadView
{
    [super loadView];
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 44)];
    [button1 setTitle:@"Sample 1" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(handleSample1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];


    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 44)];
    [button2 setTitle:@"Sample 2" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(handleSample2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];

    self.view.backgroundColor = [UIColor lightGrayColor];
    self.view.tintColor = [UIColor blueColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self performSelector:@selector(handleSample1) withObject:nil afterDelay:0.1];
}


-(void)handleSample1
{
    NSArray *elements = [ESConveyorSample1Builder buildTutorialWithTarget:self];
    UIViewController *controller = [[ESConveyorController alloc] initWithPages:5 elements:elements];
    controller.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:controller animated:YES completion:nil];
}

-(void)handleSample2
{
    NSArray *elements = [ESConveyorSample2Builder buildTutorialWithTarget:self];
    UIViewController *controller = [[ESConveyorController alloc] initWithPages:6 elements:elements];
    controller.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:controller animated:YES completion:nil];
}


- (void)buttonAction:(id)buttonAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end