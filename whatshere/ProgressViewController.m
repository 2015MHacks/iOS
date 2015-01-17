//
//  ProgressViewController.m
//  Example Application
//
//  Created by Grant Goodman on 1/17/15.
//  Copyright © 2015 Macster Software Inc.. All rights reserved.
//

#import "ProgressViewController.h"

//Custom Header Imports
#import "EFCircularSlider.h"
#import "EFTimePickerViewController.h"

@interface ProgressViewController ()

@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ProgressViewController
{
    EFCircularSlider* minuteSlider;
    EFCircularSlider* hourSlider;
    
    BOOL timerOn;
}

int hours, minutes, seconds;
int secondsLeft;

//Allows us to create a UIColor by using a hex string.
- (UIColor *)getUIColorObjectFromHexString:(NSString *)hexStr alpha:(CGFloat)alpha
{
    //Convert the hex string to an integer.
    unsigned int hexint = [self intFromHexString:hexStr];
    
    //Create the UIColor from the hex string, while also specifying the amount of alpha, if any, we want to use.
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexint & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexint & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexint & 0xFF))/255
                    alpha:alpha];
    
    //Spits out our new color.
    return color;
}

//Converts a hex string to an integer value.
- (unsigned int)intFromHexString:(NSString *)hexStr
{
    //Define the integer.
    unsigned int hexInt = 0;
    
    //Create a custom scanner.
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    
    //Tell the scanner to skip parsing the '#' character usually placed before hex values.
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    
    //Scan the hex value.
    [scanner scanHexInt:&hexInt];
    
    //Spits out our new integer.
    return hexInt;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Sets the 'stopButton' button to a gray color, and disables it.
    [self.stopButton setTitleColor:[self getUIColorObjectFromHexString:@"#BDC3C7" alpha:1.0] forState:UIControlStateNormal];
    [self.stopButton setEnabled:NO];
    
    //Sets the view's background color to a nice dark blue.
    self.view.backgroundColor = [UIColor colorWithRed:31/255.0f green:61/255.0f blue:91/255.0f alpha:1.0f];
    
    //Create our slider in the center of the view, with a width and height of '310' each.
    CGRect minuteSliderFrame = CGRectMake(7, 100, 310, 310);
    
    //Initialize the slider in the view.
    minuteSlider = [[EFCircularSlider alloc] initWithFrame:minuteSliderFrame];
    
    //Set the background color of the slider to a clear color.
    minuteSlider.backgroundColor = [UIColor clearColor];
    
    //Set the unfilled portion's color to a frost white color.
    minuteSlider.unfilledColor = [UIColor colorWithRed:0.86f green:0.86f blue:0.86f alpha:0.4f];
    
    //Set the filled portion's color to a light green.
    minuteSlider.filledColor = [UIColor colorWithRed:155/255.0f green:211/255.0f blue:156/255.0f alpha:1.0f];
    
    //Set the marking labels, (which are actually hidden), to various increments.
    [minuteSlider setInnerMarkingLabels:@[@"15", @"10", @"15", @"20", @"25", @"30", @"35", @"40", @"45", @"50", @"55", @"60"]];
    
    //Set the font size to '0' to psuedo-hide the labels.
    minuteSlider.labelFont = [UIFont systemFontOfSize:0];
    
    //Set the width of the slider to a nice, fat 20 pixels.
    minuteSlider.lineWidth = 20;
    
    //Set the slider's minimum value to '0'.
    minuteSlider.minimumValue = 0;
    
    //Set the slider's maximum value to '10800'. (Remember, we're talkin' seconds here.)
    minuteSlider.maximumValue = 10800;
    
    #warning I'm actually not sure what this does...
    minuteSlider.labelColor = [UIColor colorWithRed:76/255.0f green:111/255.0f blue:137/255.0f alpha:1.0f];
    
    //Allows for the 'snapping' feel that we get when selecting a duration.
    minuteSlider.snapToLabels = YES;
    
    //Add the completed subview to the main view.
    [self.view addSubview:minuteSlider];
    
    //Initialize the minute timer.
    [minuteSlider addTarget:self action:@selector(minuteDidChange:) forControlEvents:UIControlEventValueChanged];
}

