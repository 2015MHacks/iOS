//
//  ProgressViewController.h
//  Example Application
//
//  Created by Grant Goodman on 1/17/15.
//  Copyright © 2015 Macster Software Inc.. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CircleProgressView;

@interface ProgressViewController : UIViewController
{
    IBOutlet UILabel *myCounterLabel;
    NSTimer *timer;
}

//Interface Builder UI Elements
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

//Interface Builder Actions
- (IBAction)stopButton:(id)sender;

//Strings
@property (strong, nonatomic) NSString *oldTime;

@end
