//
//  SettingsViewController.h
//  WhatsHere
//
//  Created by Rajkumar Sharma on 05/08/14.
//  Copyright (c) 2014 Jimmy. All rights reserved.
//

#import "ParentViewController.h"

@interface SettingsViewController : UITableViewController {

IBOutlet UISwitch *theswitch;
IBOutlet UILabel *label;
    

}

-(IBAction)onoff:(id)sender;




@end
