//
//  configViewController.m
//  KaleidoNav
//
//  Created by is-Lib on 4/21/14.
//  Copyright (c) 2014 is-Lib. All rights reserved.
//

#import "configViewController.h"
#import "ramViewController.h"
#import "ramview.h"

@interface configViewController ()

@end

@implementation configViewController
//@synthesize ramviewc;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UITabBarItem *tbi = [self tabBarItem];
        
        
        // Give it a label
        [tbi setTitle:@"configuration view"];
        [[self navigationItem] setTitle: @"configview"];
        

    }
    return self;
}
-(IBAction)stepperaction1:(id)sender;
{
    NSString *str = [[NSString alloc] initWithFormat:@"%d", (int) stepper1.value];
    stepperlabel1.text = str;
    //NSLog(@"Testing%@",ramviewc.speed);
    
}
-(IBAction)stepperaction2:(id)sender;
{
    NSString *str = [[NSString alloc] initWithFormat:@"%d", (int) stepper2.value];
    stepperlabel2.text = str;
    //ramviewc.speed=str;
    NSLog(@"Testing %@",str);
}
-(IBAction)slideraction:(id)sender;
{
    NSString *str = [[NSString alloc] initWithFormat:@"%d", (int) slider.value];
    sliderlabel.text = str;
    // self.delay=sliderlabel.text;
}
-(IBAction)segmentaction:(id)sender;
{
    // Three segments specified in XIB file
    if      (segment.selectedSegmentIndex == 0){
        segmentlabel.text = @"ON";
        
        NSString *str = segmentlabel.text;
        NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
        [def setObject:str forKey:@"fill"];
    }else if (segment.selectedSegmentIndex == 1){
        segmentlabel.text = @"OFF";
        NSString *str = segmentlabel.text;
        NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
        [def setObject:str forKey:@"fill"];
        
    }else
        NSLog(@"Should never happen - segmentedControlAction");
    
}
-(void)viewWillDisappear:(BOOL)animated{
    //NSLog(@"%s","config");
    //NSLog(@"%f",speedSlider.value);
    ramViewController *ramviewc=[self navigationController].viewControllers[0];
    
    ramviewc.kaleidoView.rect_width=stepper2.value;
    
    ramviewc.kaleidoView.rect_height=stepper1.value;
    
    }
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
