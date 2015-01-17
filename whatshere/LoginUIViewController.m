//
//  SignUpViewController.m
//  WhatsHere
//
//  Created by Jaxon Stevens on 04/08/14.
//  Copyright (c) 2014 Lemona Inc. All rights reserved.
//


#import "LoginUIViewController.h"
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import "UIERealTimeBlurView.h"
#import "JMBackgroundCameraView.h"

@interface LoginUIViewController ()



@property (nonatomic, weak) IBOutlet UITextField *txtLogin;
@property (nonatomic, weak) IBOutlet UITextField *txtPassword;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollContent;

@end

@implementation LoginUIViewController
JMBackgroundCameraView *v;



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
    

    
    [self toggleHiddenState:YES];
    self.lblLoginStatus.text = @"";
    
    self.loginButton.delegate = self;
    self.loginButton.readPermissions = @[@"public_profile", @"email"];
    
    // Initially hide the publish button.
    [btnPublish setHidden:YES];
    
    
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    

    
    // Parse:: To test uncomment the below block
    /*if ([PFUser currentUser])
    {
        [PFUser logOut];
    }*/
    
    
    if ([PFUser currentUser])
    {
        [self toggleHiddenState:NO];
        self.lblUsername.text = [[PFUser currentUser] username];
        self.lblEmail.text = [[PFUser currentUser] email];
        self.btnPublish.hidden = NO;
        //[self performSegueWithIdentifier:@"pushSlidingViewController" sender:self];
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
      [_scrollContent setContentOffset:CGPointMake(0, 0) animated:YES];
}



/**
 Parse Login Integration
 -- START --
*/

- (IBAction)parseLoginButtonClicked:(id)sender
{
    // Create Parse Login View Contoller
    _loginVC = [[PFLogInViewController alloc] init];
    _loginVC.delegate = self;
    _loginVC.signUpController.delegate = self;
    [self presentViewController:_loginVC animated:YES completion:^{
        
    }];
}

-(void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    [self dismissViewControllerAnimated:YES completion:^{
        _loginVC = nil;
    }];
}

-(void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user
{
    [self dismissViewControllerAnimated:YES completion:^{
        _loginVC = nil;
    }];
}

-(void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:^{
        _loginVC = nil;
    }];
}

-(void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController
{
    [self dismissViewControllerAnimated:YES completion:^{
        _loginVC = nil;
    }];
}

-(void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:^{
        _loginVC = nil;
    }];
}

-(void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController
{
    [self dismissViewControllerAnimated:YES completion:^{
        _loginVC = nil;
    }];
}


/**
 -- END --
*/


  



#pragma mark - Private method implementation

-(void)toggleHiddenState:(BOOL)shouldHide{
    self.lblUsername.hidden = shouldHide;
    self.lblEmail.hidden = shouldHide;
    self.profilePicture.hidden = shouldHide;
    
    
    
}


#pragma mark - FBLoginView Delegate method implementation

-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView{
    self.lblLoginStatus.text = @"You are logged in.";
    
    [self toggleHiddenState:NO];
}


-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
    NSLog(@"%@", user);
    self.profilePicture.profileID = user.objectID;
    self.lblUsername.text = user.name;
    self.lblEmail.text = [user objectForKey:@"email"];
    
    [btnPublish setHidden:NO];
}



-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView{
    self.lblLoginStatus.text = @"You are logged out";
    
    [self toggleHiddenState:YES];
}


-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error{
    NSLog(@"%@", [error localizedDescription]);
}





-(IBAction) pushButtonTwitter {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"https://twitter.com/BCKOR"]];
    
}

-(IBAction) pushButtonFacebook {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"https://www.facebook.com/visitbraggcreek"]];
    
}

-(IBAction) pushButtonGoogle {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"https://plus.google.com/112320475508832113334/posts"]];
}

@synthesize btnPublish;




- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [FBLoginView class];
    return YES;
}



- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    // Call FBAppCall's handleOpenURL:sourceApplication to handle Facebook app responses
    BOOL wasHandled = [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
    
    // You can add your app-specific url handling code here if needed
    
    return wasHandled;
}




@end
