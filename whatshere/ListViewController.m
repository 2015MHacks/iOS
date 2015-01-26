//
//  ListViewController.m
//  WhatsHere
//
//  Created by Jaxon Stevens on 05/08/14.
//  Copyright (c) 2014 Lemona inc. All rights reserved.
//

#import "ListViewController.h"
#import <MapKit/MapKit.h>
#import "Annotation.h"
#import "SearchViewController.h"

@interface ListViewController()
{
    SearchViewController *searchController ;
}

@property (nonatomic,weak) IBOutlet UILabel *lblTitle;
@end



@implementation ListViewController


-(void)viewDidLoad {
    [super viewDidLoad];
     self.navigationController.navigationBar.hidden = YES;
    if (_controllerListType == ListTypeNear)
        _lblTitle.text = @"Near";
    else
        [self setHeadingTitle];
    
    _mapView.showsUserLocation = YES;
    
    pinCount = 1;
    MKCoordinateRegion region = { {0.0, 0.0}, {0.0,0.0}};
    region.center.latitude = 42.292223000000000000;
    region.center.longitude = -83.716840;
    region.span.longitudeDelta = 1;
    region.span.latitudeDelta = 1;
    [_mapView setRegion:region animated:YES];
    
    Annotation *ann = [[Annotation alloc] init];
    ann.title = @"Town Center";
    ann.subtitle = @"Bragg Creek";
    ann.coordinate = region.center;
    [_mapView addAnnotation:ann];
    

    region.center.latitude = 42.292223000000000000;
    region.center.longitude = -83.716840;
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [_mapView setRegion:region animated:YES];
    
    Annotation *annt = [[Annotation alloc] init];
    annt.title = @"The Italian Farmhouse";
    annt.subtitle = @"Resturant";
    annt.coordinate = region.center;
    [_mapView addAnnotation:annt];
    

    region.center.latitude = 42.292223000000000000;
    region.center.longitude = -83.716840;
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [_mapView setRegion:region animated:YES];
    
    Annotation *annr = [[Annotation alloc] init];
    annr.title = @"The Powderhorn Sallon";
    annr.subtitle = @"Lounge/Bar";
    annr.coordinate = region.center;
    [_mapView addAnnotation:annr];
    
    
    region.center.latitude =   50.946707;
    region.center.longitude = -114.571505;
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [_mapView setRegion:region animated:YES];
    
    Annotation *annb = [[Annotation alloc] init];
    annb.title = @"The Bavariann Inn";
    annb.subtitle = @"Resturant";
    annb.coordinate = region.center;
    [_mapView addAnnotation:annb];
    
    region.center.latitude =   50.950328;
    region.center.longitude = -114.562237;
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [_mapView setRegion:region animated:YES];
    
    Annotation *annc = [[Annotation alloc] init];
    annc.title = @"The Community Center";
    annc.subtitle = @"Service";
    annc.coordinate = region.center;
    [_mapView addAnnotation:annc];
    
    
    region.center.latitude =   50.952199;
    region.center.longitude = -114.560234;
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [_mapView setRegion:region animated:YES];
    
    
    
    Annotation *anns = [[Annotation alloc] init];
    anns.title = @"Shell Gas Station";
    anns.subtitle = @"Service";
    anns.coordinate = region.center;
    [_mapView addAnnotation:anns];
    
    
    region.center.latitude =   50.952024;
    region.center.longitude = -114.560256;
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [_mapView setRegion:region animated:YES];
    
    
    
    Annotation *annsu = [[Annotation alloc] init];
    annsu.title = @"Subway";
    annsu.subtitle = @"Resturant";
    annsu.coordinate = region.center;
    [_mapView addAnnotation:annsu];
    
    
    
    region.center.latitude =   50.95165;
    region.center.longitude = -114.562009;
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [_mapView setRegion:region animated:YES];
    
    
    
    Annotation *annp = [[Annotation alloc] init];
    annp.title = @"Post Office";
    annp.subtitle = @"Service";
    annp.coordinate = region.center;
    [_mapView addAnnotation:annp];
    
    
    
    region.center.latitude =   50.951661;
    region.center.longitude = -114.561563;
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [_mapView setRegion:region animated:YES];
    
    
    
    Annotation *annu = [[Annotation alloc] init];
    annu.title = @"One of a Kind";
    annu.subtitle = @"Shop";
    annu.coordinate = region.center;
    [_mapView addAnnotation:annu];
    
    region.center.latitude =   50.9512;
    region.center.longitude = -114.561917;
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [_mapView setRegion:region animated:YES];
    
    
    
    Annotation *anny = [[Annotation alloc] init];
    anny.title = @"Creekers";
    anny.subtitle = @"Resturant";
    anny.coordinate = region.center;
    [_mapView addAnnotation:anny];
 
   
    region.center.latitude =   50.952378;
    region.center.longitude = -114.563949;
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [_mapView setRegion:region animated:YES];
    
    
    
    Annotation *annk = [[Annotation alloc] init];
    annk.title = @"Crabapple Cottage";
    annk.subtitle = @"Clothing Shop";
    annk.coordinate = region.center;
    [_mapView addAnnotation:annk];
    
    
     self.navigationController.navigationBar.hidden = YES;
}



