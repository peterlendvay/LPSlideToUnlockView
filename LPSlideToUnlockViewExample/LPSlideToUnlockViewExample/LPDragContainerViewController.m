//
//  ViewController.m
//  dragViewButton
//
//  Created by Peter Lendvay on 2015. 07. 10..
//  Copyright (c) 2015. Peter Lendvay. All rights reserved.
//

#import "LPDragContainerViewController.h"
#import "LPSlideView.h"

@interface LPDragContainerViewController () <LPSlideContainerViewDelegate>

@end

@implementation LPDragContainerViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.dragContainerView.delegate = self;
    [self.dragContainerView shouldBeRounded:YES];
    [self.dragContainerView createShadowOnDragViewWithOpacity:0.7 Offset:CGSizeMake(0, 1)];
    [self.dragContainerView createBorderWithColor:[UIColor blackColor] Width:1];
    [self.dragContainerView setCenterLabelOnDragViewVisible:NO];
    
    self.slideRightToUnlock.delegate = self;
    [self.slideRightToUnlock createBorderOnDragViewWithColor:[UIColor blackColor] Width:1];
    [self.slideRightToUnlock setBackgroundColorForDragView:[UIColor greenColor]];
    [self.slideRightToUnlock setText:@"Pull Right" ForCenterLabelOnDragViewWithColor:[UIColor redColor] WithFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:16.0]];
    [self.slideRightToUnlock setBottomLabelOnDragViewVisible:NO];
    [self.slideRightToUnlock setTopLabelOnDragViewVisible:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dragViewWasPulledToTheBottom{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Pulled to the end."
                                  message:@"The LPSlideView has been pulled all the way."
                                  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             //Do some thing here
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
