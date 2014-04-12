//
//  ViewController.m
//  David-HalfTableView
//
//  Created by Carina Macia on 24/03/14.
//  Copyright (c) 2014 different.read. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize videoListDelegate;
@synthesize videoListTable;
//@synthesize titleLabel, descriptionLabel, durationLabel;
//@synthesize videoThumbnailImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create a service object for executing queries
    GTLServiceYouTube *service = [[GTLServiceYouTube alloc]init];
    
    // Services which do not require sign-in may need an API key from the
    // API Console
    service.APIKey = @"AIzaSyA0d-WuKvwoa4GbkLfUzIOTRdYBsomp7FE";
    
    
    GTLQueryYouTube *query = [GTLQueryYouTube queryForSearchListWithPart:@"id"];
    query.q = @"La Sagrada Familia";
    query.type = @"video";
    query.safeSearch = @"strict";
    query.videoDimension = @"2d";
    query.maxResults = 10;
   
    // Execute the query
    GTLServiceTicket *ticket = [service executeQuery:query
                                   completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
                                       // This callback block is run when the fetch completes
                                       if (error == nil) {
                                           GTLCollectionObject *products = object;
                                           
                                           // GTLShoppingProducts derives from GTLCollectionObject, so it supports
                                           // iteration of items and subscript access to items.
                                           for (GTLObject *item in products) {
                                               // Print the name of each product result item
                                               NSLog(@"%@", item.JSONString);
                                           }
                                       }
                                   }];
    
    
    
    /*
    self.videoListDelegate = [[VideoListDelegate alloc] initWithMode:1];
    
    [self.videoListTable setDelegate: self.videoListDelegate];
    [self.videoListTable setDataSource:self.videoListDelegate];
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)YouTube:(id)sender {
    self.videoListDelegate = [[VideoListDelegate alloc] initWithMode:2];
    
    [self.videoListTable setDelegate: self.videoListDelegate];
    [self.videoListTable setDataSource:self.videoListDelegate];
    
    NSLog(@"View: %@", [self.view.subviews[0] restorationIdentifier]);
    
    [self.view.subviews[0] reloadData];
}

- (IBAction)Parse:(id)sender {
    self.videoListDelegate = [[VideoListDelegate alloc] initWithMode:1];
    
    [self.videoListTable setDelegate: self.videoListDelegate];
    [self.videoListTable setDataSource:self.videoListDelegate];
    
    [self.view.subviews[0] reloadData];

}
@end
