//
//  UserDataManager.h
//  ROR_Bible
//
//  Created by MacBook on 9/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HighlightItem.h"

@interface UserDataManager : NSObject {
	NSMutableArray* mHighlightItems;
	NSMutableArray* mBookmarks;
}

@property (nonatomic, retain) NSMutableArray* mHighlightItems;
@property (nonatomic, retain) NSMutableArray* mBookmarks;

+ (NSMutableArray*) getHighlightItems;
+ (NSMutableArray*) getBookmarks;
+ (void) saveData;
+ (void) loadData;
+ (void) addHighlightItem:(NSString*) word withColor:(NSString*) strcolor;
+ (void) addBookmark:(NSString*) sbookmark;
@end
