//
//  ViewController.h
//  dragViewButton
//
//  Created by Peter Lendvay on 2015. 07. 10..
//  Copyright (c) 2015. Peter Lendvay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LPSlideContainerView.h"

@interface LPDragContainerViewController : UIViewController

@property (weak, nonatomic) IBOutlet LPSlideContainerView *dragContainerView;
@property (weak, nonatomic) IBOutlet LPSlideContainerView *slideRightToUnlock;

@end

