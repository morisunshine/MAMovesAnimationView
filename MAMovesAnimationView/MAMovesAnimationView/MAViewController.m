//
//  MAViewController.m
//  MAMovesAnimationView
//
//  Created by Sheldon on 14-5-10.
//  Copyright (c) 2014年 Sheldon. All rights reserved.
//

#import "MAViewController.h"
#import "MAMovesAnimationView.h"

@interface MAViewController ()

@end

@implementation MAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    MAMovesAnimationView *animationingView = [[MAMovesAnimationView alloc] initWithFrame:self.view.bounds];
    animationingView.userInteractionEnabled = YES;
    animationingView.tag = 10;
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [animationingView addGestureRecognizer:tapGR];
    
    [self.view addSubview:animationingView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions -

- (IBAction)tapped:(UITapGestureRecognizer *)sender
{
    MAMovesAnimationView *view = (MAMovesAnimationView *)sender.view;
    if (10 == view.tag) {
        view.tag = 11;
        [view fadeOutWithStartPoint:CGPointZero endPoint:CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)];
    } else {
        view.tag = 10;
        [view fadeInWithStartPoint:CGPointZero endPoint:CGPointMake(self.view.frame.size.width / 2 - 50, self.view.frame.size.height / 2 - 50)];
    }
}


@end
