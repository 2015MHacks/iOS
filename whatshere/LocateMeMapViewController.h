//
//  LocateMeMapViewController.h
//  LocateMeMap
//
//  Created by Donna Tang on 7/23/13.
//  Copyright (c) 2013 xuejiaot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LocateMeMapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLLocation * curLocation;
    CLLocationCoordinate2D  curLocation2D;
    MKMapView *tmpMapView;
    CLGeocoder *geoCoder;
}
@property (weak, nonatomic) IBOutlet UILabel *labelAndrewId;
@property (weak, nonatomic) IBOutlet UILabel *labelDeviceId;
@property (weak, nonatomic) IBOutlet UILabel *labelDeviceInfo;
@property (weak, nonatomic) IBOutlet UILabel *labelDateTime;
@property (weak, nonatomic) IBOutlet UILabel *labelAddress;
- (IBAction)showLocation:(id)sender;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) CLLocationManager *lManager;
@end
