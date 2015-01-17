//
//  Slide1VC.m
//  AMSlideMenu
//
//  Created by Artur Mkrtchyan on 1/27/14.
//  Copyright (c) 2014 SocialObjects Software. All rights reserved.
//

#import "Slide1VC.h"
#import "UIViewController+AMSlideMenu.h"
#import "UIColor+CreateMethods.h"


@interface Slide1VC ()

@end

@implementation Slide1VC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Setting navigation's bar tint color
    
    
    [self fixStatusBar];
}

- (void)fixStatusBar

{
        // The device is an iPhone or iPod touch.
        
        // Making view with same color that navigation bar
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
        view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        view.backgroundColor = [UIColor whiteColor];
        
        // Replace status bar view with created view and do magic :)
        [[self mainSlideMenu] fixStatusBarWithView:view];
    }

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[self mainSlideMenu] unfixStatusBarView];
}


@end
