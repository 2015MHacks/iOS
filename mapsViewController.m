//
//  mapsViewController.m
//  application
//
//  Created by Bryan Edward Ngadimin on 11/13/14.
//  Copyright (c) 2014 Bryan Edward Ngadimin. All rights reserved.
//

#import "mapsViewController.h"

@interface mapsViewController ()



@end

@implementation mapsViewController {
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}
@synthesize address;

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
    [super viewDidLoad];
    
    self.done.enabled = NO;
    
   ///PFObject *location = [PFObject objectWithClassName:@"location"];
    
    [self.address addTarget:self
                  action:@selector(startedEditing:)
        forControlEvents:UIControlEventEditingChanged];

    /*location[@"name"]=user.username;
    location[@"email"]=user.email;
    location[@"locations"] = address.text;
    [location saveInBackground];*/
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchlocation:(id)sender {
    if (locationManager==nil){
        locationManager=[[CLLocationManager alloc]init];
        geocoder = [[CLGeocoder alloc] init];
        locationManager.delegate = self;
        [locationManager startMonitoringSignificantLocationChanges];
        
        self.done.enabled = YES;
        self.locateMe.enabled = NO;
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        a= [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        b= [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    }
    
    // Stop Location Manager
    [locationManager stopUpdatingLocation];
    
    NSLog(@"Resolving the Address");
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            c= [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                 placemark.subThoroughfare, placemark.thoroughfare,
                                 placemark.postalCode, placemark.locality,
                                 placemark.administrativeArea,
                                 placemark.country];
            PFUser *user = [PFUser currentUser];
            user[@"location"] = c;
            self.address.text = [NSString stringWithFormat:@"%@ %@, %@, %@ %@",
                                 placemark.subThoroughfare, placemark.thoroughfare,
                                 placemark.locality, placemark.administrativeArea, placemark.postalCode];
            [[PFUser currentUser] saveEventually];
//            [self performSegueWithIdentifier:@"map" sender:self];
        }
        else {
            NSLog(@"%@", error.debugDescription);
            UIAlertView *alert=[[UIAlertView alloc]
                                initWithTitle:@"Error" message:@"Location not found, please try again later or input your address manually" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
    } ];
    
}

- (IBAction)startedEditing:(id)sender
{
    if ([self.address.text isEqual:@""]) {
        self.done.enabled = NO;
    } else {
        self.done.enabled = YES;
    }
    [self.view endEditing:YES];
}

- (IBAction)nextpage:(id)sender {
    PFUser *user = [PFUser currentUser];
    
    NSLog(@"user[location]: %@", user[@"location"]);
    
    /*if(user[@"location"]==nil /*|| some other contidition //){
        UIAlertView *alert=[[UIAlertView alloc]
                            initWithTitle:@"Error" message:@"Please enter your location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
        [self performSegueWithIdentifier:@"map" sender:self];
    }*/
    
    if(user[@"location"]!=nil || ![self.address.text isEqual:@""]){
        
        PFUser *user = [PFUser currentUser];
        user[@"location"]=self.address.text;
        [[PFUser currentUser] saveEventually];

        [self performSegueWithIdentifier:@"map" sender:self];
    }
    /*else {
        UIAlertView *alert=[[UIAlertView alloc]
                            initWithTitle:@"Error" message:@"Please enter your location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }*/

}
@end
