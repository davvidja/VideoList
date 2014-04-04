//
//  VideoListCellContent.h
//  David-HalfTableView
//
//  Created by Carina Macia on 25/03/14.
//  Copyright (c) 2014 different.read. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoListCellContent : NSObject
{
    NSData *data;
    NSURL *url;
}

@property UIImage *videoThumbnailImage;
@property NSString *title;
@property NSString *author;
@property NSString *duration;

- (id) initWithVideoURL: (NSString *)urlString title: (NSString *)titleString author: (NSString *)authorString duration: (NSString *)durationString;
/*
- (void)setSwipeGestureWithView:(UIView *)view
                          color:(UIColor *)color
                           mode:(MCSwipeTableViewCellMode)mode
                          state:(MCSwipeTableViewCellState)state
                completionBlock:(MCSwipeCompletionBlock)completionBlock;
 */

@end
