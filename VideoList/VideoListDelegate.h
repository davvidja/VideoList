//
//  VideoListDelegate.h
//  David-HalfTableView
//
//  Created by Carina Macia on 24/03/14.
//  Copyright (c) 2014 different.read. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoListCellDelegate.h"
#import "VideoListCellContent.h"
#import "VideoListCell.h"

#import "LinkedContent.h"
#import "LinkedContentDatabase.h"

@interface VideoListDelegate : NSObject <UITableViewDelegate , UITableViewDataSource, UIAlertViewDelegate>
{
    	@private NSMutableArray *m_linkedContentList;
}

@property VideoListCellDelegate *videoListCellDelegate;
@property VideoListCellContent *videoListCellContent;

@property UILabel *titleLabel;
@property UILabel *descriptionLabel;
@property UILabel *durationLabel;
@property UIImageView *videoThumbnailImageView;
@property NSMutableArray *linkedContentList;
@property NSString *packageID;
@property int mode;

//- (id) initWithImageView: (UIImageView *)imageView title:(UILabel *)title description:(UILabel *)description duration:(UILabel *)duration;

- (id)initWithMode: (int)mode;

@end
