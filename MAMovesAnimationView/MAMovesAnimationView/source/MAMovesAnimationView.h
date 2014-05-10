//
//  MAMovesAnimationView.h
//  MAMovesAnimationView
//
//  Created by Sheldon on 14-5-10.
//  Copyright (c) 2014年 Sheldon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MACustomView;

@interface MAMovesAnimationView : UIView

@property (nonatomic, retain) MACustomView *customView;

//淡入
- (void)fadeInWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;
//淡出
- (void)fadeOutWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

@end
