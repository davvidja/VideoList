//
//  LinkedContentDatabase.m
//  read-different
//
//  Created by David Jambrina on 15/02/14.
//  This class is intended to implement the comunication with Parse.
//

#import <Foundation/Foundation.h>
#import "LinkedContent.h"

@interface LinkedContentDatabase : NSObject

- (void)addLinkedContent:(LinkedContent *)linkedContent;
- (NSInteger)countSyncLinkedContentsForPackageID: (NSString *)packageID;
- (void)countAsyncLinkedContentsForPackageID: (NSString *)packageID count: (NSInteger *) countLinkedContents;
- (void)LinkedContentsForPackageID: (NSString *)packageID linkedContents: (NSMutableArray *)linkedContentsFound;
+ (LinkedContentDatabase *)shared;

@end
