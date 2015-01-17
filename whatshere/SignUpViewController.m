//
//  SignUpViewController.m
//  WhatsHere
//
//  Created by Rajkumar Sharma on 04/08/14.
//  Copyright (c) 2014 Jimmy. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@property (nonatomic, weak) IBOutlet UITextField *txtLogin;
@property (nonatomic, weak) IBOutlet UITextField *txtPassword;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollContent;

@end

@implementation SignUpViewController


-(IBAction) pushButton {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://www.apple.com"]];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == _txtLogin)
        [_txtPassword becomeFirstResponder];
    else
    {
        [_scrollContent setContentOffset:CGPointMake(0, 0) animated:YES];
        [textField resignFirstResponder];
    }
    
    
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    CGSize bounds = [[UIScreen mainScreen] bounds].size;
    [_scrollContent setContentOffset:CGPointMake(0, 480-bounds.height/2) animated:YES];
    return YES;
}


-(IBAction) pushButtonTwitter {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://www.twitter.com"]];
    
}

-(IBAction) pushButtonFacebook {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://www.facebook.com"]];
    
}

-(IBAction) pushButtonGoogle {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://www.google.com"]];
}



@end
