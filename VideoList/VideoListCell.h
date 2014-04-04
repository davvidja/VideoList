//
//  VideoListCell.h
//  David-HalfTableView
//
//  Created by Carina Macia on 25/03/14.
//  Copyright (c) 2014 different.read. All rights reserved.
//

#import "MCSwipeTableViewCell.h"

@interface VideoListCell : MCSwipeTableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *videoThumbnailView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *authorLabel;
@property (nonatomic, weak) IBOutlet UILabel *durationLabel;

@end
