//
//  configViewController.h
//  KaleidoNav
//
//  Created by is-Lib on 4/21/14.
//  Copyright (c) 2014 is-Lib. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ramViewController.h"

@interface configViewController : UIViewController
{
    ramViewController *ramviewc;
    
    
    IBOutlet UIStepper *stepper1;
    IBOutlet UILabel *stepperlabel1;
    IBOutlet UILabel *label1;
    IBOutlet UIStepper *stepper2;
    IBOutlet UILabel *sliderlabel;
    IBOutlet UISlider *slider;
    IBOutlet UISegmentedControl *segment;
    IBOutlet UILabel *segmentlabel;
    
    IBOutlet UILabel *stepperlabel2;
    IBOutlet UILabel *label2;
    

}
-(IBAction)stepperaction1:(id)sender;
-(IBAction)stepperaction2:(id)sender;
-(IBAction)slideraction:(id)sender;
-(IBAction)segmentaction:(id)sender;

//@property(strong,nonatomic)ramViewController *ramviewc;

//@property (nonatomic)         CGFloat    delay;


@end
