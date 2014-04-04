//
//  LinkedContent.h
//  read-different
//
//  Created by David Jambrina on 2/15/14.
//  The purpose of this class is to keep the information needed regarding the link between youTube video and a point in the eBook identify by a CFI.
//

#import <Foundation/Foundation.h>

@interface LinkedContent : NSObject {
	@private NSString *m_packageID;
	@private NSString *m_ISBN;
	@private NSString *m_packageModificationDate;
	@private NSString *m_linkedContentCFI;
    @private NSString *m_youTubeVideoID;
    @private NSString *m_mediaType;
    @private NSString *m_idRef;
}

@property (nonatomic, readonly) NSString *packageID;
@property (nonatomic, readonly) NSString *ISBN;
@property (nonatomic, readonly) NSString *packageModificationDate;
@property (nonatomic, readonly) NSString *linkedContentCFI;
@property (nonatomic, readonly) NSString *youTubeVideoID;
@property (nonatomic, readonly) NSString *mediaType;
@property (nonatomic, readonly) NSString *idRef;

- (id)
	initWithPackageID:(NSString *)packageID
	ISBN:(NSString *)ISBN
	packageModificationDate:(NSString *)packageModificationDate
	linkedContentCFI:(NSString *)linkedContentCFI
    idRef:(NSString *)idRef
    youTubeVideoID:(NSString *)youTubeVideoID
    mediaType:(NSString *)mediaType;

- (id)initWithDictionary:(NSDictionary *)dictionary;
- (BOOL)isEqualToLinkedContent:(LinkedContent *)linkedContent;

@end
