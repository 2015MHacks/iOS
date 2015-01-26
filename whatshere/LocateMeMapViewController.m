//
//  LocateMeMapViewController.m
//  LocateMeMap
//
//  Created by Donna Tang on 7/23/13.
//  Copyright (c) 2013 xuejiaot. All rights reserved.
//

#import "LocateMeMapViewController.h"
#import <sys/utsname.h>

@interface LocateMeMapViewController ()

@end

@implementation LocateMeMapViewController

@synthesize mapView = _mapView;
@synthesize lManager = _lManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Show system information
    [self showSystemInfo];
    // set current mapview
    tmpMapView = (MKMapView*)self.mapView;
    [self setUpLocationService];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(NSString *)getDate
{
    NSDate *date = [NSDate date];
    NSTimeZone *est = [NSTimeZone timeZoneWithAbbreviation:@"EST"];
    NSDateFormatter*formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [formatter setTimeZone:est];
    NSString *locationString=[formatter stringFromDate: date];
    //[formatter release];
    return locationString;
}


-(void)showSystemInfo
{
    // Get system information and display on labels
    NSString *andrewid = @"xuejiaot";
    //NSString *udid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    NSString *uuidString = (NSString *)CFBridgingRelease(CFUUIDCreateString(NULL,uuidRef));
    CFRelease(uuidRef);
    // Device model and version
    UIDevice *currentDevice = [UIDevice currentDevice];
    NSString *model = [currentDevice model];
    NSString *systemVersion = [currentDevice systemVersion];
    NSString *deviceInfo = [model stringByAppendingString:systemVersion];
    NSString *time = [self getDate];
    NSString *formatedtime = [time stringByAppendingString:@" EST"];
    UILabel *lb= (UILabel*)self.labelAndrewId;
    lb.text = andrewid;
    lb = (UILabel*)self.labelDeviceId;
    lb.text = uuidString;
    lb = (UILabel*)self.labelDeviceInfo;
    lb.text = deviceInfo;
    lb = (UILabel*)self.labelDateTime;
    lb.text = formatedtime;
 
}


- (void) getCurPosition
{
    if (locationManager==nil){
        locationManager =[[CLLocationManager alloc] init];
    }
    
    if ([CLLocationManager locationServicesEnabled]){
        locationManager.delegate=self;
        locationManager.desiredAccuracy=kCLLocationAccuracyBest;
        locationManager.distanceFilter=10.0f;
        [locationManager startUpdatingLocation];
    }
}


- (void) setUpLocationService
{
    if (locationManager==nil){
        locationManager =[[CLLocationManager alloc] init];
        locationManager.delegate=self;
        locationManager.desiredAccuracy=kCLLocationAccuracyBest;
        locationManager.distanceFilter=10.0f;
    }
//    if ([CLLocationManager locationServicesEnabled]){
    [locationManager requestAlwaysAuthorization];
    [locationManager startUpdatingLocation];
//    }
    
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedAlways) {
        NSLog(@"Well duh");
    }
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    NSLog(error);
}


// LocationManager delegation implementation,called when location retrieved
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{ /*
    NSLog(@"newLocation:%@",[newLocation description]);
    
    // Update current locatoin
    curLocation=newLocation;
    
    MKCoordinateRegion region;
    region.center = newLocation.coordinate;
     
     MKCoordinateSpan span;
     span.latitudeDelta  = 1; // Change these values to change the zoom
     span.longitudeDelta = 1;
     region.span = span;
     
     [self.mapView setRegion:region animated:YES];   */
}


- (void)getAddressByReverseGeocoding
{
    __block NSString *strAddress;
    // init a geocoder
    geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:curLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            NSLog( @"%@", [error description]);
            strAddress = @"Error";
            return ;
        }
         else if(placemarks && (placemarks.count > 0)){
            NSLog( @"Enter geocode");
            CLPlacemark *m = [placemarks objectAtIndex:0];
            //String to address
            NSString *locatedaddress = [[m.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
             
             //Print the location in the console
            NSLog(@"Currently address is: %@",locatedaddress);
            strAddress = locatedaddress;
            
        }
        else {
            NSLog(@"No placemark generated.");
            strAddress = @"Location not available";
        }
        self.labelAddress.text = strAddress;
    }];
    NSLog( @"Before return");

}
- (IBAction)showLocation:(id)sender {
    UILabel *lb= (UILabel*)self.labelAddress;
    lb.text = @"button clicked";
    
    // Set up mapView display options and show current location on the map

    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(curLocation.coordinate,5 ,5 );
    region.center=curLocation2D;
//    [tmpMapView setRegion:region animated:TRUE];
    tmpMapView.showsUserLocation = YES;
    // Reverse geocoding and display address
    [self getAddressByReverseGeocoding];
    NSLog(@"Done reverse geocoding");
    // Update label to show address
    //self.labelAddress.text = address; */
}



@end