- (IBAction)zoomIn:(id)sender {
    
    MKCoordinateRegion Bridge = { {0.0, 0.0} , {0.0, 0.0} };
    Bridge.center.latitude = 42.292223;
    Bridge.center.longitude = -83.716840;
    Bridge.span.longitudeDelta = 0.01f;
    Bridge.span.latitudeDelta = 0.01f;
    
    
    MKUserLocation *userLocation = _mapView.userLocation;
    NSLog(@"%@",userLocation);
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance (
                                        Bridge.center, 20000, 20000);
    [_mapView setRegion:region animated:YES];
}

-(MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    
    if (annotation == mapView.userLocation)
    {
        return nil;
    }
    else
    {
        MKPinAnnotationView *MyPin=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Current"];
        //MyPin.pinColor = MKPinAnnotationColorPurple;
        
        UIButton *advertButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [advertButton addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
        
        /*MyPin.rightCalloutAccessoryView = advertButton;
         MyPin.draggable = YES;
         
         MyPin.animatesDrop=TRUE;
         MyPin.canShowCallout = YES;*/
        MyPin.highlighted = NO;
        MyPin.canShowCallout = YES;
        
        if ((pinCount =3))
            MyPin.image = [UIImage imageNamed:@"icon-reel-film"];
       
        MyPin.leftCalloutAccessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"map-popup-pic.png"]];
        MyPin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinCount++;
        return MyPin;
    }
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    
}





-(IBAction)button:(id)sender{
    NSLog(@"tapped");
}




-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
}

-(IBAction)segmentValueChange:(UISegmentedControl *)sender{
    if (sender.selectedSegmentIndex == 0) {
        [_mapView setHidden:NO];
    }else {
        _mapView.hidden = YES;
    }
}

- (IBAction)zoomInToUserLocation:(id)sender {
    
    MKUserLocation *userLocation = _mapView.userLocation;
    NSLog(@"%@",userLocation);
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance (
                                        userLocation.location.coordinate, 20, 20);
    [_mapView setRegion:region animated:YES];
}

-(void)setHeadingTitle{
    switch (self.controllerCategoryType) {
        case CategoryTypeBar:
            _lblTitle.text = @"Lounges";
            break;
        case CategoryTypeBank:
            _lblTitle.text = @"Banks/ATM";
            break;
        case CategoryTypeCoffeeShop:
            _lblTitle.text = @"Eat and Drink";
            break;
        case CategoryTypeConert:
            _lblTitle.text = @"Local Venues";
            break;
        case CategoryTypeGasStation:
            _lblTitle.text = @"Gas Stations";
            break;
        case CategoryTypeHospital:
            _lblTitle.text = @"Services";
            break;
        case CategoryTypeLocalGuide:
            _lblTitle.text = @"Attractions";
            break;
        case CategoryTypeMovieTheatre:
            _lblTitle.text = @"Entertainment";
            break;
        default:
            break;
    }
    
}

-(IBAction)backBtnTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableView Datasource/Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // return arrOfOptions.count;
    return 1;
}


- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    //NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchText];
    //searchResults = [ filteredArrayUsingPredicate:resultPredicate];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    UITableViewCell *cell;
    
    if (self.controllerListType == ListTypeNear)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"NearCell"];
        UIImageView *imgIcon = (UIImageView *)[cell.contentView viewWithTag:10];
        int value = arc4random()%7+2;
        imgIcon.image = [UIImage imageNamed:[self getIconNameForCategory:value]];
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryCell"];
        UIImageView *imgIcon = (UIImageView *)[cell.contentView viewWithTag:10];
        imgIcon.image = [UIImage imageNamed:[self getIconNameForCategory:self.controllerCategoryType]];
    }
    
    
    
    return cell;
    
}



-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"PushToDetail" sender:nil];
}

-(NSString *)getIconNameForCategory:(CategoryType)category
{
    
    switch (category) {
        case CategoryTypeBar:
            return @"icon-bar.png";
            break;
        case CategoryTypeBank:
            return @"icon-atm";
            break;
        case CategoryTypeCoffeeShop:
            return@"icon-coffee-shop";
            break;
        case CategoryTypeConert:
            return @"icon-concerrts";
            break;
        case CategoryTypeGasStation:
            return @"icon-gas-station";
            break;
        case CategoryTypeHospital:
            return @"icon-hospital";
            break;
        case CategoryTypeLocalGuide:
            return @"icon-local-guide";
            break;
        case CategoryTypeMovieTheatre:
            return @"icon-movie-theaters";
            break;
        default:
            break;
    }
    
}



#pragma mark - search


-(IBAction)searchBtnTap:(id)sender
{
    if (searchController == nil)
        searchController = (SearchViewController *) [self viewFromStoryboard:@"SearchViewController"];
    [self.navigationController.view addSubview:searchController.view];
    [searchController.searchTxtFld becomeFirstResponder];
    
}

-(IBAction)searchBtnTapped:(id)sender
{
    
    [searchController.searchTxtFld becomeFirstResponder];
}

-(IBAction)cancelBtnTap:(id)sender
{
    [searchController.view removeFromSuperview];
}



-(UIViewController *) viewFromStoryboard:(NSString *)storyboardID
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController * controller = [storyBoard instantiateViewControllerWithIdentifier:storyboardID];
    
    return controller;
}




@end
