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
@synthesize inputQuery;
//@synthesize titleLabel, descriptionLabel, durationLabel;
//@synthesize videoThumbnailImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
    
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
    
    // Referencing the application delegate to get access to the "service" property
    GTLServiceYouTube *YotubeService = [(AppDelegate *)[[UIApplication sharedApplication] delegate] service];
    
    // Create a query
    GTLQueryYouTube *query = [GTLQueryYouTube queryForSearchListWithPart:@"snippet"];
    query.q = inputQuery.text;
    query.type = @"video";
    query.videoEmbeddable = @"true";
    query.safeSearch = @"strict";
    query.videoDimension = @"2d";
    query.maxResults = 20;
    
    // Execute the query
    GTLServiceTicket *ticket = [YotubeService executeQuery:query
                                         completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
                                             // This callback block is run when the fetch completes
                                             if (error == nil)
                                             {
                                                 GTLYouTubeSearchListResponse *products = object;
                                                 for (GTLYouTubeSearchResult *item in products)
                                                 {
                                                     NSLog(@"Title: %@",item.snippet.title);
                                                     NSLog(@"Channel: %@",item.snippet.channelTitle);
                                                     NSString *videoId = [item.identifier.JSON valueForKey:@"videoId"];
                                                     NSLog(@"VideoId: %@",videoId);
                                                     NSString *videoURL = [NSString stringWithFormat:@"https://www.youtube.com/v/%@?version=3&f=videos&app=youtube_gdata",videoId];
                                                     NSLog(@"VideoURL: %@",videoURL);
                                                     
                                                     GTLYouTubeThumbnailDetails *thumbnails = item.snippet.thumbnails;
                                                     GTLYouTubeThumbnail *thumbnail = thumbnails.medium;
                                                     NSString *thumbnailString = thumbnail.url;
                                                     NSLog(@"thumbnailURL:%@",thumbnailString);
                                                 }
                                             }
                                             else
                                             {
                                                 NSLog(@"Error: %@", error.description);
                                             }
                                         }];
    
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
    
    [self.view.subviews[0] reloadData];

}
@end
