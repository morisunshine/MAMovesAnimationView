//
//  MAMovesAnimationView.m
//  MAMovesAnimationView
//
//  Created by Sheldon on 14-5-10.
//  Copyright (c) 2014年 Sheldon. All rights reserved.
//

#import "MAMovesAnimationView.h"
#import "MACustomView.h"

@implementation MAMovesAnimationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addSubview:self.customView];
    }
    return self;
}

#pragma mark - Getters -

- (MACustomView *)customView
{
    if (!_customView) {
        _customView = [[MACustomView alloc] initWithFrame:CGRectMake(self.frame.size.width / 2 - 50, self.frame.size.height / 2 - 50, 30, 30)];
    }
    
    return _customView;
}

- (void)fadeInWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint
{
    [UIView animateWithDuration:0.2 animations:^{
        self.customView.transform = CGAffineTransformScale(self.customView.transform, 0.4, 0.4);
    } completion:^(BOOL finished) {
        if (finished) {
            //制作抛物线
            [self parabolaAnimateWithEndPoint:endPoint];
        }
    }];
}

- (void)fadeOutWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint
{
    [self parabolaAnimateWithEndPoint:endPoint];
}

- (void)parabolaAnimateWithEndPoint:(CGPoint)endPoint
{
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationCubic;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.delegate = self;
    
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, self.customView.frame.origin.x, self.customView.frame.origin.y);
    CGPathAddCurveToPoint(curvedPath, NULL, endPoint.x, self.customView.frame.origin.y, endPoint.x, self.customView.frame.origin.y, endPoint.x, endPoint.y);
    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
    
    [self.customView.layer addAnimation:pathAnimation forKey:@"parabolaAnimation"];
}

#pragma mark - animation delegate -

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        [UIView animateWithDuration:0.2 animations:^{
            self.customView.transform = CGAffineTransformScale(self.customView.transform, 1.6, 1.6);
        } completion:^(BOOL finished) {
            
        }];
    }
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
