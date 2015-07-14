//
//  DragCointainerView.m
//  dragViewButton
//
//  Created by Peter Lendvay on 2015. 07. 13..
//  Copyright (c) 2015. Peter Lendvay. All rights reserved.
//

#import "LPSlideContainerView.h"
#import "LPSlideView.h"



@interface LPSlideContainerView()

@property (nonatomic) CGPoint prevPoint;
@property (nonatomic) float totalDifference;

@property (nonatomic) BOOL isRounded;
@property (nonatomic) BOOL isPortrait;

@end

@implementation LPSlideContainerView

- (void)layoutSubviews{
    [super layoutSubviews];
    self.isRounded = NO;
    if (!self.dragView) {
        if (self.frame.size.width<self.frame.size.height) {
            self.dragView = [[LPSlideView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
            [self addSubview:self.dragView];
            self.isPortrait = YES;
        }else{
            self.dragView = [[LPSlideView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)];
            [self addSubview:self.dragView];
            self.isPortrait = NO;
        }
        
    }

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if ([touch view] == self.dragView) {
        CGPoint location = [touch locationInView:self];
        self.prevPoint = location;
        self.totalDifference = 0;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    if ([touch view] == self.dragView) {
        float difference;
        if (self.dragView.frame.origin.y >= 0 && self.dragView.frame.origin.y<=self.frame.size.height-self.dragView.frame.size.height) {
            CGPoint location = [touch locationInView:self];
            if (self.isPortrait) {
                if (location.y > self.prevPoint.y) {
                    difference =location.y-self.prevPoint.y ;
                    self.totalDifference += difference;
                    if (self.totalDifference > self.frame.size.height - self.dragView.frame.size.height) {
                        self.dragView.frame = CGRectMake(self.dragView.frame.origin.x, self.frame.size.height - self.dragView.frame.size.height, self.dragView.frame.size.width, self.dragView.frame.size.height);
                    }else{
                        self.dragView.frame = CGRectMake(self.dragView.frame.origin.x, self.dragView.frame.origin.y+(difference), self.dragView.frame.size.width, self.dragView.frame.size.height);
                    }
                }
            }else{
                if (location.x > self.prevPoint.x) {
                    difference =location.x-self.prevPoint.x ;
                    self.totalDifference += difference;
                    if (self.totalDifference > self.frame.size.width - self.dragView.frame.size.width) {
                        self.dragView.frame = CGRectMake(self.frame.size.width - self.dragView.frame.size.width, self.dragView.frame.origin.y, self.dragView.frame.size.width, self.dragView.frame.size.height);
                    }else{
                        self.dragView.frame = CGRectMake(self.dragView.frame.origin.x+difference, self.dragView.frame.origin.y, self.dragView.frame.size.width, self.dragView.frame.size.height);
                    }
                }
                
            }
            self.prevPoint = location;
        }
        
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    id<LPSlideContainerViewDelegate> strongDelegate = self.delegate;
    if (self.isPortrait) {
        if (!(self.dragView.frame.origin.y < self.frame.size.height-self.dragView.frame.size.height)) {
            if ([strongDelegate respondsToSelector:@selector(dragViewWasPulledToTheBottom)]) {
                [strongDelegate dragViewWasPulledToTheBottom];
            };
        }
        [UIView animateWithDuration:0.3 animations:^{
            self.dragView.frame = CGRectMake(0, 0, self.dragView.frame.size.width, self.dragView.frame.size.height);
        }];
    }else{
        if (!(self.dragView.frame.origin.x < self.frame.size.width-self.dragView.frame.size.width)) {
            if ([strongDelegate respondsToSelector:@selector(dragViewWasPulledToTheBottom)]) {
                [strongDelegate dragViewWasPulledToTheBottom];
            };
        }
        [UIView animateWithDuration:0.3 animations:^{
            self.dragView.frame = CGRectMake(0, 0, self.dragView.frame.size.width, self.dragView.frame.size.height);
        }];
    }
    
    
}


-(void)shouldBeRounded:(BOOL)boolean{
    if (self.isPortrait) {
        self.layer.cornerRadius = boolean ? self.frame.size.width/2 : 0;
    }else{
        self.layer.cornerRadius = boolean ? self.frame.size.height/2 : 0;
    }
    self.isRounded = boolean;
    [self.dragView shouldBeRounded:boolean];
}


-(void)createShadowOnDragViewWithOpacity:(float)opacity Offset:(CGSize)offset{
    [self.dragView createShadowWithOpacity:opacity Offset:offset];
}

-(void)createBorderWithColor:(UIColor*)borderColor Width:(NSInteger)width{
    self.layer.borderColor = [borderColor CGColor];
    self.layer.borderWidth = width;
}

-(void)createBorderOnDragViewWithColor:(UIColor*)borderColor Width:(NSInteger)width{
    [self.dragView createBorderWithColor:borderColor Width:width];
}

-(void)setTopLabelOnDragViewVisible:(BOOL)boolean{
    [self.dragView setTopLabelVisible:boolean];
}
-(void)setText:(NSString*)text ForTopLabelOnDragViewWithColor:(UIColor*)color WithFont:(UIFont*)font{
    [self.dragView setText:text ForTopLabelWithColor:color WithFont:font];
}

-(void)setBottomLabelOnDragViewVisible:(BOOL)boolean{
    [self.dragView setBottomLabelVisible:boolean];
}
-(void)setText:(NSString*)text ForBottomLabelOnDragViewWithColor:(UIColor*)color WithFont:(UIFont*)font{
    [self.dragView setText:text ForBottomLabelWithColor:color WithFont:font];
}

-(void)setCenterLabelOnDragViewVisible:(BOOL)boolean{
    [self.dragView setCenterLabelVisible:boolean];
}

-(void)setText:(NSString*)text ForCenterLabelOnDragViewWithColor:(UIColor*)color WithFont:(UIFont*)font{
    [self.dragView setText:text ForCenterLabelWithColor:color WithFont:font];
}

-(void)setBackgroundColorForDragView:(UIColor *)backgroundColor{
    [self.dragView setBackgroundColor:backgroundColor];
}




@end
