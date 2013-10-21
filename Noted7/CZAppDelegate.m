//
//  CZAppDelegate.m
//  Noted7
//
//  Created by Cecilia Zhang on 10/16/13.
//  Copyright (c) 2013 Cecilia Zhang. All rights reserved.
//

#import "CZAppDelegate.h"
#import "FrontViewController.h"
#import "PKRevealController.h"
#import "LeftMasterViewController.h"
#import "RightSettingViewController.h"
@implementation CZAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Step 1: Create your controllers.
    UIViewController *frontViewController = [[FrontViewController alloc] init];
    UIViewController *rightViewController = [[RightSettingViewController alloc] init];
    UIViewController *leftViewController = [[LeftMasterViewController alloc] init];
    
    // Step 2: Configure an options dictionary for the PKRevealController if necessary - in most cases the default behaviour should suffice. See PKRevealController.h for more option keys.
    /*
     NSDictionary *options = @{
     PKRevealControllerAllowsOverdrawKey : [NSNumber numberWithBool:YES],
     PKRevealControllerDisablesFrontViewInteractionKey : [NSNumber numberWithBool:YES]
     };
     */
    
    // Step 3: Instantiate your PKRevealController.
    self.revealController = [PKRevealController revealControllerWithFrontViewController:frontViewController
                                                                     leftViewController:leftViewController
                                                                    rightViewController:rightViewController
                                                                                options:nil];
    
    // Step 4: Set it as your root view controller.
    self.window.rootViewController = self.revealController;
    
    [self.window makeKeyAndVisible];
    return YES;
    
    // Step 5: Take a look at the Left/RightDemoViewController files. They're self-sufficient as to the configuration of their reveal widths for instance.
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
