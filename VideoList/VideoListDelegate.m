//
//  VideoListDelegate.m
//  David-HalfTableView
//
//  Created by Carina Macia on 24/03/14.
//  Copyright (c) 2014 different.read. All rights reserved.
//

#import "VideoListDelegate.h"

@interface VideoListDelegate ()

@end

@implementation VideoListDelegate

@synthesize videoListCellDelegate;
@synthesize videoListCellContent;
@synthesize titleLabel, descriptionLabel, durationLabel;
@synthesize videoThumbnailImageView;


- (id)init
{
    self = [super init];
    
    self.videoListCellDelegate = [[VideoListCellDelegate alloc] init];
    
    id path = @"https://i1.ytimg.com/vi/g_d5R6Il0II/mqdefault.jpg";
    id title = @"Apple ad 1984";
    id author = @"Read-different team";
    id duration = @"1:00";
    
    self.videoListCellContent = [[VideoListCellContent alloc] initWithVideoURL:path title:title author:author duration:duration];
    
    //[self.videoListTable setDelegate:self];
    //[self.videoListTable setDataSource:self];
    
    return self;
}

- (id)initWithMode: (int)mode
{
    self = [self init];
    
    switch (mode) {
        case 1:
            NSLog(@"Loading VideoList table with videos from Parse");
            
            //to include here the initialization of the Parse model that will retrieve the data to be loaded in the table
            
            break;
            
        case 2:
            NSLog(@"Loading VideoList table with videos from YouTube");
            
            //to include here the initialization of the YouTube model that will retrieve the data to be loaded in the table
            
            break;
            
        default:
            NSLog(@"No starting mode selected. VideoList will be empty");
            break;
    }
    
    return self;
}


/*
- (id)initWithImageView:(UIImageView *)imageView title:(UILabel *)title description:(UILabel *)description duration:(UILabel *)duration
{
    self = [self init];
    
    self.videoThumbnailImageView = imageView;
    self.titleLabel = title;
    self.descriptionLabel = description;
    self.durationLabel = duration;
    
    return self;
}
*/

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //MCSwipeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoListCell" forIndexPath:indexPath];
    VideoListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoListCell" forIndexPath:indexPath];
    
    // Configure the cell...
    [self configureCell:cell forRowAtIndexPath:indexPath];


    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)configureCell:(VideoListCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIView *checkView = [self viewWithImageName:@"check"];
    UIColor *greenColor = [UIColor colorWithRed:85.0 / 255.0 green:213.0 / 255.0 blue:80.0 / 255.0 alpha:1.0];
    
    UIView *crossView = [self viewWithImageName:@"cross"];
    UIColor *redColor = [UIColor colorWithRed:232.0 / 255.0 green:61.0 / 255.0 blue:14.0 / 255.0 alpha:1.0];
    

    // Setting the default inactive state color to the tableView background color
    //[cell setDefaultColor:self.tableView.backgroundView.backgroundColor];
    
    
#warning Here it is the place where I found a bug that I was not able to solved
    //[cell setDelegate:self];
    [cell setDelegate:self.videoListCellDelegate];
    
    cell.titleLabel.text = videoListCellContent.title;
    cell.authorLabel.text = videoListCellContent.author;
    cell.durationLabel.text = videoListCellContent.duration;
    cell.videoThumbnailView.image = videoListCellContent.videoThumbnailImage;
    
    
    [cell setSwipeGestureWithView:checkView color:greenColor mode:MCSwipeTableViewCellModeSwitch state:MCSwipeTableViewCellState1 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
        NSLog(@"Did swipe \"Checkmark\" cell");
    }];
    
    
    [cell setSwipeGestureWithView:crossView color:redColor mode:MCSwipeTableViewCellModeSwitch state:MCSwipeTableViewCellState3 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
        NSLog(@"Did swipe \"Cross\" cell");
    }];
    
}

- (UIView *)viewWithImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeCenter;
    return imageView;
}


@end
