//
//  mapsViewController.h
//  application
//
//  Created by Bryan Edward Ngadimin on 11/13/14.
//  Copyright (c) 2014 Bryan Edward Ngadimin. All rights reserved.
//

#import <Parse/Parse.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface mapsViewController : UIViewController <CLLocationManagerDelegate>

{
    NSString *a;
    NSString *b;
    NSString *c;
}

@property (strong, nonatomic) IBOutlet UIButton *locateMe;
@property (strong, nonatomic) IBOutlet UIButton *done;

@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *destination;

- (IBAction)searchlocation:(id)sender;
- (IBAction)nextpage:(id)sender;

- (IBAction)startedEditing:(id)sender;

@end
