//
//  DragCointainerView.h
//  dragViewButton
//
//  Created by Peter Lendvay on 2015. 07. 13..
//  Copyright (c) 2015. Peter Lendvay. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LPSlideView;

@protocol LPSlideContainerViewDelegate;

@interface LPSlideContainerView : UIView

@property (weak, nonatomic) id<LPSlideContainerViewDelegate> delegate;

@property (strong, nonatomic) LPSlideView* dragView;

-(void)shouldBeRounded:(BOOL)boolean;

-(void)createShadowOnDragViewWithOpacity:(float)opacity Offset:(CGSize)offset;

-(void)createBorderWithColor:(UIColor*)borderColor Width:(NSInteger)width;
-(void)createBorderOnDragViewWithColor:(UIColor*)borderColor Width:(NSInteger)width;

-(void)setTopLabelOnDragViewVisible:(BOOL)boolean;
-(void)setText:(NSString*)text ForTopLabelOnDragViewWithColor:(UIColor*)color WithFont:(UIFont*)font;

-(void)setBottomLabelOnDragViewVisible:(BOOL)boolean;
-(void)setText:(NSString*)text ForBottomLabelOnDragViewWithColor:(UIColor*)color WithFont:(UIFont*)font;

-(void)setCenterLabelOnDragViewVisible:(BOOL)boolean;
-(void)setText:(NSString*)text ForCenterLabelOnDragViewWithColor:(UIColor*)color WithFont:(UIFont*)font;


-(void)setBackgroundColorForDragView:(UIColor *)backgroundColor;

@end


@protocol LPSlideContainerViewDelegate <NSObject>

@optional
-(void)dragViewWasPulledToTheBottom;

@end