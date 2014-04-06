//
//  VideoListCellDelegate.h
//  David-HalfTableView
//
//  Created by Carina Macia on 25/03/14.
//  Copyright (c) 2014 different.read. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VideoListCell.h"
#import "VideoListCellContent.h"

//#import "MCSwipeTableViewCell.h"

@interface VideoListCellDelegate : NSObject <MCSwipeTableViewCellDelegate>

//Methods from MCSwipeTableViewCellDelegate protocol
- (void)swipeTableViewCellDidStartSwiping:(MCSwipeTableViewCell *)cell;
- (void)swipeTableViewCellDidEndSwiping:(MCSwipeTableViewCell *)cell;
- (void)swipeTableViewCell:(MCSwipeTableViewCell *)cell didSwipeWithPercentage:(CGFloat)percentage;

//Own methods of VideoListCellDelegate
- (void)setLikeModeToCell:(VideoListCell *)cell withCellContent:(VideoListCellContent *) videoListCellContent;
- (void)setDislikeModeToCell:(VideoListCell *)cell withCellContent:(VideoListCellContent *) videoListCellContent;


@end
