//
//  AJViewController.m
//  DropDownPicker
//
//  Created by Ajith R Nayak on 22/07/13.
//  Copyright (c) 2013 Ajith R Nayak. All rights reserved.
//

#import "AJViewController.h"
#import "AJData.h"
#import "MapViewController.h"
#import "PlacemarkViewController.h"

@interface AJViewController ()
@property (nonatomic, weak) IBOutlet MKMapView *mapView;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *getAddressButton;
@property (nonatomic, strong) CLGeocoder *geocoder;
@property (nonatomic, strong) MKPlacemark *placemark;
@end

@implementation AJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // create a geocoder and save it for later.
    self.geocoder = [[CLGeocoder alloc] init] ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"pushToDetail"])
    {
        // Get the destination view controller and set the placemark data that it should display.
        PlacemarkViewController *viewController = segue.destinationViewController;
        viewController.placemark = self.placemark;
    }
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    // Center the map the first time we get a real location change.
    static dispatch_once_t centerMapFirstTime;
    
    if ((userLocation.coordinate.latitude != 0.0) && (userLocation.coordinate.longitude != 0.0)) {
        dispatch_once(&centerMapFirstTime, ^{
            [self.mapView setCenterCoordinate:userLocation.coordinate animated:YES];
        });
    }
    
    // Lookup the information for the current location of the user.
    [self.geocoder reverseGeocodeLocation:self.mapView.userLocation.location completionHandler:^(NSArray *placemarks, NSError *error) {
        if ((placemarks != nil) && (placemarks.count > 0)) {
            // If the placemark is not nil then we have at least one placemark. Typically there will only be one.
            _placemark = [placemarks objectAtIndex:0];
            
            // we have received our current location, so enable the "Get Current Address" button
            [self.getAddressButton setEnabled:YES];
        }
        else {
            // Handle the nil case if necessary.
        }
    }];
}




- (IBAction)didTapDropDownBtn:(id)sender {
    
    AJDropDownPicker *picker=[[AJDropDownPicker alloc]initWithDelegate:self dataSourceArray:[AJData optionsArray]];
    [picker showFromView:sender];
}

-(void)dropDownPicker:(AJDropDownPicker *)dropDownPicker didPickObject:(id)pickedObject
{
    NSString *outputStatus= [NSString stringWithFormat:@"Find me on %@ at-",pickedObject];
    
    [self.dropDownBtn setTitle:(NSString*)pickedObject forState:UIControlStateNormal];
       
    if([pickedObject isEqualToString:@"Walking"])
       self.urlLabel.text = [outputStatus stringByAppendingString:[NSString stringWithFormat:@"%@",[NSURL URLWithString:@"https://twitter.com/ajithrnayak"]]];
    else if ([pickedObject isEqualToString:@"Jogging"])
         self.urlLabel.text = [outputStatus stringByAppendingString:[NSString stringWithFormat:@"%@",[NSURL URLWithString:@"https://www.facebook.com/ajith.r.nayak"]]];
    else if ([pickedObject isEqualToString:@"Running"])
        self.urlLabel.text = [outputStatus stringByAppendingString:[NSString stringWithFormat:@"%@",[NSURL URLWithString:@"https://github.com/ajithrnayak"]]];
    else if ([pickedObject isEqualToString:@"Slow Route"])
        self.urlLabel.text = [outputStatus stringByAppendingString:[NSString stringWithFormat:@"%@",[NSURL URLWithString:@"http://ajithrnayak.tumblr.com"]]];
    else if ([pickedObject isEqualToString:@"Fast Route"])
        self.urlLabel.text = [outputStatus stringByAppendingString:[NSString stringWithFormat:@"%@",[NSURL URLWithString:@"in.linkedin.com/pub/ajith-r-nayak/b/257/294/"]]];
    else if ([pickedObject isEqualToString:@"Email"])
        self.urlLabel.text = [outputStatus stringByAppendingString:[NSString stringWithFormat:@"%@",[NSURL URLWithString:@"ajithrnayak@icloud.com"]]];
    else if ([pickedObject isEqualToString:@"Long Route"])
        self.urlLabel.text = [outputStatus stringByAppendingString:[NSString stringWithFormat:@"%@",[NSURL URLWithString:@"http://ajithrnayak.wordpress.com"]]];
    
}



@end
