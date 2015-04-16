//
//  ramViewController.m
//  KaleidoNav
//
//  Created by is-Lib on 4/21/14.
//  Copyright (c) 2014 is-Lib. All rights reserved.
//

#import "ramViewController.h"
#import "configViewController.h"

@interface ramViewController ()

@end

@implementation ramViewController
@synthesize ramcvc;
@synthesize speed = _speed;
@synthesize timer;
@synthesize kaleidoView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.delay = 0.2;
        UITabBarItem *tbi = [self tabBarItem];
        
        
        // Give it a label
        [tbi setTitle:@"kaleidoview"];
        
        CGRect bounds = [[UIScreen mainScreen] bounds];
        kaleidoView = [[ramview alloc] initWithFrame:bounds ];
        kaleidoView.backgroundColor=[UIColor whiteColor];
        // Get the tab bar item
        self.view=kaleidoView;
        //self.delay=.1;
        [[self navigationItem] setTitle: @"kaleidoview"];
        

    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated
{
    //printf(">>> %s\n", [[NSStringFromSelector(_cmd) description] UTF8String]);
    
    // Get timer, Target/Action pattern used here
    NSTimer *timer = [NSTimer timerWithTimeInterval: self.delay
                                             target: self.view
                                           selector: @selector(setNeedsDisplay)
                                           userInfo: nil
                                            repeats: YES];
    
    // Get runloop, add timer to runloop
    self.runloop = [NSRunLoop currentRunLoop];
    [self.runloop addTimer:timer forMode: NSDefaultRunLoopMode];
    NSLog(@"TESTING %@",_speed);
    
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"Touch");          // One or the other
    //printf("%s", [(@">>> Touch\n") UTF8String]);
   // ramcvc=[[configViewController alloc]init];
    [[self navigationController]
     pushViewController: ramcvc
     animated: YES];
}
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
//==============================================================================
-(void) viewWillDisappear:(BOOL)animated
{
    // Clear
    self.runloop = nil;
}

//==============================================================================
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
