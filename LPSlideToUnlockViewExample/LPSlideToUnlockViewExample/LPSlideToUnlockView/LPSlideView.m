//
//  dragView.m
//  dragViewButton
//
//  Created by Peter Lendvay on 2015. 07. 10..
//  Copyright (c) 2015. Peter Lendvay. All rights reserved.
//

#import "LPSlideView.h"

@interface LPSlideView ()


@end

@implementation LPSlideView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self =[ [[NSBundle mainBundle] loadNibNamed:@"LPSlideView" owner:self options:nil]firstObject];
        self.frame = frame;
    }
    return self;
}

-(void)shouldBeRounded:(BOOL)boolean{
    self.layer.cornerRadius = boolean ? self.frame.size.width/2 : 0;
}

-(void)createShadowWithOpacity:(float)opacity Offset:(CGSize)offset{
    self.layer.shadowOffset = offset;
    self.layer.shadowOpacity = opacity;
}

-(void)createBorderWithColor:(UIColor*)borderColor Width:(NSInteger)width{
    self.layer.borderColor = [borderColor CGColor];
    self.layer.borderWidth = width;
}

-(void)setTopLabelVisible:(BOOL)boolean{
    self.topLabel.hidden = !boolean;
}
-(void)setText:(NSString*)text ForTopLabelWithColor:(UIColor*)color WithFont:(UIFont*)font{
    self.topLabel.font = font;
    self.topLabel.textColor = color;
    self.topLabel.text = text;
}

-(void)setBottomLabelVisible:(BOOL)boolean{
    self.bottomLabel.hidden = !boolean;
}
-(void)setText:(NSString*)text ForBottomLabelWithColor:(UIColor*)color WithFont:(UIFont*)font{
    self.bottomLabel.font = font;
    self.bottomLabel.textColor = color;
    self.bottomLabel.text = text;
}

-(void)setCenterLabelVisible:(BOOL)boolean{
    self.centerLabel.hidden = !boolean;
}

-(void)setText:(NSString*)text ForCenterLabelWithColor:(UIColor*)color WithFont:(UIFont*)font{
    self.centerLabel.font = font;
    self.centerLabel.textColor = color;
    self.centerLabel.text = text;
}


@end
