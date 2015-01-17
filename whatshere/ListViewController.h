//
//  ListViewController.h
//  WhatsHere
//
//  Created by Rajkumar Sharma on 05/08/14.
//  Copyright (c) 2014 Jimmy. All rights reserved.
//

#import "ParentViewController.h"
#import <MapKit/MapKit.h>


typedef enum {

    ListTypeNear = 1,
    ListTypeCategory
} ListType;

@interface ListViewController : ParentViewController <UITableViewDataSource, UITableViewDelegate,MKMapViewDelegate, UISearchBarDelegate>
{
    int pinCount;
}
@property (nonatomic, assign) ListType controllerListType;
@property (nonatomic, assign) CategoryType controllerCategoryType;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;





@end
