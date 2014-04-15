//
//  AppDelegate.h
//  VideoList
//
//  Created by Carina Macia on 04/04/14.
//  Copyright (c) 2014 different.read. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "GTLYouTube.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) GTLServiceYouTube *service;

@end
