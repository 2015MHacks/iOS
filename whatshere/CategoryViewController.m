//
//  CategoryViewController.m
//  WhatsHere
//
//  Created by Rajkumar Sharma on 05/08/14.
//  Copyright (c) 2014 Jimmy. All rights reserved.
//

#import "CategoryViewController.h"
#import "ListViewController.h"

@interface CategoryViewController()

@end

@implementation CategoryViewController

- (void)viewDidLoad

{
    
    self.title = @"Main";
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
 self.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)categoryButtonTapped:(UIButton *)sender{
    [self performSegueWithIdentifier:@"PushToListing" sender:sender];
}

-(IBAction)nearByButtonTapped:(UIButton *)sender{
    [self performSegueWithIdentifier:@"PushToListing" sender:sender];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PushToListing"]){
        UIButton *btn = (UIButton *)sender;
        ListViewController *controller = (ListViewController *)segue.destinationViewController;
        if (btn.tag==1){
            controller.controllerListType = ListTypeNear;
        } else {
            controller.controllerCategoryType = (CategoryType) btn.tag;
            controller.controllerListType = ListTypeCategory;
        }
    }
}



@end
