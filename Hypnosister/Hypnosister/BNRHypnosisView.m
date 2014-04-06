//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Chris Arquelada on 4/6/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //All object clear backgroud
        self.backgroundColor =[UIColor clearColor];
    }
    return self;
}
-(void)drawRect:(CGRect)rect

{
    CGRect bounds = self.bounds;
    
    //Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/ 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    //The largest circle will circumscribe the view
    float maxRadius= hypotf(bounds.size.width, bounds.size.height) /2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    
    for (float currentRadius = maxRadius; currentRadius > 0;currentRadius -=20){
    
        [path moveToPoint:CGPointMake(center.x +currentRadius, center.y)];
        [path addArcWithCenter:center
                radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    path.lineWidth = 10;
    //configure the line stroke to light gray
    [[UIColor lightGrayColor]setStroke];
    [path stroke];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
