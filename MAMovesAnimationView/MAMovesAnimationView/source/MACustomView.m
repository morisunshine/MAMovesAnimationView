//
//  MACustomView.m
//  MAMovesAnimationView
//
//  Created by Sheldon on 14-5-10.
//  Copyright (c) 2014年 Sheldon. All rights reserved.
//

#import "MACustomView.h"

@implementation MACustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGRect borderRect = self.bounds;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 0/255.0, 212/255.0, 90/255.0, 1);
    CGContextFillEllipseInRect(context, borderRect);
    CGContextStrokeEllipseInRect(context, borderRect);
    CGContextFillPath(context);
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