-(void)minuteDidChange:(EFCircularSlider*)slider
{
    //Enable the 'stopButton' button, and set it's color to a red.
    self.stopButton.enabled = YES;
    [self.stopButton setTitleColor:[self getUIColorObjectFromHexString:@"#E74C3C" alpha:1.0] forState:UIControlStateNormal];
    
    //Do the math-y bits and update the clock one second.
    int newVal = (int)slider.currentValue < 60 ? (int)slider.currentValue : 0;
    NSString *oldTime = self.timeLabel.text;
    NSRange colonRange = [oldTime rangeOfString:@":"];
    self.timeLabel.text = [NSString stringWithFormat:@"%@:%02d", [oldTime substringToIndex:colonRange.location], newVal];
    int seconds = (int)ceil(slider.currentValue);
    secondsLeft = seconds;
    [self updateCounter:timer];
    
    //This is to prevent second calculations from being way off.
    if([timer isValid])
    {
        [timer invalidate];
    }
    
    //Start our new timer, with intervals of one second, of course.
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
}

- (void)updateCounter:(NSTimer *)theTimer
{
    //If there are more than zero seconds left on the clock, count down one second.
    if(secondsLeft > 0 ){
        timerOn = YES;
        secondsLeft -- ;
        hours = secondsLeft / 3600;
        minutes = (secondsLeft % 3600) / 60;
        seconds = (secondsLeft %3600) % 60;
        myCounterLabel.text = [NSString stringWithFormat:@"%2d:%02d:%02d", hours, minutes, seconds];
    }
    
    //Otherwise, sets the 'stopButton' button to a gray color, and disables it.
    else
    {
            self.stopButton.enabled = NO;
            self.stopButton.tintColor = [self getUIColorObjectFromHexString:@"#BDC3C7" alpha:1.0];
    }
}

//You guessed it; this method stops the timer. (*gasp!*)
- (IBAction)stopButton:(id)sender
{
    //Fake it till' you make it; set the text of the timer's label to '0:00'.
    self.timeLabel.text = @"0:00";
    
    //Invalidate the timer.
    [timer invalidate];
    
    //Set the boolean value of 'timerOn' to no, to symbolize that the timer is not, in-fact, running.
    timerOn = NO;
    
    //Reset the seconds on the clock.
    seconds = 0;
    
    //Set the slider's value to '0.0'.
    [minuteSlider setCurrentValue:0.0f];
    
    //Remove the slider from the superview.
    [minuteSlider removeFromSuperview];
    
    //Create our slider in the center of the view, with a width and height of '310' each.
    CGRect minuteSliderFrame = CGRectMake(7, 100, 310, 310);
    
    //Initialize the slider in the view.
    minuteSlider = [[EFCircularSlider alloc] initWithFrame:minuteSliderFrame];
    
    //Set the background color of the slider to a clear color.
    minuteSlider.backgroundColor = [UIColor clearColor];
    
    //Set the unfilled portion's color to a frost white color.
    minuteSlider.unfilledColor = [UIColor colorWithRed:0.86f green:0.86f blue:0.86f alpha:0.4f];
    
    //Set the filled portion's color to a light green.
    minuteSlider.filledColor = [UIColor colorWithRed:155/255.0f green:211/255.0f blue:156/255.0f alpha:1.0f];
    
    //Set the marking labels, (which are actually hidden), to various increments.
    [minuteSlider setInnerMarkingLabels:@[@"15", @"10", @"15", @"20", @"25", @"30", @"35", @"40", @"45", @"50", @"55", @"60"]];
    
    //Set the font size to '0' to psuedo-hide the labels.
    minuteSlider.labelFont = [UIFont systemFontOfSize:0];
    
    //Set the width of the slider to a nice, fat 20 pixels.
    minuteSlider.lineWidth = 15;
    
    //Set the slider's minimum value to '0'.
    minuteSlider.minimumValue = 0;
    
    //Set the slider's maximum value to '10800'. (Remember, we're talkin' seconds here.)
    minuteSlider.maximumValue = 10800;
    
#warning I'm actually not sure what this does...
    minuteSlider.labelColor = [UIColor colorWithRed:76/255.0f green:111/255.0f blue:137/255.0f alpha:1.0f];
    
    //Allows for the 'snapping' feel that we get when selecting a duration.
    minuteSlider.snapToLabels = YES;
    
    //Add the completed subview to the main view.
    [self.view addSubview:minuteSlider];
    
    //Initialize the minute timer.
    [minuteSlider addTarget:self action:@selector(minuteDidChange:) forControlEvents:UIControlEventValueChanged];

    //Make our 'stopButton' button red again!
    [self.stopButton setTitleColor:[self getUIColorObjectFromHexString:@"#BDC3C7" alpha:1.0] forState:UIControlStateNormal];
}

@end
