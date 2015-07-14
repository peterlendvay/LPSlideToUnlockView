//
//  dragView.h
//  dragViewButton
//
//  Created by Peter Lendvay on 2015. 07. 10..
//  Copyright (c) 2015. Peter Lendvay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPSlideView : UIView

@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UILabel *centerLabel;


-(void)shouldBeRounded:(BOOL)boolean;
-(void)createShadowWithOpacity:(float)opacity Offset:(CGSize)offset;
-(void)createBorderWithColor:(UIColor*)borderColor Width:(NSInteger)width;


-(void)setTopLabelVisible:(BOOL)boolean;
-(void)setText:(NSString*)text ForTopLabelWithColor:(UIColor*)color WithFont:(UIFont*)font;

-(void)setBottomLabelVisible:(BOOL)boolean;
-(void)setText:(NSString*)text ForBottomLabelWithColor:(UIColor*)color WithFont:(UIFont*)font;

-(void)setCenterLabelVisible:(BOOL)boolean;
-(void)setText:(NSString*)text ForCenterLabelWithColor:(UIColor*)color WithFont:(UIFont*)font;

@end
