//
//  SearchViewController.m
//  TVMe
//
//  Created by Rajkumar Sharma on 03/07/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController
@synthesize searchTxtFld;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
   
    self.view.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:.1];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(IBAction)cancelBtnTap:(id)sender
{
    [self.view removeFromSuperview];
}

-(IBAction)searchBtnTapped:(id)sender
{

    [self.searchTxtFld becomeFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.searchTxtFld resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
