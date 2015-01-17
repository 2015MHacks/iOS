//
//  SignUpViewController.h
//  WhatsHere
//
//  Created by Jaxon Stevens on 04/08/14.
//  Copyright (c) 2014 Lemona Ic. All rights reserved.
//

#import "ParentViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import <AVFoundation/AVFoundation.h>
#import "UIERealTimeBlurView.h"

@interface LoginUIViewController: ParentViewController <UITextFieldDelegate, FBLoginViewDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>
{
    // Defined Parse Login View Controller
    PFLogInViewController *_loginVC;
}

-(IBAction)hideall;
-(IBAction)revealall;

- (IBAction)parseLoginButtonClicked:(id)sender;

@property (weak, nonatomic) IBOutlet FBLoginView *loginButton;

@property (weak, nonatomic) IBOutlet UILabel *lblLoginStatus;

@property (weak, nonatomic) IBOutlet UILabel *lblUsername;

@property (weak, nonatomic) IBOutlet UILabel *lblEmail;

@property (weak, nonatomic) IBOutlet FBProfilePictureView *profilePicture;

// Defined Login Button
@property (retain, nonatomic) IBOutlet UIButton *btnPublish;

-(IBAction) pushButtonTwitter;
-(IBAction) pushButtonFacebook;
-(IBAction) pushButtonGoogle;


@end