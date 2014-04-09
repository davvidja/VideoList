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
