//
//  SlidingMenuViewController.h
//  WhatsHere
//
//  Created by Jaxon Stevens on 04/08/14.
//  Copyright (c) 2014 Lemona Inc. All rights reserved.
//

#import "ParentViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface SlidingMenuViewController : ParentViewController

@end
@interface LoginUIViewController: ParentViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet FBLoginView *loginButton;

@property (weak, nonatomic) IBOutlet UILabel *lblLoginStatus;

@property (weak, nonatomic) IBOutlet UILabel *lblUsername;

@property (weak, nonatomic) IBOutlet UILabel *lblEmail;

@property (weak, nonatomic) IBOutlet FBProfilePictureView *profilePicture;

- (IBAction)unwindToMainMenuViewController:(UIStoryboardSegue *)segue;
@end
