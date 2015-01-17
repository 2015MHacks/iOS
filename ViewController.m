//
//  ViewController.m
//  SCLAlertView
//
//  Created by Diogo Autilio on 9/26/14.
//  Copyright (c) 2014 AnyKey Entertainment. All rights reserved.
//

#import "ViewController.h"
#import "SCLAlertView.h"

@interface ViewController ()

@end

NSString *kSuccessTitle = @"How do I log in?";
NSString *kErrorTitle = @"Connection error";
NSString *kNoticeTitle = @"My Topic";
NSString *kWarningTitle = @"Warning";
NSString *kInfoTitle = @"Privacy";
NSString *kSubtitle = @"You can log in with your existing Facebook account or create a new account in the app";
NSString *pSubtitle = @"We protect your privacy and your username and password is always secure and encrypted";
NSString *iSubtitle = @"You can sign up for a new account on the login screen of the app with Parse ";
NSString *kButtonTitle = @"Done";
NSString *kAttributeTitle = @"Attributed string operation successfully completed.";

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)showSuccess:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
   
    
    [alert addButton:@"Okay" actionBlock:^(void) {
        NSLog(@"Second button tapped");
    }];
    
    alert.soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/right_answer.mp3", [[NSBundle mainBundle] resourcePath]]];

    [alert showSuccess:self title:kSuccessTitle subTitle:kSubtitle closeButtonTitle:kButtonTitle duration:0.0f];
}

- (IBAction)showError:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    [alert showError:self title:@"Hold On..."
            subTitle:@"You have not saved your Submission yet. Please save the Submission before accessing the Responses list. Blah de blah de blah, blah. Blah de blah de"
     
     
    closeButtonTitle:@"OK" duration:0.0f];
}

- (IBAction)showNotice:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    alert.soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/right_answer.mp3", [[NSBundle mainBundle] resourcePath]]];
    
    [alert showNotice:self title:kNoticeTitle subTitle:iSubtitle closeButtonTitle:kButtonTitle duration:0.0f];
    
   
}

- (IBAction)showWarning:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    alert.soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/right_answer.mp3", [[NSBundle mainBundle] resourcePath]]];
    
    [alert showWarning:self title:kWarningTitle subTitle:kSubtitle closeButtonTitle:kButtonTitle duration:0.0f];
    
}

- (IBAction)showInfo:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    alert.shouldDismissOnTapOutside = YES;
    
    alert.soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/right_answer.mp3", [[NSBundle mainBundle] resourcePath]]];
    
    [alert showInfo:self title:kInfoTitle subTitle:pSubtitle closeButtonTitle:kButtonTitle duration:0.0f];
}

- (IBAction)showEdit:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    UITextField *textField = [alert addTextField:@"Enter your name"];
    
    alert.soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/right_answer.mp3", [[NSBundle mainBundle] resourcePath]]];
    
    [alert addButton:@"Show Name" actionBlock:^(void) {
        NSLog(@"Text value: %@", textField.text);
    }];
    
    [alert showEdit:self title:kInfoTitle subTitle:kSubtitle closeButtonTitle:kButtonTitle duration:0.0f];
}

- (IBAction)showAdvanced:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    [alert addButton:@"First Button" target:self selector:@selector(firstButton)];
    
    [alert addButton:@"Second Button" actionBlock:^(void) {
        NSLog(@"Second button tapped");
    }];
    
    UITextField *textField = [alert addTextField:@"Enter your name"];
    
    alert.soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/right_answer.mp3", [[NSBundle mainBundle] resourcePath]]];
    
    [alert addButton:@"Show Name" actionBlock:^(void) {
        NSLog(@"Text value: %@", textField.text);
    }];
    
    alert.attributedFormatBlock = ^NSAttributedString* (NSString *value)
    {
        NSMutableAttributedString *subTitle = [[NSMutableAttributedString alloc]initWithString:value];
        
        NSRange redRange = [value rangeOfString:@"Attributed" options:NSCaseInsensitiveSearch];
        [subTitle addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:redRange];
        
        NSRange greenRange = [value rangeOfString:@"successfully" options:NSCaseInsensitiveSearch];
        [subTitle addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:greenRange];
        
        NSRange underline = [value rangeOfString:@"completed" options:NSCaseInsensitiveSearch];
        [subTitle addAttributes:@{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle)} range:underline];
        
        return subTitle;
    };

    [alert showTitle:self title:@"Congratulations" subTitle:kAttributeTitle style:Success closeButtonTitle:@"Done" duration:0.0f];
}

- (IBAction)showWithDuration:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    alert.soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/right_answer.mp3", [[NSBundle mainBundle] resourcePath]]];
    
    [alert showNotice:self title:kNoticeTitle subTitle:@"To what extent has technology impacted the way we live our lives?" closeButtonTitle:nil duration:5.0f];
}

- (void)firstButton
{
    NSLog(@"First button tapped");
}
@end

// Copyright belongs to original author
// http://code4app.net (en) http://code4app.com (cn)
// From the most professional code share website: Code4App.net 
