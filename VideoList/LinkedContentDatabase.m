//
//  LinkedContentDatabase.m
//  read-different
//
//  Created by David Jambrina on 15/02/14.
//  This class is intended to implement the comunication with Parse.
//

#import "LinkedContentDatabase.h"
#import <Parse/Parse.h>



@implementation LinkedContentDatabase

- (void)addLinkedContent:(LinkedContent *)linkedContent{
    PFObject *rdLinkedContents = [PFObject objectWithClassName:@"rdLinkedContents"];
    rdLinkedContents[@"packageID"] = linkedContent.packageID;
    rdLinkedContents[@"ISBN"] = linkedContent.ISBN;
    rdLinkedContents[@"packageModificationDate"] = linkedContent.packageModificationDate;
    rdLinkedContents[@"publicationResourceRelativeIRI"] = linkedContent.idRef;
    rdLinkedContents[@"linkedContentCFI"] = linkedContent.linkedContentCFI;
    rdLinkedContents[@"youTubeVideoID"] = linkedContent.youTubeVideoID;
    rdLinkedContents[@"mediaType"] = linkedContent.mediaType;

    [rdLinkedContents saveInBackground];
}

+ (LinkedContentDatabase *)shared {
	static LinkedContentDatabase *shared = nil;
    
	if (shared == nil) {
		shared = [[LinkedContentDatabase alloc] init];
	}
    
	return shared;
}



//
//  This method count the number of LinkedContents for a specific package ID
//
- (void)LinkedContentsForPackageID: (NSString *)packageID linkedContents: (NSMutableArray *)linkedContentsFound{
   
    NSError *error;
    NSArray *parseRecordsFound;
    LinkedContent *linkedContent;
    //NSArray *linkedContentsFound;
    
    NSLog(@">>> LinkedContentsForPackageID: %@", packageID);

    
    PFQuery *query = [PFQuery queryWithClassName:@"rdLinkedContents"];
    [query whereKey:@"packageID" equalTo:packageID];
    
    parseRecordsFound =[query findObjects: &error];
    

    
    for (PFObject *object in parseRecordsFound) {
        
        NSLog(@"%@", object);
        
        linkedContent = [[LinkedContent alloc]initWithPackageID:object[@"packageID"] ISBN:object[@"ISBN"] packageModificationDate:object[@"packageModificationDate"] linkedContentCFI:object[@"linkedContentCFI"] idRef:object[@"publicationResourceRelativeIRI"] youTubeVideoID:object[@"youTubeVideoID"] mediaType:object[@"mediaType"]];
        
        [linkedContentsFound addObject:linkedContent];
        
        [linkedContent release];
        
        /*
        NSLog(@"packageID: %@",object[@"packageID"]);
        NSLog(@"ISBN: %@",object[@"ISBN"]);
        NSLog(@"packageModificationDate: %@",object[@"packageModificationDate"]);
        NSLog(@"publicationResourceRelativeIRI: %@",object[@"publicationResourceRelativeIRI"]);
        NSLog(@"linkedContentCFI: %@",object[@"linkedContentCFI"]);
        NSLog(@"youTubeVideoID: %@",object[@"youTubeVideoID"]);
        NSLog(@"mediaType: %@",object[@"mediaType"]);
        */
        
        NSLog(@">>> Exiting LinkedContentsForPackageID");

    }
    
    
    /*
    __block NSInteger auxVariable;
    
    NSError *error;
    
    PFQuery *query = [PFQuery queryWithClassName:@"rdLinkedContents"];
    [query whereKey:@"packageID" equalTo:packageID];
    
    //[query countObjects:(& error)];
    
    [query countObjectsInBackgroundWithBlock:(PFIntegerResultBlock)^(int count, NSError *error) {
        //auxVariable = count;
        if (!error) {
            // The count request succeeded. Log the count
            NSLog(@"Package ID %@-> Number of linked contents %d games", packageID, count);
            *countLinkedContents = count;
        } else {
            NSLog(@"Package ID %@-> Error %@", packageID, error);
            *countLinkedContents = 0;
        }
    }];
    
    NSLog(@"Number of linked contents returned: %d", *countLinkedContents);
    */
}


//
//  This method count the number of LinkedContents for a specific package ID
//
- (void)countAsyncLinkedContentsForPackageID: (NSString *)packageID count: (NSInteger *) countLinkedContents{
    
    __block NSInteger auxVariable;
    
    NSError *error;
    
    PFQuery *query = [PFQuery queryWithClassName:@"rdLinkedContents"];
    [query whereKey:@"packageID" equalTo:packageID];
    
    //[query countObjects:(& error)];
    
    [query countObjectsInBackgroundWithBlock:(PFIntegerResultBlock)^(int count, NSError *error) {
        //auxVariable = count;
        if (!error) {
            // The count request succeeded. Log the count
            NSLog(@"Package ID %@-> Number of linked contents %d games", packageID, count);
            *countLinkedContents = count;
        } else {
            NSLog(@"Package ID %@-> Error %@", packageID, error);
            *countLinkedContents = 0;
        }
    }];
    
    NSLog(@"Number of linked contents returned: %d", *countLinkedContents);
}

//
//  This method count the number of LinkedContents for a specific package ID making the query in a syncronous way
//
- (NSInteger)countSyncLinkedContentsForPackageID: (NSString *)packageID{
    
    NSInteger countLinkedContents;
    
    NSError *error;
    
    PFQuery *query = [PFQuery queryWithClassName:@"rdLinkedContents"];
    [query whereKey:@"packageID" equalTo:packageID];
    
    countLinkedContents = [query countObjects:(& error)];
    
    NSLog(@"Number of linked contents returned: %d", countLinkedContents);
    
    return countLinkedContents;
}



@end
