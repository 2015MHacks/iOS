//
//  AppDelegate.h
//  WhatsHere
//
//  Created by Jaxon Stevens on 04/08/14.
//  Copyright (c) 2014 Lemona Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>



@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (weak, nonatomic) IBOutlet FBLoginView *loginButton;

@property (weak, nonatomic) IBOutlet UILabel *lblLoginStatus;

@property (weak, nonatomic) IBOutlet UILabel *lblUsername;

@property (weak, nonatomic) IBOutlet UILabel *lblEmail;

@property (weak, nonatomic) IBOutlet FBProfilePictureView *profilePicture;


@property (strong, nonatomic) UIWindow *window;




@end



