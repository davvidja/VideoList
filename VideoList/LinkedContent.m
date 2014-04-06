//
//  LinkedContent.m
//  read-different
//
//  Created by David Jambrina on 2/15/14.
//  The purpose of this class is to keep the information needed regarding the link between youTube video and a point in the eBook identify by a CFI.
//

#import "LinkedContent.h"


#define kKeyCFI @"CFI"
#define kKeyContainerPath @"ContainerPath"
#define kKeyIDRef @"IDRef"
#define kKeyTitle @"Title"


@implementation LinkedContent

@synthesize objectID = m_objectID;
@synthesize packageID = m_packageID;
@synthesize ISBN = m_ISBN;
@synthesize packageModificationDate = m_packageModificationDate;
@synthesize linkedContentCFI = m_linkedContentCFI;
@synthesize idRef = m_idRef;
@synthesize youTubeVideoID = m_youTubeVideoID;
@synthesize mediaType = m_mediaType;
@synthesize contentAuthor = m_contentAuthor;
@synthesize contentDuration = m_contentDuration;
@synthesize contentThumbNailURL = m_contentThumbNailURL;
@synthesize contentTitle = m_contentTitle;
@synthesize likeStatus = m_likeStatus;

/*
// Assesing if this method should be dropped
 
- (NSString *)description {
	return [@"Bookmark " stringByAppendingString:self.dictionary.description];
}
*/



/*
 // Assesing if this method should be dropped

- (NSDictionary *)dictionary {
	return @{
		kKeyCFI : m_cfi,
		kKeyContainerPath : m_containerPath,
		kKeyIDRef : m_idref,
		kKeyTitle : m_title
	};
}
*/

- (id)
    initWithObjectID:(NSString *) objectID packageID:(NSString *)packageID
    ISBN:(NSString *)ISBN
    packageModificationDate:(NSString *)packageModificationDate
    linkedContentCFI:(NSString *)linkedContentCFI
    idRef:(NSString *)idRef
    youTubeVideoID:(NSString *)youTubeVideoID
    mediaType:(NSString *)mediaType;
{
	if (linkedContentCFI == nil ||
		linkedContentCFI.length == 0 ||
		idRef == nil ||
		idRef.length == 0)
	{
		//[self release];
		return nil;
	}

	if (self = [super init]) {
        m_objectID = objectID;
		m_packageID = packageID;
		m_ISBN = ISBN;
		m_packageModificationDate = packageModificationDate;
		m_linkedContentCFI = linkedContentCFI;
		m_idRef = idRef;
		m_youTubeVideoID = youTubeVideoID;
		m_mediaType = mediaType;
        m_likeStatus = 0; //by default the like status is not defined. It should be set by the actions of the user.
	}

	return self;
}

/*
- (id)initWithDictionary:(NSDictionary *)dictionary {
	if (dictionary == nil) {
		[self release];
		return nil;
	}

	return [self
		initWithCFI:[dictionary objectForKey:kKeyCFI]
		containerPath:[dictionary objectForKey:kKeyContainerPath]
		idref:[dictionary objectForKey:kKeyIDRef]
		title:[dictionary objectForKey:kKeyTitle]];
}
*/



- (BOOL)isEqualLinkedContent:(LinkedContent *)linkedContent {
	return
		linkedContent != nil &&
        [linkedContent.packageID isEqualToString:m_packageID] &&
        [linkedContent.ISBN isEqualToString:m_ISBN] &&
        [linkedContent.packageModificationDate isEqualToString:m_packageModificationDate] &&
		[linkedContent.linkedContentCFI isEqualToString:m_linkedContentCFI] &&
        [linkedContent.youTubeVideoID isEqualToString:m_youTubeVideoID];
}


@end
