//
//  VideoListCellContent.m
//  David-HalfTableView
//
//  Created by Carina Macia on 25/03/14.
//  Copyright (c) 2014 different.read. All rights reserved.
//

#import "VideoListCellContent.h"

@implementation VideoListCellContent

@synthesize videoThumbnailImage;
@synthesize title, author, duration;

- (id) initWithVideoURL:(NSString *)urlString title:(NSString *)titleString author:(NSString *)authorString duration:(NSString *)durationString
{
    self = [super init];
    
    if (self) {
        
        //Setting the image
        url = [NSURL URLWithString:urlString];
        data = [NSData dataWithContentsOfURL:url];
        self.videoThumbnailImage = [[UIImage alloc] initWithData:data];
        
        //Setting the strings that will be used in the labels of the cell
        title = titleString;
        author = authorString;
        duration = durationString;
    }

    
    return self;
}

@end
