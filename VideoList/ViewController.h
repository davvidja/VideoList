//
//  ViewController.h
//  David-HalfTableView
//
//  Created by Carina Macia on 24/03/14.
//  Copyright (c) 2014 different.read. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoListDelegate.h"



@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *LinkedContentsScope;
@property (weak, nonatomic) IBOutlet UITableView *videoListTable;
@property (strong,nonatomic) VideoListDelegate *videoListDelegate;
/*
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UIImageView *videoThumbnailImageView;
*/
- (IBAction)YouTube:(id)sender;
- (IBAction)Parse:(id)sender;
- (void) linkedContentsScopeChanged;
@end
