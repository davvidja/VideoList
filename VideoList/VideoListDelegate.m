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
@synthesize linkedContentList = m_linkedContentList;
@synthesize packageID;


- (id)init
{
    self = [super init];
    
    self.videoListCellDelegate = [[VideoListCellDelegate alloc] init];
    
    //self.videoListCellContent = [[VideoListCellContent alloc] initWithVideoURL:path title:title author:author duration:duration];
    
    self.mode = -1;
    self.userScope = -1;
    
    return self;
}

- (id)initWithMode: (int)mode
{
    self = [self init];
    
    self.mode = mode;
    
    switch (self.mode) {
        case 1:
            NSLog(@"Loading VideoList table with videos from Parse");
            
            self.linkedContentList = [[NSMutableArray alloc] init];
            
            //to include here the initialization of the Parse model that will retrieve the data to be loaded in the table
            self.packageID = @"code.google.com.epub-samples.moby-dick-basic";
            [[LinkedContentDatabase shared] LinkedContentsForPackageID:packageID linkedContents:m_linkedContentList];
            
            NSLog(@"Number of elements retrieved: %d",[self.linkedContentList count]);
            
            [[LinkedContentDatabase shared] addingDataFromTheSourceToLinkedContents:m_linkedContentList];
            
            
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


- (id)initWithMode: (int)mode userScope: (int)userScope {
    
    self = [self initWithMode:mode];
    
    self.userScope = userScope;
    
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
    // Return the number of rows in the section.
    return [self.linkedContentList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //MCSwipeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoListCell" forIndexPath:indexPath];
    VideoListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoListCell" forIndexPath:indexPath];
    
    
    switch (self.mode) {
        case 1:
            NSLog(@"Configuring cell in section %d and row %d for Parse", indexPath.section, indexPath.row);
            
            // Configure the cell...
            [self configureLinkedContentCell:cell forRowAtIndexPath:indexPath];
            
            break;
            
        case 2:
            NSLog(@"Configuring cell in section %d and row %d for YouTube", indexPath.section, indexPath.row);
            
            //to include here the initialization of the YouTube model that will retrieve the data to be loaded in the table
            
            break;
            
        default:
            NSLog(@"No starting mode selected. VideoList will be empty");
            break;

    }
    
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

- (void)configureLinkedContentCell:(VideoListCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIView *checkView = [self viewWithImageName:@"check"];
    UIColor *greenColor = [UIColor colorWithRed:85.0 / 255.0 green:213.0 / 255.0 blue:80.0 / 255.0 alpha:1.0];
    
    UIView *crossView = [self viewWithImageName:@"cross"];
    UIColor *redColor = [UIColor colorWithRed:232.0 / 255.0 green:61.0 / 255.0 blue:14.0 / 255.0 alpha:1.0];
    

    // Setting the default inactive state color to the tableView background color
    //[cell setDefaultColor:self.tableView.backgroundView.backgroundColor];
    
 
    [cell setDelegate:self.videoListCellDelegate];
    
    if (indexPath.row <= (self.linkedContentList.count-1)) {
    
        
        #warning the model providing data to the table should have been evolved in order to treat registers with other media types, to avoid blank cells in the TableView
        LinkedContent *linkedContent = self.linkedContentList[indexPath.row];
        
                
        self.videoListCellContent = [[VideoListCellContent alloc] initWithVideoURL:linkedContent.contentThumbNailURL title:linkedContent.contentTitle author:linkedContent.contentAuthor duration:linkedContent.contentDuration];
        
        cell.titleLabel.text = self.videoListCellContent.title;
        cell.authorLabel.text = self.videoListCellContent.author;
        cell.durationLabel.text = self.videoListCellContent.duration;
        cell.ratingLabel.text = [NSString stringWithFormat:@"%d", linkedContent.ratingBalance];
                

        cell.videoThumbnailView.image = self.videoListCellContent.videoThumbnailImage;
        cell.linkedContentSignActionMade.image = NULL;
        
        switch (linkedContent.likeStatus) {
            case 1:
                NSLog(@"Setting the dislike apparience of the cell when the cell is being created");
                [self.videoListCellDelegate setLikeModeToCell:cell withCellContent: self.videoListCellContent];

                break;
            case 2:
                NSLog(@"Setting the dislike apparience of the cell when the cell is being created");
                [self.videoListCellDelegate setDislikeModeToCell:cell withCellContent: self.videoListCellContent];

            default:
                break;
        }
        

        
        //------------------------------------------------
        //User likes the content -> setting the actions
        //
        [cell setSwipeGestureWithView:checkView color:greenColor mode:MCSwipeTableViewCellModeSwitch state:MCSwipeTableViewCellState1 completionBlock:^ (MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
        #warning To include here the functionality needed when a linkedContent is wanted by user.
            NSLog(@"Did swipe \"Checkmark\" cell");
            
            if (linkedContent.likeStatus != 1) {
                linkedContent.likeStatus = 1;
                
                [(VideoListCellDelegate *)((VideoListCell *)cell.delegate) setLikeModeToCell: (VideoListCell *)cell withCellContent:self.videoListCellContent];
                
                [[LinkedContentDatabase shared] updateRatingBalanceForObjectID:linkedContent.objectID rating:1];
            }
        }];
        
        //------------------------------------------------
        //User dislikes the content -> setting the actions
        //
        [cell setSwipeGestureWithView:crossView color:redColor mode:MCSwipeTableViewCellModeSwitch state:MCSwipeTableViewCellState3 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
        #warning To include here the functionality needed when a linkedContent is disliked by user.
            NSLog(@"Did swipe \"Cross\" cell");
            
            if (linkedContent.likeStatus != 2) {
                linkedContent.likeStatus = 2;
            
                [(VideoListCellDelegate *)((VideoListCell *)cell.delegate) setDislikeModeToCell: (VideoListCell *)cell withCellContent:self.videoListCellContent];
            
                [[LinkedContentDatabase shared] updateRatingBalanceForObjectID:linkedContent.objectID rating:-1];
            }
        }];
    }
    
}

- (UIView *)viewWithImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeCenter;
    return imageView;
}


@end
