//
//  VideoListCellDelegate.m
//  David-HalfTableView
//
//  Created by Carina Macia on 25/03/14.
//  Copyright (c) 2014 different.read. All rights reserved.
//

#import "VideoListCellDelegate.h"

@interface VideoListCellDelegate ()
 - (UIImage *)convertImageToGrayScale: (UIImage *)image;
@end

@implementation VideoListCellDelegate


// When the user starts swiping the cell this method is called
- (void)swipeTableViewCellDidStartSwiping:(MCSwipeTableViewCell *)cell {
    //NSLog(@"Did start swiping the cell!");
}

// When the user ends swiping the cell this method is called
- (void)swipeTableViewCellDidEndSwiping:(MCSwipeTableViewCell *)cell {
    //NSLog(@"Did end swiping the cell!");
}

// When the user is dragging, this method is called and return the dragged percentage from the border
- (void)swipeTableViewCell:(MCSwipeTableViewCell *)cell didSwipeWithPercentage:(CGFloat)percentage {
    //NSLog(@"Did swipe with percentage : %f", percentage);
}


/*
 * Function to convert a transparente image to grayscale in 3 steps
 */
- (UIImage *)convertImageToGrayScale: (UIImage *)image{
    
    NSLog(@"Converting thumbnail to grayscale");
    
    //Step1 > creating the opaque grayscale image: Create a opaque, grayscale image from the original image
    NSLog(@"Step1");
    CGFloat actualWidth = image.size.width;
    CGFloat actualHeight = image.size.height;
    
    CGRect imageRect = CGRectMake(0, 0, actualWidth, actualHeight);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    
    CGContextRef context = CGBitmapContextCreate(nil, actualWidth, actualHeight, 8, 0, colorSpace, kCGImageAlphaNone);
    CGContextDrawImage(context, imageRect, [image CGImage]);
    
    CGImageRef grayImage = CGBitmapContextCreateImage(context);
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    
    //Step2 > creating the mask: Create a image (mask) taking only the alpha channel from the original image
    NSLog(@"Step2");
    context = CGBitmapContextCreate(nil, actualWidth, actualHeight, 8, 0, nil, kCGImageAlphaOnly);
    CGContextDrawImage(context, imageRect, [image CGImage]);
    CGImageRef mask = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    
    //Step3 > final image by masking off against alpha image: Create a new image from the opaque image by masking it against the image formed in Step 2
    NSLog(@"Step3");

    UIImage *grayScaleImage = [UIImage imageWithCGImage:CGImageCreateWithMask(grayImage, mask) scale:image.scale orientation:image.imageOrientation];
    CGImageRelease(grayImage);
    CGImageRelease(mask);
    
    return grayScaleImage;
    
    //cell.videoThumbnailView.image = grayScaleImage;
}


- (void)setLikeModeToCell:(VideoListCell *)cell withCellContent:(VideoListCellContent *) videoListCellContent{
    NSLog(@"linkedContentLikedCell");
    
    //Setting the thumbnail image in RGB mode
    cell.videoThumbnailView.image = videoListCellContent.videoThumbnailImage;
    
    cell.linkedContentSignActionMade.image = [UIImage imageNamed:@"check"];
}

- (void)setDislikeModeToCell:(VideoListCell *)cell withCellContent:(VideoListCellContent *) videoListCellContent{
    NSLog(@"linkedContentDislikedCell");
    
    //Setting the thumbnail image in grayscale mode
    cell.videoThumbnailView.image = [self convertImageToGrayScale:videoListCellContent.videoThumbnailImage];
    
    cell.linkedContentSignActionMade.image = [UIImage imageNamed:@"cross"];
}

@end
