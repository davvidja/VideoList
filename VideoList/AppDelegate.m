//
//  AppDelegate.m
//  VideoList
//
//  Created by Carina Macia on 04/04/14.
//  Copyright (c) 2014 different.read. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    //The following 2 lines are intended to setup the app to work with Parse.
    [Parse setApplicationId:@"dJmqxU1k0b8BgzDHA5pibwOXaNVZ9H0sFhsHYiC6"
                  clientKey:@"S2p0be1qwscmOeCmomN7ZSKi4Qe7xXZDRt8nOvGO"];
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    NSLog (@"Parse initialized");
    
    // The following code is intended to setup the app to work with YouTube service
    if(!_service)
    {
        // Create a service object for executing queries
        GTLServiceYouTube *youTubeService = [[GTLServiceYouTube alloc]init];
        self.service = youTubeService;
        // This services do not require sign-in the API key is from the
        // API Console developer account
        youTubeService.APIKey = @"AIzaSyDQZOVtBYHAv-8CXSZZo0-JDUAt3gjSfzg";
        // Enable fetches to continue in the background on iOS
        youTubeService.shouldFetchInBackground = YES;
        NSLog (@"YouTube service initialized");
    }
  
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

