//
//  SiteDetailViewController.m
//  WhatsHere
//
//  Created by Jaxon Stevens on 05/08/14.
//  Copyright (c) 2014 Lemona Inc. All rights reserved.
//

#import "SiteDetailViewController.h"

@interface SiteDetailViewController()
@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollContent;
@end


@implementation SiteDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
        self.navigationController.navigationBar.hidden = YES;
      [_scrollContent setContentOffset:CGPointMake(0, 0) animated:YES];
}

-(IBAction)backBtnTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





-(IBAction) pushButtonResturant1 {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://www.theitalianfarmhouse.ca"]];
    
}


-(IBAction) PushButtonLemona {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://www.lemonainc.com"]];
    
}


-(IBAction) PushButtonITAReservation {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://www.opentable.com/italian-farmhouse-restaurant-and-bar-reservations-bragg-creek"]];
    
}

-(IBAction) PushButtonBVVReservation {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://www.opentable.com/the-bavarian-inn-restaurant?DateTime=2014-12-07%2019%3A00&Covers=2&OnlyOffers=false&RestaurantIDs=38056&MetroId=77"]];
    
    

}

-(IBAction) PushButtonBuy {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://www.visitbraggcreekapp.com"]];
    
}
-(IBAction) pushButtonResturant2 {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://www.thebavarianinn.com"]];
    
}

-(IBAction) pushButtonResturant3 {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://www.google.com"]];
}

-(IBAction) CallResturant {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:4034792554"]];
}

-(IBAction) PushButtonFacebook {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://www.facebook.com"]];
}


-(IBAction) PushButtonFacebookITA {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"https://www.facebook.com/ItalianFarmhouse"]];
}

-(IBAction) PushButtonFacebookLEM {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"https://www.facebook.com/LemonaSoftware"]];
}

-(IBAction) PushButtonFacebookHOT {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"https://www.facebook.com/HotRocksGlassJewels"]];
}

-(IBAction) PushButtonVBCWEBSITE {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://www.visitbraggcreekapp.com"]];
}

-(IBAction) PushButtonLEMApps {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"https://itunes.apple.com/ca/artist/theepicmacman/id540942819"]];
}

-(IBAction) PushButtonLEMGoogle {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"https://plus.google.com/+LemonaincSoftware/about"]];
}

-(IBAction) PushButtonLEMTwitter{
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"http://twitter.com/jaxonkstevens"]];
}


-(IBAction) PushButtonFacebookBAVV {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"https://www.facebook.com/pages/The-Bavarian-Inn-Restaurant/134569774897"]];
    
}

    -(IBAction) PushButtonBAVV {self.phoneNumber = @"4039493611";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", self.phoneNumber]]];
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Call 4039493611" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES",nil];
        [alert show];
        
    }


-(IBAction) PushButtonITA {self.phoneNumber = @"4039492750";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", self.phoneNumber]]];
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Call 4039492750" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES",nil];
    [alert show];
    
}


-(IBAction) PushButtonLEM {self.phoneNumber = @"4034792554";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", self.phoneNumber]]];
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Call 403472554" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES",nil];
    [alert show];
    
    
    
}


@end
