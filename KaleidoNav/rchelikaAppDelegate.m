//
//  rchelikaAppDelegate.m
//  KaleidoNav
//
//  Created by is-Lib on 4/21/14.
//  Copyright (c) 2014 is-Lib. All rights reserved.
//

#import "rchelikaAppDelegate.h"
#import "configViewController.h"
#import "ramViewController.h"
#import "ramview.h"
@interface rchelikaAppDelegate()
@end


@implementation rchelikaAppDelegate
@synthesize window;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    //self.window.backgroundColor = [UIColor whiteColor];
    // Set the random number generator seed from the system clock.
    //srandom(time(0));
    
    
    // Create view for VC
    CGRect bounds        = [self.window bounds];
    ramview *rview    = [[ramview alloc] initWithFrame:bounds];
    rview.backgroundColor = [UIColor whiteColor];
    
    // Create a VC, add view to VC
    ramViewController *ramvc = [[ramViewController alloc] init];
    configViewController *ramcvc = [[configViewController alloc]init];
    ramvc.ramcvc=ramcvc;
    UINavigationController *navController = [[UINavigationController alloc]
                                             initWithRootViewController: ramvc];
    [window setRootViewController: navController];
    /* UITabBarController *tbc = [[UITabBarController alloc] init];
     NSArray *viewControllers = [NSArray arrayWithObjects:ramvc, rcvc, nil];
     [tbc setViewControllers:viewControllers];
     [[self window] setRootViewController:tbc];*/
    [ramvc setView: rview];
    //[self setramvc:@"ramViewController"]
    
    // Make the VC the root VC
    //self.window.rootViewController = ramvc;
    
    // Make window background white

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
