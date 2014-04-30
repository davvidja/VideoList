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
@synthesize LinkedContentsScope;
//@synthesize titleLabel, descriptionLabel, durationLabel;
//@synthesize videoThumbnailImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    // Create a service object for executing queries
    GTLServiceYouTube *service = [[GTLServiceYouTube alloc]init];
    
    // Services which do not require sign-in may need an API key from the
    // API Console
    service.APIKey = @"AIzaSyDQZOVtBYHAv-8CXSZZo0-JDUAt3gjSfzg";
    // Enable fetches to continue in the background on iOS
    service.shouldFetchInBackground = YES;
    
    
    GTLQueryYouTube *query = [GTLQueryYouTube queryForSearchListWithPart:@"snippet"];
    query.q = @"La Sagrada Familia";
    query.type = @"video";
    query.videoEmbeddable = @"true";
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
                                               NSLog(@"Video: https://www.youtube.com/v/%@?version=3&f=videos&app=youtube_gdata",[[item.JSON objectForKey:@"id"] objectForKey:@"videoId"]);
                                               NSLog(@"Title: %@",[[item.JSON objectForKey:@"snippet"] objectForKey:@"title"]);
                                               NSLog(@"thumbnails: %@",[[[[item.JSON objectForKey:@"snippet"] objectForKey:@"thumbnails"] objectForKey:@"medium"] objectForKey:@"url"]);
                                           }

                                       }
                                   }];
    
   
    

    
    [LinkedContentsScope addTarget:self
                         action:@selector(linkedContentsScopeChanged)
               forControlEvents:UIControlEventValueChanged];

    
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
    
    self.videoListDelegate.packageID = @"code.google.com.epub-samples.moby-dick-basic";
    
    [self.videoListTable setDelegate: self.videoListDelegate];
    [self.videoListTable setDataSource:self.videoListDelegate];
    
    NSLog(@"View: %@", [self.view.subviews[0] restorationIdentifier]);

    
    [self.view.subviews[0] reloadData];

}


- (void) linkedContentsScopeChanged{
    NSLog(@"Selector changed");
    self.videoListDelegate = [[VideoListDelegate alloc] initWithMode:1];
    
    self.videoListDelegate.packageID = @"code.google.com.epub-samples.moby-dick-basic";
    
        [self.view.subviews[0] reloadData];
    
}

@end
