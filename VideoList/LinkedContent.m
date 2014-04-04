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


@synthesize packageID = m_packageID;
@synthesize ISBN = m_ISBN;
@synthesize packageModificationDate = m_packageModificationDate;
@synthesize linkedContentCFI = m_linkedContentCFI;
@synthesize idRef = m_idRef;
@synthesize youTubeVideoID = m_youTubeVideoID;
@synthesize mediaType = m_mediaType;



- (void)dealloc {
	[m_packageID release];
	[m_ISBN release];
	[m_packageModificationDate release];
	[m_linkedContentCFI release];
	[m_youTubeVideoID release];
	[m_mediaType release];
    [super dealloc];
}

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
    initWithPackageID:(NSString *)packageID
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
		[self release];
		return nil;
	}

	if (self = [super init]) {
		m_packageID = [packageID retain];
		m_ISBN = [ISBN retain];
		m_packageModificationDate = [packageModificationDate retain];
		m_linkedContentCFI = [linkedContentCFI retain];
		m_idRef = [idRef retain];
		m_youTubeVideoID = [youTubeVideoID retain];
		m_mediaType = [mediaType retain];
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
