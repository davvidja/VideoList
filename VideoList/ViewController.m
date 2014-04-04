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
    
    self.videoListDelegate = [[VideoListDelegate alloc] init];
    
    [self.videoListTable setDelegate: self.videoListDelegate];
    [self.videoListTable setDataSource:self.videoListDelegate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
