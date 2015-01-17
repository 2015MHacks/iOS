//
//  SlidingMenuViewController.m
//  WhatsHere
//
//  Created by Jaxon Stevens on 04/08/14.
//  Copyright (c) 2014 Lemona Inc. All rights reserved.
//

#import "SlidingMenuViewController.h"

@interface SlidingMenuViewController ()

@property (nonatomic, weak) IBOutlet UIButton *btnFind;
@property (nonatomic, weak) IBOutlet UIButton *btnFavourite;
@property (nonatomic, weak) IBOutlet UIButton *btnSettings;
@property (nonatomic, weak) IBOutlet UIButton *btnLogout;
@property (nonatomic, weak) IBOutlet UIImageView *imgSideBar;
@end

@implementation SlidingMenuViewController

- (void)viewDidLoad
{
    NSLog(@"SlidingMenuViewController");
    
    _imgSideBar.center = CGPointMake(_imgSideBar.center.x, _btnFind.center.y);
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    _btnFind.selected = NO;
    _btnFavourite.selected = NO;
    _btnSettings.selected = NO;
    _btnLogout.selected = NO;
    
    if ([segue.identifier isEqualToString:@"slidingToSettings"]||[segue.identifier isEqualToString:@"slidingToFind"])
    {
        _imgSideBar.hidden = NO;
        _imgSideBar.center = CGPointMake(_imgSideBar.center.x, sender.center.y);
        sender.selected =YES;
    }
    else
    {
        _imgSideBar.hidden = YES;
    }
}

- (IBAction)unwindToMainMenuViewController:(UIStoryboardSegue *)segue{

}

@end